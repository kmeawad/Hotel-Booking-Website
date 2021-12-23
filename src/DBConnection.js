const mysql = require('mysql');
//function to initiate connection
function newConnection(){
    let conn = mysql.createConnection({
        host:'localhost',
        user:'root',
        password:`password`,
        database:'hoteldb'
    });
    return conn
}

module.exports = newConnection;