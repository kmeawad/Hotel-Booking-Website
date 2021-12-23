let activeBtn;
let info = []; 
let bodyHtml = document.getElementById('content');

// change color of button if active
function setActive(button){
    if(activeBtn != null)
        activeBtn.classList.remove('active');
    activeBtn = button;
    button.classList.add('active'); 
}

//function to drop view when logging out
function dropView(){
    let xReq = new XMLHttpRequest();
    xReq.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            window.location.href = './'
        }
    };

    xReq.open('GET', `/logout`, true);
    xReq.send();
}

//function to get all the information of the current client;
function getView(){
    let xReq = new XMLHttpRequest();
    xReq.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            info = JSON.parse(this.responseText);
            console.log(info);
            //return info;
        }
    };;

    xReq.open('GET', `/getView`, true);
    xReq.send();
}

// gets the customer information from the database
function getAccountInfo(){
    let content = `<h1>Account Info</h1>
    <div>Welcome, ${info[0].fName+" "+info[0].lName}</div>
    <div>Email: ${info[0].email}</div>
    <table>
        <tr>
        <tr><td><b>Address</b></td></tr>
        <tr>
            <td>Postal: </td> 
            <td><input id='postal' type='text' value='${info[0].postalCode}'/></td> 
            <td>Street: </td> 
            <td><input id='street' type='text' value='${info[0].street}'/></td>
            <td>City: </td> 
            <td><input id='city' type='text' value='${info[0].city}'/></td>
            <td>Province: </td> 
            <td><input id='province' type='text' value='${info[0].province}'/></td>
        <tr> 

        <tr><td><b>Credit card info</b></td></tr>
        <tr>
            <td>Credit Card Type:</td>
            <td>
                <select id="ccType">
                    <option selected value=${info[0].ccType}>${info[0].ccType}</option>
                    <option value=""></option>
                    <option value="mastercard">Mastercard</option>
                    <option value="visa">Visa</option>
                    <option value="americanexpress">American Express</option>
                </select>
            </td>
            <td>Credit Card Number:</td>
            <td><input id='ccNo' type='number' value="${info[0].ccNumber}"/></td>
            <td>CVV:</td>
            <td><input id='cvv' type='number' value="${info[0].ccCVV}" max="999"/></td>
        </tr>
    </table>
    <br/>
    <div>Update Account Info  <button onclick="updateCustomerInfo()">Update</button></div>`;
    
    bodyHtml.innerHTML = content;
}

// updates the customer information 
function updateCustomerInfo(){
    let xReq = new XMLHttpRequest();
    xReq.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "correct"){
                window.location.href = './home.html'
            }
        }
    };
    let postal = document.getElementById("postal"),street = document.getElementById("street"),city = document.getElementById("city"),province = document.getElementById("province");
    let ccType = document.getElementById("ccType"),ccNo = document.getElementById("ccNo"),cvv = document.getElementById("cvv");

    xReq.open('POST', `/updateCustomerInfo`, true);
    xReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xReq.send(`postal=${postal.value}&street=${street.value}&city=${city.value}&province=${province.value}&ccType=${ccType.value}&ccNo=${ccNo.value}&cvv=${cvv.value}`);
        
}

// changes the HTML page content the when the Find Room button is clicked
function findRoomButton(){
    let content = `<h1>Find Room</h1>
    <div style="width: 100%;">
        <div class="search" style="width: 25%;float: left;">
            <form action="javascript:getRooms()">
                <input required id='startDate' type='date' placeholder="yyyy-mm-dd"/>
                <input required id='endDate' type='date' placeholder="yyyy-mm-dd"/>
                <br/>
                <input required id='city' type='text' placeholder="city"/>
                <input required id='province' type='text' placeholder="province"/>
                <br/>
                Sort By: 
                <select id="sortBy">
                    <option value="roomCost">Price: low to high</option>
                    <option value="roomCost DESC">Price: high to low</option>
                </select>
                <br/>
                Price: <input id="minprice" type="number" min="0" max="999999" placeholder="Min." style="width: max-content">
                <input id="maxprice" type="number" min="0" max="999999" placeholder="Max." style="width: max-content">
                <br/>
                Filter Star Levels:
                <br/>
                    <input id='5star' type='checkbox' checked/>5 stars
                    <input id='4star' type='checkbox' checked/>4 stars
                    <input id='3star' type='checkbox' checked/>3 stars
                    <input id='2star' type='checkbox' checked/>2 stars
                    <input id='1star' type='checkbox' checked/>1 stars
                <br/><!-- button onclick="getRooms()" style="float:right; margin-right: 12%; margin-left: 5%; width: 85%;">Submit</button -->
                <input type="submit" style="float:right; margin-right: 12%; margin-left: 5%; width: 85%;" value="Search!"/>
            </form>
        </div>
        <div class="results" style="width: 75%; float: right;">
            No Results found
        </div>
    </div>`;

    bodyHtml.innerHTML = content;
}

