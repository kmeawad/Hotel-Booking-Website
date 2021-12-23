-- View with service information
CREATE VIEW serviceStuff AS
SELECT * from provide p natural join service;

-- View for specific customer Information (dynamically created in the javascript code everytime a user logs in and not in MySQL workbench)
CREATE VIEW string AS
SELECT c.customerID, fName, lName, email, ccType, ccNumber, ccCVV, c.postalCode, street, city, province, bookingID, startDate, endDate, roomID
FROM CustomerLocation cl, Customer c left join Booking b ON c.customerID = b.customerID
WHERE c.postalCode = cl.postalCode AND email = "${email}";

-- Trigger to increase the price of the room everytime it is booked
CREATE TRIGGER increase_price
AFTER INSERT
ON booking
FOR EACH ROW
UPDATE room SET roomCost = roomCost * 1.05
WHERE new.roomID = room.roomID;

-- Table Creation
CREATE SCHEMA hoteldb;
USE hoteldb;

CREATE TABLE CustomerLocation(
    postalCode VARCHAR(11) NOT NULL,
    street VARCHAR(50),
    province VARCHAR(30),
    city VARCHAR(30),
    PRIMARY KEY (postalCode)
);
 
CREATE TABLE HotelLocation(
    postalCode VARCHAR(11) NOT NULL,
    street VARCHAR(50),
    province VARCHAR(30),
    city VARCHAR(30) NOT NULL,
    PRIMARY KEY (postalCode)
);

CREATE TABLE CustomerLogin(
    email VARCHAR(40) NOT NULL,
    password VARCHAR(40) NOT NULL,
    PRIMARY KEY (email)
);

CREATE TABLE Customer(
    customerID BIGINT NOT NULL auto_increment,
    fName VARCHAR(20) NOT NULL,
    lName VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL,
    ccType VARCHAR(20),
    ccNumber BIGINT,
    ccCVV INT,
    postalCode VARCHAR(11),
    FOREIGN KEY (email) REFERENCES CustomerLogin(email) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (postalCode) REFERENCES CustomerLocation(postalCode) ON UPDATE CASCADE on delete SET NULL,
    PRIMARY KEY (customerID),
    UNIQUE(email)
);

 CREATE TABLE HotelName(
    hotelEmail VARCHAR(40) NOT NULL,
    hotelName VARCHAR(20) NOT NULL,
    PRIMARY KEY (hotelEmail)
);
CREATE TABLE Hotel(
    hotelID INTEGER NOT NULL auto_increment,
    hotelEmail VARCHAR(40) NOT NULL,
    hotelType VARCHAR(20) NOT NULL DEFAULT "Hotel" CHECK(hotelType IN ("Hotel","Motel","Inn","Resort")) ,
    hotelDescription VARCHAR(500),
    starLevel tinyint CHECK(starLevel BETWEEN 1 AND 5),
    postalCode VARCHAR(11) NOT NULL,
    PRIMARY KEY (hotelID),
	FOREIGN KEY (hotelEmail) REFERENCES HotelName(hotelEmail) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (postalCode) REFERENCES hotellocation(postalCode) ON UPDATE CASCADE ON DELETE NO ACTION
);
 
CREATE TABLE Feedback(
feedbackDescription VARCHAR(500),
starRating tinyint CHECK(starRating BETWEEN 1 AND 5) NOT NULL,
customerID BIGINT NOT NULL,
hotelID INTEGER NOT NULL,
FOREIGN KEY (customerID) REFERENCES Customer(customerID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (hotelID) REFERENCES Hotel(hotelID) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY (customerID, hotelID)
);
 
CREATE TABLE Room(
    roomID INTEGER NOT NULL auto_increment,
    roomNumber VARCHAR(5) NOT NULL,
    roomCategory varchar(20),
    roomDescription varchar(50),
    roomCost INTEGER NOT NULL,
    hotelID INTEGER NOT NULL,
    FOREIGN KEY (hotelID) REFERENCES Hotel(hotelID) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (roomID),
    UNIQUE(hotelID, roomNumber)
);
 
CREATE TABLE Booking(
    bookingID bigint NOT NULL auto_increment,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    customerID BIGINT NOT NULL ,
    roomID INTEGER NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customer(customerID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (roomID) REFERENCES Room(roomID) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (bookingID)
);
 
CREATE TABLE Service(
    serviceID INT NOT NULL auto_increment,
    serviceType VARCHAR(20),
    price INT NOT NULL DEFAULT 0,
    serviceDescription VARCHAR(100),
    PRIMARY KEY (serviceID)
);
 
CREATE TABLE Provide(
    hotelID INTEGER NOT NULL,
    serviceID INTEGER NOT NULL,
    FOREIGN KEY (hotelID) REFERENCES Hotel(hotelID) ON UPDATE CASCADE ON DELETE cascade,
    FOREIGN KEY (serviceID) REFERENCES Service(serviceID) ON UPDATE CASCADE ON DELETE cascade,
    PRIMARY KEY (serviceID, hotelID)
);
 
CREATE TABLE Reserve(
    serviceDate DATE NOT NULL,
    bookingID bigint NOT NULL,
    serviceID INTEGER NOT NULL,
    FOREIGN KEY (bookingID) REFERENCES Booking(bookingID) ON UPDATE CASCADE ON DELETE cascade,
    FOREIGN KEY (serviceID) REFERENCES Service(serviceID) ON UPDATE CASCADE ON DELETE cascade,
    PRIMARY KEY (serviceDate, bookingID, serviceID)
);
