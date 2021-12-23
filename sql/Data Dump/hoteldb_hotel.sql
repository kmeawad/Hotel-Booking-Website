CREATE DATABASE  IF NOT EXISTS `hoteldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hoteldb`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: hoteldb
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotelID` int NOT NULL AUTO_INCREMENT,
  `hotelEmail` varchar(40) NOT NULL,
  `hotelType` varchar(20) NOT NULL DEFAULT 'Hotel',
  `hotelDescription` varchar(500) DEFAULT NULL,
  `starLevel` tinyint DEFAULT NULL,
  `postalCode` varchar(11) NOT NULL,
  PRIMARY KEY (`hotelID`),
  KEY `hotelEmail` (`hotelEmail`),
  KEY `postalCode` (`postalCode`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`hotelEmail`) REFERENCES `hotelname` (`hotelEmail`) ON UPDATE CASCADE,
  CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`postalCode`) REFERENCES `hotellocation` (`postalCode`) ON UPDATE CASCADE,
  CONSTRAINT `hotel_chk_1` CHECK ((`hotelType` in (_utf8mb4'Hotel',_utf8mb4'Motel',_utf8mb4'Inn',_utf8mb4'Resort'))),
  CONSTRAINT `hotel_chk_2` CHECK ((`starLevel` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'nchessill0@uiuc.edu','Inn','Offers ultimate comfort and luxury',5,'16590-072'),(2,'cgratland1@squarespace.com','Inn','Free parking and a modern restaurant serving hearty cuisine',5,'42549-655'),(3,'dedes2@blogs.com','Resort','Free parking and a modern restaurant serving hearty cuisine',3,'60505-2503'),(4,'bauld3@chron.com','Motel','Hotel has easy access to many of the cityâ€™s top attractions',4,'16252-527'),(5,'ffantone4@t.co','Hotel','Hotel has easy access to many of the cityâ€™s top attractions',1,'98132-664'),(6,'vsnoddy5@altervista.org','Hotel','Guest rooms have wireless internet and satellite TV',5,'0268-1217'),(7,'ayearsley6@theatlantic.com','Motel','Offers ultimate comfort and luxury',3,'63629-4514'),(8,'iseiler7@rambler.ru','Hotel','Well connected by public transport',4,'50580-352'),(9,'dbellay8@nytimes.com','Resort','Offers ultimate comfort and luxury',2,'41520-198'),(10,'egell9@mac.com','Hotel','Offers ultimate comfort and luxury',1,'0049-0054'),(11,'sfeandera@java.com','Hotel','Well connected by public transport',4,'75847-1601'),(12,'tvernazzab@google.ca','Resort','Offers ultimate comfort and luxury',4,'0574-7050'),(13,'awrennallc@unicef.org','Resort','We offer a gym',1,'37000-901'),(14,'jspringfordd@rambler.ru','Motel','Offers ultimate comfort and luxury',3,'49349-841'),(15,'bleipoldte@whitehouse.gov','Hotel','Free parking and a modern restaurant serving hearty cuisine',1,'35356-621'),(16,'lgiacovazzof@printfriendly.com','Motel','We offer a gym',3,'0781-1079'),(17,'blambertzg@themeforest.net','Motel','We offer a gym',5,'52125-446'),(18,'tcheshireh@flavors.me','Motel','Free parking and a modern restaurant serving hearty cuisine',4,'52685-345'),(19,'lrylancei@mail.ru','Motel','Free parking and a modern restaurant serving hearty cuisine',2,'53897-000'),(20,'ccrocettoj@nbcnews.com','Motel','Offers ultimate comfort and luxury',4,'58686-013'),(21,'marriot@gmail.com','Inn','Offers ultimate comfort and luxury',5,'N6H 3T9'),(22,'hilton@gmail.com','Resort','Guest rooms have wireless internet and satellite TV',3,'N6W 4U3'),(23,'pullman@gmail.com','Motel','Hotel has easy access to many of the cityâ€™s top attractions, ',4,'N2J 3E2'),(24,'sheraton@gmai.com','Hotel','Free parking and a modern restaurant serving hearty cuisine',3,'N2L 2N0'),(25,'ramada@gmail.com','Inn','Offers ultimate comfort and luxury',2,'N3J 3KW');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06 18:45:04
