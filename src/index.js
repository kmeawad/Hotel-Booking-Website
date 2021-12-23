const newConnection = require('./DBConnection'); // new connection to the database
const express = require('express'); // express server
const cookieParser = require('cookie-parser'); //to create cookies


const app = express();
app.use(cookieParser("my little secret"));

//dynamic handling
app.use(express.urlencoded({
    extended: true
}))

// checks if email and password are correct, if so, logs the user in
app.get('/login', (req, res)=>{
    let email = req.query.email; 
    let password = req.query.pwd;

    let conn = newConnection();
    conn.connect();
        conn.query(`SELECT * FROM CustomerLogin WHERE email = "${email}" AND password = "${password}";`
        ,(err, rows, fields) => {
            if(err)
                console.log(err)
            else    
                if(rows.length == 1){
                    getCustomerID();
                    
                }
                else if(rows.length == 0)
                    res.send("incorrect")
        });
        
        // gets the customer id
        function getCustomerID(){
            conn.query(`select * from customer c where EXISTS (select cl.email from customerLogin cl where c.email = "${email}");`,(err, rows, fields) => {
                if(err){
                    console.log(err)
                }
                else{
                    let customerID = rows[0].customerID;
                    createView(customerID);
                }
            });
        }

        // create a new View based on the customer id
        function createView(customerID){
            let string = "customerInfo" + customerID;
            conn.query(`DROP VIEW ${string};`, (err, rows, fields) => {if(err)console.log(err); });

            conn.query(`CREATE VIEW ${string} AS
                        SELECT c.customerID, fName, lName, email, ccType, ccNumber, ccCVV, c.postalCode, street, city, province, bookingID, startDate, endDate, roomID
                        FROM CustomerLocation cl, Customer c left join Booking b ON c.customerID = b.customerID
                        WHERE c.postalCode = cl.postalCode AND email = "${email}";`, 
                        (err, rows, fields) => {
                            if(err)
                                console.log(err); 
                            else{
                                res.cookie("id", customerID, {signed : true});
                                res.send("correct");
                            }
                        }
            );
            conn.end();
        }


})

// inserts a new customer into the database
app.post('/sign-up', (req,res) =>{
    let email = (req.body.email === '') ? null : req.body.email, password = (req.body.pwd === '') ? null : req.body.pwd;
    let fName = (req.body.fName === '') ? null : req.body.fName , lName = (req.body.lName === '') ? null : req.body.lName;
    let postal = (req.body.postal === '') ? null : req.body.postal, street = (req.body.street === '') ? null : req.body.street, city = (req.body.city === '') ? null : req.body.city, province = (req.body.province === '') ? null : req.body.province;
    let ccType = req.body.ccType , ccNo = (req.body.ccNo === '') ? null : req.body.ccNo, cvv = (req.body.cvv === '') ? null : req.body.cvv;
    console.log(email+" "+password+" "+fName+" "+lName+" "+postal+" "+street+" "+city+" "+province+" "+ccType+" "+ccNo+" "+cvv )

    let conn = newConnection();
    conn.connect();
        conn.query(`SELECT * FROM CustomerLogin WHERE email = "${email}";`
        ,(err, rows, fields) => {
            if(err)
                console.log(err)
            else{    
                if(rows.length == 0)
                    insertAccount();
                else    
                    res.send("incorrect");     
            }
        });
    
    // if the email is unique then insert customer information into the database
    function insertAccount(){
        if(postal != null){
            conn.query(`INSERT INTO customerLocation Values(
                "${postal}", "${street}", "${province}", "${city}"
            );`
            ,(err, rows, fields) => {
                if(err)
                    console.log(err)}
            );
        }

        conn.query(`INSERT INTO customerLogin Values(
            "${email}", "${password}"
        );`
        ,(err, rows, fields) => {
            if(err)
                console.log(err)}
        );

        if(postal != null){
        conn.query(`INSERT INTO customer VALUES (
            default, "${fName}", "${lName}", "${email}", "${ccType}", ${ccNo}, ${cvv}, "${postal}"
            );`
            ,(err, rows, fields) => {
                if(err)
                    console.log(err)
                res.send("correct")
            }
        );}else{
            conn.query(`INSERT INTO customer VALUES (
                default, "${fName}", "${lName}", "${email}", "${ccType}", ${ccNo}, ${cvv}, ${postal}
                );`
                ,(err, rows, fields) => {
                    if(err)
                        console.log(err)
                    res.send("correct")
                }
            );
        }
        conn.end();
    }
})

// drops the customer's View
app.get('/logout', (req, res) => {
    let id =  req.signedCookies.id;
    let string = "customerInfo" + id;
    let conn = newConnection();
    conn.connect();
        conn.query(`DROP VIEW ${string};`, (err, rows, fields) => {if(err)console.log(err); });
    conn.end();
    res.send("dropped")
})

app.get('/getView', (req, res) => {
    let id =  req.signedCookies.id;
    let string = "customerInfo" + id; 

    conn = newConnection();
    conn.connect();

        conn.query(`SELECT * FROM ${string}`, (err, rows, fields) =>{
            if(err)
                console.log(err);
            else
                res.json(rows);
        });

    conn.end();
})