let services =[];
let chosenRoomId;
let chosenStartDate, chosenEndDate;

// retrieves the rooms from the server
function getRooms(){
    let resultDiv = document.getElementsByClassName("results")[0];

    let xReq = new XMLHttpRequest();
    xReq.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let content = `<table class="resultDisplay"><tr><th>Hotel Name</th>
                            <th>Hotel Email</th>
                            <th>Hotel Type</th>
                            <th>City</th>
                            
                            <th>Postal Code</th>
                            <th>Room Category</th>
                            <th>Room Cost</th>
                            <th>Stars</th>
                            <th></th>
                            </tr>`;
            rows = JSON.parse(this.responseText);
            console.log(rows);
            for(r of rows){
                content += `<tr class="room${r.roomID}">`;
                    content += `<td>${r.hotelName}</td>`
                    content += `<td>${r.hotelEmail}</td>`
                    content += `<td>${r.hotelType}</td>`
                    content += `<td>${r.city}</td>`
                    content += `<td>${r.postalCode}</td>`
                    content += `<td>${r.roomCategory}</td>`
                    content += `<td>${r.roomCost}</td>`
                    content += `<td>${r.starLevel}</td>`
                    content += `<td><button class="${r.hotelId}" name="${r.roomID}" onclick="getServices(this.className, this.name)">Book</button></td>`
                content += '</tr>'                
            }
            content += '</table>'
            if(rows.length == 0)
                content = 'No Results found' //if rows was empty display content is empty 

            resultDiv.innerHTML = content;  
        }
    };

    let startDate = document.getElementById("startDate").value, endDate = document.getElementById("endDate").value;
    let city = document.getElementById("city").value, province = document.getElementById("province").value;
    let sortBy = document.getElementById("sortBy").value;
    let maxprice = (document.getElementById("maxprice").value == '')? 999999:document.getElementById("maxprice").value, minprice = (document.getElementById("minprice").value == '')? 0:document.getElementById("minprice").value;
    let star5 =(document.getElementById("5star").checked)? 5 : 0, star4 = (document.getElementById("4star").checked)? 4 : 0, star3 = (document.getElementById("3star").checked)? 3 : 0, star2 = (document.getElementById("2star").checked)? 2 : 0, star1 = (document.getElementById("1star").checked)? 1 : 0;

    chosenStartDate= startDate;
    chosenEndDate = endDate; //store the dates that the user chose 

    xReq.open('GET', `/getRooms?startDate=${startDate}&endDate=${endDate}&city=${city}&province=${province}&sortBy=${sortBy}&star5=${star5}&star4=${star4}&star3=${star3}&star2=${star2}&star1=${star1}&maxprice=${maxprice}&minprice=${minprice}`, true);
    xReq.send();
    
}

// gets the services from the server
function getServices(hotelId, roomId){
    let xReq = new XMLHttpRequest();
    xReq.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let rows = JSON.parse(this.responseText)
            let content = `<form action="javascript:confirmBooking()">
                            Add services:`;
            services =[];
            //create check box for each service provided by the hotel
            for(r of rows){
                services.push(r.serviceID)
                content += `<br/><input id="${r.serviceID}" type="checkbox"/>${r.serviceType}  Price: ${r.price}  Service Description: ${r.serviceDescription}`
            }

            content += `<br/><input type="submit">`
            content += `</form>`;
            bodyHtml.innerHTML = content;
        }
    }

    chosenRoomId = roomId; 
    xReq.open('GET', `/services?hotelId=${hotelId}&roomId=${roomId}`, true);
    xReq.send();

}

