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
-- Temporary view structure for view `bookingcount`
--

DROP TABLE IF EXISTS `bookingcount`;
/*!50001 DROP VIEW IF EXISTS `bookingcount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bookingcount` AS SELECT 
 1 AS `hotelName`,
 1 AS `roomNumber`,
 1 AS `roomID`,
 1 AS `BookedCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customerinfo1031`
--

DROP TABLE IF EXISTS `customerinfo1031`;
/*!50001 DROP VIEW IF EXISTS `customerinfo1031`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerinfo1031` AS SELECT 
 1 AS `customerID`,
 1 AS `fName`,
 1 AS `lName`,
 1 AS `email`,
 1 AS `ccType`,
 1 AS `ccNumber`,
 1 AS `ccCVV`,
 1 AS `postalCode`,
 1 AS `street`,
 1 AS `city`,
 1 AS `province`,
 1 AS `bookingID`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `roomID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `servicestuff`
--

DROP TABLE IF EXISTS `servicestuff`;
/*!50001 DROP VIEW IF EXISTS `servicestuff`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `servicestuff` AS SELECT 
 1 AS `serviceID`,
 1 AS `hotelID`,
 1 AS `serviceType`,
 1 AS `price`,
 1 AS `serviceDescription`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `americanexcustomers`
--

DROP TABLE IF EXISTS `americanexcustomers`;
/*!50001 DROP VIEW IF EXISTS `americanexcustomers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `americanexcustomers` AS SELECT 
 1 AS `customerID`,
 1 AS `fName`,
 1 AS `lName`,
 1 AS `ccType`,
 1 AS `ccNumber`,
 1 AS `ccCVV`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customerinfo1032`
--

DROP TABLE IF EXISTS `customerinfo1032`;
/*!50001 DROP VIEW IF EXISTS `customerinfo1032`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerinfo1032` AS SELECT 
 1 AS `customerID`,
 1 AS `fName`,
 1 AS `lName`,
 1 AS `email`,
 1 AS `ccType`,
 1 AS `ccNumber`,
 1 AS `ccCVV`,
 1 AS `postalCode`,
 1 AS `street`,
 1 AS `city`,
 1 AS `province`,
 1 AS `bookingID`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `roomID`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `bookingcount`
--

/*!50001 DROP VIEW IF EXISTS `bookingcount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookingcount` AS select `hn`.`hotelName` AS `hotelName`,`r`.`roomNumber` AS `roomNumber`,`r`.`roomID` AS `roomID`,count(`b`.`customerID`) AS `BookedCount` from (((`booking` `b` join `room` `r`) join `hotel` `h`) join `hotelname` `hn`) where ((`b`.`roomID` = `r`.`roomID`) and (`r`.`hotelID` = `h`.`hotelID`) and (`h`.`hotelEmail` = `hn`.`hotelEmail`)) group by `hn`.`hotelName`,`r`.`roomNumber`,`r`.`roomID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerinfo1031`
--

/*!50001 DROP VIEW IF EXISTS `customerinfo1031`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerinfo1031` AS select `c`.`customerID` AS `customerID`,`c`.`fName` AS `fName`,`c`.`lName` AS `lName`,`c`.`email` AS `email`,`c`.`ccType` AS `ccType`,`c`.`ccNumber` AS `ccNumber`,`c`.`ccCVV` AS `ccCVV`,`c`.`postalCode` AS `postalCode`,`cl`.`street` AS `street`,`cl`.`city` AS `city`,`cl`.`province` AS `province`,`b`.`bookingID` AS `bookingID`,`b`.`startDate` AS `startDate`,`b`.`endDate` AS `endDate`,`b`.`roomID` AS `roomID` from (`customerlocation` `cl` join (`customer` `c` left join `booking` `b` on((`c`.`customerID` = `b`.`customerID`)))) where ((`c`.`postalCode` = `cl`.`postalCode`) and (`c`.`email` = 'kareemmeawad96@gmail.com')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `servicestuff`
--

/*!50001 DROP VIEW IF EXISTS `servicestuff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `servicestuff` AS select `p`.`serviceID` AS `serviceID`,`p`.`hotelID` AS `hotelID`,`service`.`serviceType` AS `serviceType`,`service`.`price` AS `price`,`service`.`serviceDescription` AS `serviceDescription` from (`provide` `p` join `service` on((`p`.`serviceID` = `service`.`serviceID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `americanexcustomers`
--

/*!50001 DROP VIEW IF EXISTS `americanexcustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `americanexcustomers` AS select `customer`.`customerID` AS `customerID`,`customer`.`fName` AS `fName`,`customer`.`lName` AS `lName`,`customer`.`ccType` AS `ccType`,`customer`.`ccNumber` AS `ccNumber`,`customer`.`ccCVV` AS `ccCVV` from `customer` where ((`customer`.`ccType` = 'americanexpress') and (`customer`.`ccNumber` is not null) and (`customer`.`ccCVV` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerinfo1032`
--

/*!50001 DROP VIEW IF EXISTS `customerinfo1032`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerinfo1032` AS select `c`.`customerID` AS `customerID`,`c`.`fName` AS `fName`,`c`.`lName` AS `lName`,`c`.`email` AS `email`,`c`.`ccType` AS `ccType`,`c`.`ccNumber` AS `ccNumber`,`c`.`ccCVV` AS `ccCVV`,`c`.`postalCode` AS `postalCode`,`cl`.`street` AS `street`,`cl`.`city` AS `city`,`cl`.`province` AS `province`,`b`.`bookingID` AS `bookingID`,`b`.`startDate` AS `startDate`,`b`.`endDate` AS `endDate`,`b`.`roomID` AS `roomID` from (`customerlocation` `cl` join (`customer` `c` left join `booking` `b` on((`c`.`customerID` = `b`.`customerID`)))) where ((`c`.`postalCode` = `cl`.`postalCode`) and (`c`.`email` = 'kareemmeawad96@gmail.com')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06 18:45:09