// updates the customer information in the View Account page
app.post('/updateCustomerInfo', (req, res)=>{
    let id =  req.signedCookies.id;
    
    let postal = (req.body.postal === '') ? null : req.body.postal, street = (req.body.street === '') ? null : req.body.street, city = (req.body.city === '') ? null : req.body.city, province = (req.body.province === '') ? null : req.body.province;
    let ccType = req.body.ccType , ccNo = (req.body.ccNo === '') ? null : req.body.ccNo, cvv = (req.body.cvv === '') ? null : req.body.cvv;
 
    let conn = newConnection();
    conn.connect();
        conn.query(`UPDATE customerLocation SET postalCode='${postal}',  street='${street}',  city='${city}',  province='${province}' WHERE postalCode = (SELECT postalCode from customer WHERE customerID = ${id});`, (err, rows, fields) =>{
            if(err)
                console.log(err);
        });

        conn.query(`UPDATE customer SET ccType='${ccType}',  ccNumber=${ccNo},  ccCVV=${cvv} WHERE customerID = ${id};`, (err, rows, fields) =>{
            if(err)
                console.log(err);
            else
                res.send("correct");
        })
    conn.end();
})

// gets the rooms from the database given the search filters
app.get('/getRooms', (req, res)=> {
    let startDate = req.query.startDate, endDate = req.query.endDate;
    let city = req.query.city, province = req.query.province;
    let sortBy = req.query.sortBy;
    let star5 = req.query.star5, star4 = req.query.star4, star3 = req.query.star3, star2 = req.query.star2, star1 = req.query.star1;
    let minprice = parseInt(req.query.minprice), maxprice = parseInt(req.query.maxprice);

    console.log(startDate+ " "+endDate+ " "+city+ " "+province+ " "+sortBy+ " "+star5+ " "+star4+ " "+star3+ " "+star2+ " "+ minprice+ ' '+maxprice);
    
    conn = newConnection();
    conn.connect();
        conn.query(`SELECT h.hotelId, hotelName, h.hotelEmail, hotelType, city, province, h.postalCode, starLevel, roomCategory, roomCost, roomID FROM hotelLocation hl join hotel h on hl.postalCode=h.postalCode natural join room r natural join hotelName
                    WHERE h.starLevel IN (${star5}, ${star4}, ${star3}, ${star2}, ${star1})
                    AND city = "${city}" AND province = "${province}" 
                    AND roomCost <= ${maxprice}
                    AND roomCost >= ${minprice}
                    AND roomID NOT IN (select roomID from booking where startDate <= DATE("${startDate}") AND endDate >= DATE("${startDate}"))
                    AND roomID NOT IN (select roomID from booking where startDate <= DATE("${endDate}") AND endDate >= DATE("${endDate}"))
                    AND roomID NOT IN (select roomID from booking where startDate >= DATE("${startDate}") AND endDate <= DATE("${endDate}"))
                    ORDER BY ${sortBy};`, (err, rows) => {
                        if(err)
                            console.log(err);
                        else
                            res.json(rows)

                    });
                    
    conn.end();
})

// gets the services of a specific hotel
app.get('/services', (req,res) => {
    let hotelId = req.query.hotelId;

    let conn = newConnection();
    
    conn.connect();
        conn.query(`select * from serviceStuff where hotelid = ${hotelId};`, (err, rows) => {
            if(err)
                console.log(err);
            else{ 
                res.json(rows)
            }
        });

    conn.end();
})

// inserts the bookings into the database
app.post('/insertBooking', (req,res) => {
    let services = JSON.parse(req.body.services);
    console.log(services);
    let customerId =  req.signedCookies.id;
    let roomId = req.body.roomId, startDate = req.body.startDate, endDate = req.body.endDate;

    let conn = newConnection();
    
    conn.connect();
    conn.query(`select max(bookingId) as maxId from booking;`,(err, rows)=>{
            if(err)
                console.log(err)
            else{ 
                let maxBookingId = rows[0].maxId + 1
                insertReserve(maxBookingId)
            }
        }
    );

    function insertReserve(bookingId){
        conn.query(`INSERT INTO booking 
            VALUES (${bookingId}, DATE("${startDate}"), DATE("${endDate}"), ${customerId}, ${roomId})`,(err)=>{
                if(err)
                    console.log(err)
            }
        );
        for(s of services){
            conn.query(`INSERT INTO reserve 
                VALUES (DATE("${startDate}"), ${bookingId}, ${s})`,(err)=>{
                    if(err)
                        console.log(err);
                }
            );
        }
        res.send("inserted")
        conn.end();
    } 
    
})



app.get('/getHotels', (req, res)=>{
    let hotelName = req.query.hotelname;
    let hotelCity = req.query.city;

    conn = newConnection();
    conn.connect();
    conn.query(`SELECT h.hotelId, hotelName, count(r.roomId) AS count, h.postalCode, city, h.hotelEmail, starLevel, hotelType
    FROM hotel h natural join hotelName hn natural join hotelLocation, room r
    WHERE r.hotelID = h.hotelID AND roomId NOT IN (select roomId from booking) 
    AND postalCode IN (SELECT postalCode from hotelLocation where city LIKE "${hotelCity}%")
    AND hn.hotelName LIKE "${hotelName}%"
    GROUP BY hotelId;`, (err, rows) => {
        if(err)
            console.log(err);
        else 
            res.json(rows)
    });
    conn.end();
})

app.get('/getBooking', (req, res) => {
    let customerID = req.signedCookies.id;

    let conn = newConnection();
    conn.connect();

        conn.query(`SELECT b.bookingID, hotelName, hotelType, city, province, postalCode, startDate, endDate, s.serviceType FROM booking b
        NATURAL JOIN room
        NATURAL JOIN hotel
        NATURAL JOIN hotelname
        NATURAL JOIN hotellocation 
        LEFT JOIN reserve r ON b.bookingId = r.bookingId
        LEFT JOIN service s ON r.serviceID = s.serviceID
        WHERE b.customerID = ${customerID}; `
        , (err, rows) => {
            if(err)
                console.log(err);
            else 
                res.json(rows);
            
        });
    conn.end();
})


app.use(express.static('static'));
app.listen(80);
