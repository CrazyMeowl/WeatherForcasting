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
INSERT INTO `location` VALUES (623,'Paris',2,'Europe','France',2.351,48.857,35),(22889,'Sydney',10,'Oceania','Australia',151.209,-33.87,1),(178087,'Berlin',2,'Europe','Germany',13.406,52.518,35),(208971,'Jakarta',7,'Asia','Indonesia',-6.175,106.827,11),(230276,'Dalat',8,'Asia','Malaysia',111.939,2.743,4),(300597,'Singapore',8,'Asia','Singapore',103.843,1.311,13),(327659,'Washington',-4,'North America','United States',-77.036,38.895,42),(328328,'London',1,'Europe','United Kingdom',-0.107,51.514,18),(347625,'Los Angeles',-7,'North America','United States',-118.244,34.052,121),(349727,'New York',-4,'North America','United States',-73.969,40.779,8),(351194,'Dallas',-5,'North America','United States',-96.807,32.783,129),(351820,'Long Xuyen',7,'Asia','Vietnam',105.444,10.374,1),(352499,'Ca Mau',7,'Asia','Vietnam',105.149,9.178,1),(353412,'Ha Noi',7,'Asia','Vietnam',105.7,20.999,19),(353981,'Ho Chi Minh',7,'Asia','Vietnam',106.702,10.775,7),(356204,'Hue',7,'Asia','Vietnam',107.599,16.453,6),(414495,'Thu Duc',7,'Asia','Vietnam',106.78,10.87,17),(979978,'Hehe Township',8,'Asia','China',113.756,35.332,78);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-14 15:53:13
