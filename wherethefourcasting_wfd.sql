-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: wherethefourcasting
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `wfd`
--

DROP TABLE IF EXISTS `wfd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wfd` (
  `wfddate` date DEFAULT NULL,
  `mintemp` int DEFAULT NULL,
  `maxtemp` int DEFAULT NULL,
  `dayweather` varchar(30) DEFAULT NULL,
  `dayrain` varchar(30) DEFAULT NULL,
  `nightweather` varchar(30) DEFAULT NULL,
  `nightrain` varchar(30) DEFAULT NULL,
  `locationID` int DEFAULT NULL,
  KEY `locationID` (`locationID`),
  CONSTRAINT `wfd_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `location` (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfd`
--

LOCK TABLES `wfd` WRITE;
/*!40000 ALTER TABLE `wfd` DISABLE KEYS */;
INSERT INTO `wfd` VALUES ('2021-04-27',6,19,'Sunny','Null','Clear','Null',623),('2021-04-28',7,19,'Intermittent clouds','Null','Mostly clear','Null',623),('2021-04-29',6,13,'Mostly cloudy','Null','Intermittent clouds','Null',623),('2021-04-30',6,15,'Mostly cloudy','Null','Cloudy','Rain',623),('2021-05-01',5,15,'Intermittent clouds','Null','Cloudy','Rain',623),('2021-04-28',13,22,'Intermittent clouds','Rain','Intermittent clouds','Null',22889),('2021-04-29',13,23,'Partly sunny','Null','Partly cloudy','Null',22889),('2021-04-30',15,22,'Partly sunny','Null','Partly cloudy','Null',22889),('2021-05-01',14,23,'Partly sunny w/ showers','Rain','Showers','Rain',22889),('2021-05-02',14,23,'Mostly cloudy','Null','Mostly cloudy','Null',22889),('2021-04-27',3,13,'Mostly sunny','Null','Mostly clear','Null',178087),('2021-04-28',7,16,'Partly sunny','Null','Showers','Rain',178087),('2021-04-29',7,16,'Showers','Rain','Intermittent clouds','Rain',178087),('2021-04-30',5,11,'Intermittent clouds','Null','Cloudy','Null',178087),('2021-05-01',4,14,'Mostly cloudy','Null','Cloudy','Rain',178087),('2021-04-28',25,33,'Showers','Rain','Mostly cloudy w/ showers','Rain',208971),('2021-04-29',25,33,'Partly sunny w/ showers','Rain','Partly cloudy w/ t-storms','Rain',208971),('2021-04-30',25,34,'Partly sunny w/ showers','Rain','Intermittent clouds','Rain',208971),('2021-05-01',25,34,'Showers','Rain','Partly cloudy','Null',208971),('2021-05-02',24,34,'Intermittent clouds','Rain','Mostly clear','Rain',208971),('2021-04-28',24,31,'Showers','Rain','Mostly cloudy w/ showers','Rain',230276),('2021-04-29',25,32,'Mostly cloudy w/ showers','Rain','Cloudy','Rain',230276),('2021-04-30',25,30,'Cloudy','Rain','Partly cloudy','Null',230276),('2021-05-01',26,32,'Cloudy','Rain','Cloudy','Rain',230276),('2021-05-02',25,32,'Mostly cloudy','Null','Cloudy','Rain',230276),('2021-04-28',25,32,'Partly sunny w/ showers','Rain','Showers','Rain',300597),('2021-04-29',26,32,'Thunderstorms','Rain','Intermittent clouds','Rain',300597),('2021-04-30',25,32,'Mostly cloudy w/ t-storms','Rain','Intermittent clouds','Rain',300597),('2021-05-01',26,32,'Showers','Rain','Intermittent clouds','Rain',300597),('2021-05-02',25,32,'Showers','Rain','Partly cloudy','Rain',300597),('2021-04-27',19,31,'Mostly sunny','Null','Partly cloudy','Null',327659),('2021-04-28',19,31,'Partly sunny','Null','Mostly cloudy w/ showers','Rain',327659),('2021-04-29',12,28,'Intermittent clouds','Null','Showers','Rain',327659),('2021-04-30',8,20,'Mostly cloudy','Rain','Intermittent clouds','Null',327659),('2021-05-01',9,19,'Mostly sunny','Null','Mostly clear','Null',327659),('2021-04-27',5,17,'Intermittent clouds','Null','Mostly cloudy w/ showers','Rain',328328),('2021-04-28',4,13,'Showers','Rain','Mostly cloudy w/ showers','Rain',328328),('2021-04-29',3,12,'Intermittent clouds','Null','Partly cloudy','Null',328328),('2021-04-30',3,12,'Partly sunny w/ showers','Rain','Mostly clear','Null',328328),('2021-05-01',3,13,'Intermittent clouds','Rain','Partly cloudy','Null',328328),('2021-04-27',13,20,'Partly sunny','Null','Clear','Null',347625),('2021-04-28',16,26,'Sunny','Null','Clear','Null',347625),('2021-04-29',19,31,'Sunny','Null','Clear','Null',347625),('2021-04-30',18,34,'Mostly sunny','Null','Intermittent clouds','Null',347625),('2021-05-01',16,28,'Mostly cloudy','Null','Mostly cloudy','Null',347625),('2021-04-27',13,18,'Partly sunny','Null','Partly cloudy','Null',349727),('2021-04-28',17,29,'Partly sunny','Null','Thunderstorms','Rain',349727),('2021-04-29',14,22,'Thunderstorms','Rain','Showers','Rain',349727),('2021-04-30',7,20,'Mostly cloudy','Rain','Intermittent clouds','Null',349727),('2021-05-01',9,18,'Mostly sunny','Null','Partly cloudy','Null',349727),('2021-04-27',22,26,'Thunderstorms','Rain','Mostly cloudy w/ t-storms','Rain',351194),('2021-04-28',19,29,'Thunderstorms','Rain','Thunderstorms','Rain',351194),('2021-04-29',15,24,'Showers','Rain','Partly cloudy','Null',351194),('2021-04-30',15,26,'Sunny','Null','Clear','Null',351194),('2021-05-01',16,26,'Partly sunny','Null','Partly cloudy','Null',351194),('2021-04-28',24,35,'Thunderstorms','Rain','Partly cloudy w/ t-storms','Rain',351820),('2021-04-29',24,33,'Partly sunny w/ t-storms','Rain','Partly cloudy w/ t-storms','Rain',351820),('2021-04-30',25,34,'Intermittent clouds','Rain','Intermittent clouds','Null',351820),('2021-05-01',25,35,'Cloudy','Rain','Mostly clear','Null',351820),('2021-05-02',25,35,'Intermittent clouds','Rain','Partly cloudy','Null',351820),('2021-04-28',24,33,'Thunderstorms','Rain','Partly cloudy w/ t-storms','Rain',352499),('2021-04-29',24,35,'Partly sunny w/ t-storms','Rain','Intermittent clouds','Rain',352499),('2021-04-30',25,35,'Intermittent clouds','Rain','Mostly cloudy w/ showers','Rain',352499),('2021-05-01',26,35,'Cloudy','Rain','Mostly clear','Null',352499),('2021-05-02',25,35,'Mostly cloudy','Rain','Intermittent clouds','Null',352499),('2021-04-28',20,27,'Thunderstorms','Rain','Thunderstorms','Rain',353412),('2021-04-29',20,21,'Mostly cloudy','Null','Intermittent clouds','Null',353412),('2021-04-30',22,27,'Intermittent clouds','Null','Partly cloudy','Null',353412),('2021-05-01',24,27,'Cloudy','Rain','Mostly cloudy','Rain',353412),('2021-05-02',26,29,'Showers','Rain','Cloudy','Rain',353412),('2021-04-28',26,34,'Showers','Rain','Mostly clear','Null',353981),('2021-04-29',26,33,'Partly sunny w/ t-storms','Rain','Partly cloudy','Null',353981),('2021-04-30',26,34,'Partly sunny','Null','Mostly clear','Null',353981),('2021-05-01',26,34,'Cloudy','Rain','Partly cloudy','Null',353981),('2021-05-02',26,33,'Intermittent clouds','Rain','Partly cloudy','Null',353981),('2021-04-28',24,31,'Showers','Rain','Intermittent clouds','Null',356204),('2021-04-29',24,29,'Partly sunny w/ t-storms','Rain','Cloudy','Rain',356204),('2021-04-30',24,29,'Intermittent clouds','Rain','Cloudy','Null',356204),('2021-05-01',24,31,'Mostly cloudy','Null','Partly cloudy','Null',356204),('2021-05-02',25,32,'Mostly cloudy','Rain','Mostly cloudy','Null',356204),('2021-04-28',26,34,'Showers','Rain','Mostly clear','Null',414495),('2021-04-29',25,34,'Partly sunny w/ t-storms','Rain','Partly cloudy','Null',414495),('2021-04-30',26,35,'Mostly sunny','Null','Mostly clear','Null',414495),('2021-05-01',26,35,'Mostly cloudy','Rain','Partly cloudy','Null',414495),('2021-05-02',26,35,'Intermittent clouds','Rain','Partly cloudy','Null',414495),('2021-04-28',13,24,'Mostly sunny','Null','Clear','Null',979978),('2021-04-29',12,28,'Sunny','Null','Partly cloudy','Null',979978),('2021-04-30',10,28,'Partly sunny','Null','Clear','Null',979978),('2021-05-01',13,27,'Sunny','Null','Partly cloudy','Null',979978),('2021-05-02',17,28,'Mostly cloudy','Null','Cloudy','Null',979978);
/*!40000 ALTER TABLE `wfd` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-28  8:33:39
