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
-- Table structure for table `hotelname`
--

DROP TABLE IF EXISTS `hotelname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelname` (
  `hotelEmail` varchar(40) NOT NULL,
  `hotelName` varchar(20) NOT NULL,
  PRIMARY KEY (`hotelEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelname`
--

LOCK TABLES `hotelname` WRITE;
/*!40000 ALTER TABLE `hotelname` DISABLE KEYS */;
INSERT INTO `hotelname` VALUES ('awrennallc@unicef.org','Keylex'),('ayearsley6@theatlantic.com','Regrant'),('bauld3@chron.com','Home Ing'),('blambertzg@themeforest.net','Bitchip'),('bleipoldte@whitehouse.gov','Alpha'),('ccrocettoj@nbcnews.com','Trippledex'),('cgratland1@squarespace.com','Tempsoft'),('dbellay8@nytimes.com','Zontrax'),('dedes2@blogs.com','Subin'),('egell9@mac.com','Sonsing'),('ffantone4@t.co','Prodder'),('hilton@gmail.com','Hilton'),('iseiler7@rambler.ru','Subin'),('jspringfordd@rambler.ru','Wrapsafe'),('lgiacovazzof@printfriendly.com','Kanlam'),('lrylancei@mail.ru','Trippledex'),('marriot@gmail.com','Marriot'),('nchessill0@uiuc.edu','Flowdesk'),('pullman@gmail.com','Pullman'),('ramada@gmail.com','Ramada'),('sfeandera@java.com','Flowdesk'),('sheraton@gmai.com','Sheraton'),('tcheshireh@flavors.me','Zoolab'),('tvernazzab@google.ca','Konklab'),('vsnoddy5@altervista.org','Domainer');
/*!40000 ALTER TABLE `hotelname` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06 18:45:06
