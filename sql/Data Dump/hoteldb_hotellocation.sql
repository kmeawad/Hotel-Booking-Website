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
-- Table structure for table `hotellocation`
--

DROP TABLE IF EXISTS `hotellocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotellocation` (
  `postalCode` varchar(11) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  PRIMARY KEY (`postalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotellocation`
--

LOCK TABLES `hotellocation` WRITE;
/*!40000 ALTER TABLE `hotellocation` DISABLE KEYS */;
INSERT INTO `hotellocation` VALUES ('0049-0054','Mandrake','QuÃ©bec','L\'Ã‰piphanie'),('0268-1217','Elmside','Alberta','Lamont'),('0574-7050','Anthes','QuÃ©bec','Coaticook'),('0781-1079','Comanche','QuÃ©bec','ChÃ¢teau-Richer'),('16252-527','Holmberg','Alberta','Bassano'),('16590-072','Harper','Ontario','Timmins'),('35356-621','Killdeer','QuÃ©bec','Lorraine'),('37000-901','Fallview','QuÃ©bec','RiviÃ¨re-du-Loup'),('41520-198','Sherman','Ontario','Milton'),('42549-655','Alpine','Ontario','Clarence-Rockland'),('49349-841','6th','Ontario','Lambton Shores'),('50580-352','Florence','QuÃ©bec','Baie-Saint-Paul'),('52125-446','East','QuÃ©bec','Pont-Rouge'),('52685-345','Washington','British Columbia','Penticton'),('53897-000','Cordelia','QuÃ©bec','Saint-Eustache'),('58686-013','Crownhardt','Alberta','Viking'),('60505-2503','Washington','Alberta','Fairview'),('63629-4514','Declaration','Alberta','Swan Hills'),('75847-1601','Coolidge','British Columbia','Armstrong'),('98132-664','Packers','Nunavut','Pangnirtung'),('N2J 3E2','Hyde Park Rd','Ontario','London'),('N2L 2N0','Western Rd','Ontario','London'),('N3J 3KW','Platts Lane','Ontario','London'),('N6H 3T9','Oxford St W','Ontario','London'),('N6W 4U3','Wonderland Rd N','Ontario','London');
/*!40000 ALTER TABLE `hotellocation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06 18:45:07
