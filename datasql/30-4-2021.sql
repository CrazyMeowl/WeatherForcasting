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
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `locationID` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `timezone` int DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `elevation` float DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (623,'Paris',2,'Europe','France',2.351,48.857,35),(22889,'Sydney',10,'Oceania','Australia',151.209,-33.87,1),(178087,'Berlin',2,'Europe','Germany',13.406,52.518,35),(208971,'Jakarta',7,'Asia','Indonesia',-6.175,106.827,11),(230276,'Dalat',8,'Asia','Malaysia',111.939,2.743,4),(300597,'Singapore',8,'Asia','Singapore',103.843,1.311,13),(327659,'Washington',-4,'North America','United States',-77.036,38.895,42),(328328,'London',1,'Europe','United Kingdom',-0.107,51.514,18),(347625,'Los Angeles',-7,'North America','United States',-118.244,34.052,121),(349727,'New York',-4,'North America','United States',-73.969,40.779,8),(351194,'Dallas',-5,'North America','United States',-96.807,32.783,129),(351820,'Long Xuyen',7,'Asia','Vietnam',105.444,10.374,1),(352499,'Ca Mau',7,'Asia','Vietnam',105.149,9.178,1),(353412,'Hanoi',7,'Asia','Vietnam',105.7,20.999,19),(353981,'Ho Chi Minh City',7,'Asia','Vietnam',106.702,10.775,7),(356204,'Hue',7,'Asia','Vietnam',107.599,16.453,6),(414495,'Thu Duc',7,'Asia','Vietnam',106.78,10.87,17),(979978,'Hehe Township',8,'Asia','China',113.756,35.332,78);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfd`
--

DROP TABLE IF EXISTS `wfd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wfd` (
  `wfddate` date NOT NULL,
  `mintemp` int DEFAULT NULL,
  `maxtemp` int DEFAULT NULL,
  `dayweather` varchar(30) DEFAULT NULL,
  `dayrain` varchar(30) DEFAULT NULL,
  `nightweather` varchar(30) DEFAULT NULL,
  `nightrain` varchar(30) DEFAULT NULL,
  `locationID` int NOT NULL,
  PRIMARY KEY (`wfddate`,`locationID`),
  KEY `wfd_ibfk_1` (`locationID`),
  CONSTRAINT `wfd_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `location` (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfd`
--

LOCK TABLES `wfd` WRITE;
/*!40000 ALTER TABLE `wfd` DISABLE KEYS */;
INSERT INTO `wfd` VALUES ('2021-04-27',6,19,'Sunny','Null','Clear','Null',623),('2021-04-27',3,13,'Mostly sunny','Null','Mostly clear','Null',178087),('2021-04-27',19,31,'Mostly sunny','Null','Partly cloudy','Null',327659),('2021-04-27',5,17,'Intermittent clouds','Null','Mostly cloudy w/ showers','Rain',328328),('2021-04-27',13,20,'Partly sunny','Null','Clear','Null',347625),('2021-04-27',13,18,'Partly sunny','Null','Partly cloudy','Null',349727),('2021-04-27',22,26,'Thunderstorms','Rain','Mostly cloudy w/ t-storms','Rain',351194),('2021-04-28',6,19,'Intermittent clouds','Null','Mostly clear','Null',623),('2021-04-28',14,21,'Mostly cloudy','Null','Intermittent clouds','Null',22889),('2021-04-28',8,17,'Partly sunny','Null','Showers','Rain',178087),('2021-04-28',25,32,'Mostly cloudy w/ showers','Rain','Intermittent clouds','Rain',208971),('2021-04-28',25,32,'Showers','Rain','Showers','Rain',230276),('2021-04-28',26,33,'Partly sunny w/ showers','Rain','Showers','Rain',300597),('2021-04-28',21,32,'Partly sunny','Null','Mostly cloudy','Null',327659),('2021-04-28',4,12,'Showers','Rain','Mostly cloudy w/ showers','Rain',328328),('2021-04-28',14,28,'Sunny','Null','Clear','Null',347625),('2021-04-28',18,29,'Mostly cloudy','Null','Thunderstorms','Rain',349727),('2021-04-28',19,30,'Thunderstorms','Rain','Thunderstorms','Rain',351194),('2021-04-28',24,33,'Thunderstorms','Rain','Partly cloudy w/ t-storms','Rain',351820),('2021-04-28',24,32,'Thunderstorms','Rain','Intermittent clouds','Null',352499),('2021-04-28',20,26,'Thunderstorms','Rain','Thunderstorms','Rain',353412),('2021-04-28',26,34,'Mostly cloudy','Null','Partly cloudy','Null',353981),('2021-04-28',24,31,'Intermittent clouds','Null','Mostly cloudy','Null',356204),('2021-04-28',26,33,'Showers','Rain','Intermittent clouds','Null',414495),('2021-04-28',14,24,'Mostly sunny','Null','Clear','Null',979978),('2021-04-29',6,13,'Intermittent clouds','Null','Intermittent clouds','Null',623),('2021-04-29',13,22,'Mostly sunny','Null','Mostly clear','Null',22889),('2021-04-29',7,17,'Mostly cloudy w/ showers','Rain','Mostly cloudy','Rain',178087),('2021-04-29',25,33,'Intermittent clouds','Null','Mostly cloudy w/ t-storms','Rain',208971),('2021-04-29',25,32,'Partly sunny w/ showers','Rain','Thunderstorms','Rain',230276),('2021-04-29',25,34,'Thunderstorms','Rain','Partly cloudy w/ t-storms','Rain',300597),('2021-04-29',14,29,'Mostly cloudy','Rain','Showers','Rain',327659),('2021-04-29',3,12,'Intermittent clouds','Null','Intermittent clouds','Null',328328),('2021-04-29',19,31,'Sunny','Null','Clear','Null',347625),('2021-04-29',15,24,'Thunderstorms','Rain','Showers','Rain',349727),('2021-04-29',17,22,'Showers','Rain','Rain','Rain',351194),('2021-04-29',24,34,'Partly sunny w/ t-storms','Rain','Intermittent clouds','Null',351820),('2021-04-29',25,33,'Mostly cloudy w/ t-storms','Rain','Mostly cloudy','Rain',352499),('2021-04-29',19,28,'Cloudy','Null','Cloudy','Null',353412),('2021-04-29',26,34,'Intermittent clouds','Null','Partly cloudy','Null',353981),('2021-04-29',24,30,'Partly sunny w/ t-storms','Rain','Cloudy','Null',356204),('2021-04-29',26,35,'Partly sunny w/ t-storms','Rain','Partly cloudy','Null',414495),('2021-04-29',11,29,'Sunny','Null','Partly cloudy','Null',979978),('2021-04-30',7,14,'Intermittent clouds','Null','Mostly cloudy','Null',623),('2021-04-30',14,22,'Mostly sunny','Null','Mostly cloudy w/ showers','Rain',22889),('2021-04-30',4,10,'Partly sunny w/ showers','Rain','Mostly cloudy','Null',178087),('2021-04-30',26,32,'Mostly cloudy w/ showers','Rain','Thunderstorms','Rain',208971),('2021-04-30',25,31,'Thunderstorms','Rain','Thunderstorms','Rain',230276),('2021-04-30',26,31,'Mostly cloudy w/ t-storms','Rain','Partly cloudy','Null',300597),('2021-04-30',6,21,'Windy','Null','Clear','Null',327659),('2021-04-30',3,12,'Partly sunny w/ showers','Rain','Partly cloudy','Null',328328),('2021-04-30',17,32,'Mostly sunny','Null','Mostly clear','Null',347625),('2021-04-30',6,21,'Mostly cloudy w/ showers','Rain','Windy','Null',349727),('2021-04-30',17,22,'Showers','Rain','Showers','Rain',351194),('2021-04-30',24,35,'Thunderstorms','Rain','Partly cloudy','Null',351820),('2021-04-30',25,34,'Thunderstorms','Rain','Partly cloudy w/ showers','Rain',352499),('2021-04-30',22,29,'Partly sunny','Null','Partly cloudy','Null',353412),('2021-04-30',27,35,'Intermittent clouds','Null','Mostly clear','Null',353981),('2021-04-30',25,29,'Partly sunny w/ t-storms','Rain','Intermittent clouds','Null',356204),('2021-04-30',26,34,'Intermittent clouds','Null','Mostly clear','Null',414495),('2021-04-30',9,31,'Sunny','Null','Clear','Null',979978),('2021-05-01',5,13,'Partly sunny w/ showers','Rain','Partly cloudy w/ showers','Rain',623),('2021-05-01',14,22,'Mostly cloudy w/ showers','Rain','Mostly cloudy','Rain',22889),('2021-05-01',6,13,'Intermittent clouds','Null','Cloudy','Null',178087),('2021-05-01',26,34,'Partly sunny w/ showers','Rain','Thunderstorms','Rain',208971),('2021-05-01',26,32,'Cloudy','Null','Thunderstorms','Rain',230276),('2021-05-01',26,32,'Rain','Rain','Partly cloudy w/ t-storms','Rain',300597),('2021-05-01',12,21,'Mostly sunny','Null','Partly cloudy','Null',327659),('2021-05-01',3,13,'Partly sunny w/ showers','Rain','Partly cloudy','Null',328328),('2021-05-01',15,26,'Mostly cloudy','Null','Mostly cloudy','Null',347625),('2021-05-01',13,18,'Mostly sunny','Null','Intermittent clouds','Null',349727),('2021-05-01',18,22,'Showers','Rain','Thunderstorms','Rain',351194),('2021-05-01',25,35,'Mostly cloudy w/ t-storms','Rain','Partly cloudy','Null',351820),('2021-05-01',26,34,'Mostly cloudy w/ t-storms','Rain','Thunderstorms','Rain',352499),('2021-05-01',24,27,'Thunderstorms','Rain','Cloudy','Null',353412),('2021-05-01',27,34,'Thunderstorms','Rain','Partly cloudy','Null',353981),('2021-05-01',24,31,'Thunderstorms','Rain','Partly cloudy','Null',356204),('2021-05-01',26,35,'Thunderstorms','Rain','Partly cloudy','Null',414495),('2021-05-01',11,28,'Sunny','Null','Partly cloudy','Null',979978),('2021-05-02',4,15,'Intermittent clouds','Rain','Mostly clear','Null',623),('2021-05-02',14,22,'Mostly cloudy','Null','Mostly clear','Null',22889),('2021-05-02',4,12,'Showers','Rain','Partly cloudy','Null',178087),('2021-05-02',25,34,'Mostly cloudy','Rain','Partly cloudy','Null',208971),('2021-05-02',25,32,'Partly sunny w/ t-storms','Rain','Showers','Rain',230276),('2021-05-02',26,32,'Showers','Rain','Mostly cloudy','Rain',300597),('2021-05-02',17,31,'Partly sunny','Null','Cloudy','Null',327659),('2021-05-02',6,13,'Intermittent clouds','Rain','Mostly cloudy','Null',328328),('2021-05-02',14,22,'Intermittent clouds','Null','Intermittent clouds','Null',347625),('2021-05-02',15,24,'Partly sunny','Null','Mostly cloudy','Null',349727),('2021-05-02',20,27,'Thunderstorms','Rain','Mostly clear','Null',351194),('2021-05-02',25,36,'Partly sunny','Rain','Partly cloudy','Null',351820),('2021-05-02',25,34,'Intermittent clouds','Rain','Intermittent clouds','Null',352499),('2021-05-02',25,29,'Showers','Rain','Intermittent clouds','Null',353412),('2021-05-02',27,35,'Partly sunny','Null','Clear','Null',353981),('2021-05-02',25,32,'Mostly cloudy','Rain','Partly cloudy','Null',356204),('2021-05-02',26,36,'Mostly sunny','Null','Mostly clear','Null',414495),('2021-05-02',13,22,'Cloudy','Null','Showers','Rain',979978),('2021-05-03',9,17,'Intermittent clouds','Null','Showers','Rain',623),('2021-05-03',15,24,'Mostly sunny','Null','Intermittent clouds','Null',22889),('2021-05-03',5,12,'Intermittent clouds','Null','Mostly cloudy','Null',178087),('2021-05-03',25,34,'Mostly cloudy','Rain','Mostly cloudy','Rain',208971),('2021-05-03',24,31,'Cloudy','Rain','Thunderstorms','Rain',230276),('2021-05-03',25,32,'Partly sunny w/ showers','Rain','Showers','Rain',300597),('2021-05-03',19,24,'Thunderstorms','Rain','Mostly cloudy','Rain',327659),('2021-05-03',8,13,'Showers','Rain','Showers','Rain',328328),('2021-05-03',16,26,'Intermittent clouds','Null','Clear','Null',347625),('2021-05-03',14,22,'Mostly cloudy','Rain','Showers','Rain',349727),('2021-05-03',19,33,'Mostly sunny','Null','Intermittent clouds','Null',351194),('2021-05-03',25,36,'Intermittent clouds','Null','Thunderstorms','Rain',351820),('2021-05-03',26,36,'Cloudy','Rain','Cloudy','Rain',352499),('2021-05-03',24,29,'Intermittent clouds','Rain','Partly cloudy','Null',353412),('2021-05-03',27,35,'Intermittent clouds','Null','Partly cloudy','Null',353981),('2021-05-03',25,34,'Mostly cloudy','Rain','Intermittent clouds','Null',356204),('2021-05-03',26,37,'Partly sunny','Null','Partly cloudy','Null',414495),('2021-05-03',12,22,'Cloudy','Null','Partly cloudy','Null',979978),('2021-05-04',7,15,'Mostly cloudy w/ showers','Rain','Showers','Rain',623),('2021-05-04',16,21,'Showers','Rain','Showers','Rain',22889),('2021-05-04',8,13,'Rain','Rain','Partly cloudy','Null',178087),('2021-05-04',26,34,'Thunderstorms','Rain','Intermittent clouds','Rain',208971),('2021-05-04',25,31,'Thunderstorms','Rain','Cloudy','Null',230276),('2021-05-04',25,32,'Showers','Rain','Partly cloudy','Rain',300597),('2021-05-04',19,30,'Intermittent clouds','Null','Intermittent clouds','Rain',327659),('2021-05-04',5,13,'Mostly cloudy w/ showers','Rain','Clear','Null',328328),('2021-05-04',13,25,'Intermittent clouds','Null','Partly cloudy','Null',349727),('2021-05-04',15,25,'Intermittent clouds','Null','Intermittent clouds','Null',351194),('2021-05-04',25,36,'Cloudy','Rain','Mostly cloudy','Rain',351820),('2021-05-04',26,35,'Cloudy','Rain','Mostly cloudy w/ showers','Rain',352499),('2021-05-04',24,31,'Intermittent clouds','Rain','Showers','Rain',353412),('2021-05-04',27,35,'Cloudy','Rain','Mostly cloudy','Rain',353981),('2021-05-04',24,34,'Intermittent clouds','Rain','Partly cloudy','Null',356204),('2021-05-04',26,36,'Cloudy','Rain','Partly cloudy','Null',414495),('2021-05-04',13,30,'Intermittent clouds','Null','Partly cloudy','Null',979978);
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

-- Dump completed on 2021-04-30 18:36:47