// saves the booking to the database
function confirmBooking(){
    let checkedServices = [];
    //get each service checked and put it in a new array 
    for(s of services){
        let test = document.getElementById(s);
        if(test.checked){
            checkedServices.push(s)
        }
    }

    let xReq = new XMLHttpRequest();
    xReq.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText=="inserted")
                window.location.href = './home.html';
        }
    };
    
    xReq.open('POST', "/insertBooking", true);
    xReq.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xReq.send(`services=${JSON.stringify(checkedServices)}&roomId=${chosenRoomId}&startDate=${chosenStartDate}&endDate=${chosenEndDate}`); 
}


// changes the HTML page content when button Find Hotel button is clicked
function findHotelButton(){
    let content=`<h1>Find Hotel</h1>
    <div>
        <div class=hotelsearch> 
            <input id='hotelname' type='text' placeholder='Enter Hotel Name' oninput="javascript:getHotels()"/>
            <input id='hotelCity' style="min-height: 20px;" type='text' placeholder='City' oninput="javascript:getHotels()"/>
            <br/>
            <br/>
        </div>
        <div class='hotelresults'>No Results Found</div>
    </div>`;
    bodyHtml.innerHTML = content;
}

// gets the hotel information from the server
function getHotels(){
    let resultDiv = document.getElementsByClassName("hotelresults")[0];

    let xReq=new XMLHttpRequest();
    xReq.onreadystatechange=function(){
        if(this.readyState==4&&this.status==200){
            result = JSON.parse(this.responseText);
            console.log(result);
            let content = `<table class="resultDisplay" style="width: 100%">
                            <tr><th>Hotel Name</th>
                            <th>Hotel Email</th>
                            <th>Hotel Type</th>
                            <th>City</th>
                            <th>Postal Code</th>
                            <th>Unbooked rooms</th>
                            <th>Stars</th>
                            </tr>`;
       
            for(r of result){
                content += `<tr>`;
                    content += `<td>${r.hotelName}</td>`
                    content += `<td>${r.hotelEmail}</td>`
                    content += `<td>${r.hotelType}</td>`
                    content += `<td>${r.city}</td>`
                    content += `<td>${r.postalCode}</td>`
                    content += `<td>${r.count}</td>`
                    content += `<td>${r.starLevel}</td>`
                content += '</tr>'                
            } 
            content += '</table>';

            if(result.length == 0)
                content = "No Results Found";
            resultDiv.innerHTML = content;
        }
    };

    let hotelName=document.getElementById("hotelname").value;
    let city = document.getElementById("hotelCity").value;
    
    xReq.open('Get', `/getHotels?hotelname=${hotelName}&city=${city}`, true);
    xReq.send();
}

// changes the HTML content to the customer's bookings
function viewBookingsButton(){
    let xReq = new XMLHttpRequest();
    xReq.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let content = `<div>
                            <h1> Your Bookings </h1>
                            <table class="resultDisplay"><tr><th>Booking ID</th>
                            <th>Hotel Name</th>
                            <th>Hotel Type</th>
                            <th>City</th>
                            <th>Province</th>
                            <th>Postal Code</th>
                            <th>Check In Date</th>
                            <th>Check Out Date</th>
                            <th>Service Type</th>
                            </tr>`
                            ;
            console.log(this.responseText);
            rows = JSON.parse(this.responseText);
            console.log(rows);
            for(r of rows){
                content += `<tr class="booking${r.bookingID}">`;
                content += `<td>${r.bookingID}</td>`
                    content += `<td>${r.hotelName}</td>`
                    content += `<td>${r.hotelType}</td>`
                    content += `<td>${r.city}</td>`
                    content += `<td>${r.province}</td>`
                    content += `<td>${r.postalCode}</td>`
                    let startDate = new Date(r.startDate).toDateString();
                    let endDate = new Date(r.endDate).toDateString();
                    content += `<td>${startDate}</td>`
                    content += `<td>${endDate}</td>`
                    content += `<td>${r.serviceType}`
                content += '</tr>'
           }
           console.log(rows);
           content += '</table>'
            content +=  '</div>'

            bodyHtml.innerHTML = content;
        }
    };

    xReq.open('GET', '/getBooking', true);
    xReq.send();
}

