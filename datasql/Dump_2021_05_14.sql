-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wherethefourcasting
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

--
-- Table structure for table `user_activities`
--

DROP TABLE IF EXISTS `user_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_activities` (
  `userID` varchar(30) NOT NULL,
  `search_date` date NOT NULL,
  `search_location` int NOT NULL,
  PRIMARY KEY (`userID`,`search_date`,`search_location`),
  CONSTRAINT `user_activities_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user_authen` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activities`
--

LOCK TABLES `user_activities` WRITE;
/*!40000 ALTER TABLE `user_activities` DISABLE KEYS */;
INSERT INTO `user_activities` VALUES ('@billfashion','2021-04-27',623),('@billfashion','2021-04-27',178087),('@billfashion','2021-05-05',623),('@chillisauce','2021-04-27',623),('@chillisauce','2021-04-27',178087),('@chillisauce','2021-04-27',327659),('@chillisauce','2021-04-28',300597),('@chillisauce','2021-05-05',623),('@chillisauce','2021-05-06',623),('@chillisauce','2021-05-07',623),('@donaldtrump','2021-04-27',327659),('@nhattan','2021-04-28',300597),('@nhattan','2021-04-29',178087),('@nhattan','2021-04-29',208971),('@nhattan','2021-04-29',230276),('@nhattan','2021-04-29',300597),('@nhattan','2021-04-29',327659),('@nhattan','2021-05-01',623),('@nhattan','2021-05-01',22889),('@nhattan','2021-05-01',328328),('@nhattan','2021-05-01',351194),('@nhattan','2021-05-01',353412),('@nhattan','2021-05-02',356204),('@nhattan','2021-05-02',414495),('@nhattan','2021-05-02',979978),('@nhattan','2021-05-05',347625),('@nhattan','2021-05-05',349727),('@nhattan','2021-05-05',351820),('@nhattan','2021-05-05',352499),('@nhattan','2021-05-05',353981);
/*!40000 ALTER TABLE `user_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authen`
--

DROP TABLE IF EXISTS `user_authen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_authen` (
  `userID` varchar(30) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `user_pw` varchar(30) DEFAULT NULL,
  `locationID` int NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `locationID` (`locationID`),
  CONSTRAINT `user_authen_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `location` (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authen`
--

LOCK TABLES `user_authen` WRITE;
/*!40000 ALTER TABLE `user_authen` DISABLE KEYS */;
INSERT INTO `user_authen` VALUES ('@billfashion','Bill','abc123456',414495),('@brackey','Brackey','lkjhgf321',328328),('@chillisauce','Chillisauce','1233456abc',414495),('@chillyroom','Chilly Room','hahahha123',347625),('@crazymeowl','Lido','1233456789',414495),('@donaldtrump','Donald Trump','donalddonald',349727),('@gigguk','Gigguk','asdfg321',327659),('@louish','Louish','zxccvb123',300597),('@nhattan','Link','1233456789',414495),('@teamcherry','Cherry','qwertuabc',328328),('@ubisoft','Ubisoft','poiuyt123',328328),('@yoasobi','Yoasobi','trygfhbnv098',328328);
/*!40000 ALTER TABLE `user_authen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_emails`
--

DROP TABLE IF EXISTS `user_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_emails` (
  `email` varchar(60) NOT NULL,
  `userID` varchar(30) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `userID` (`userID`),
  CONSTRAINT `user_emails_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user_authen` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_emails`
--

LOCK TABLES `user_emails` WRITE;
/*!40000 ALTER TABLE `user_emails` DISABLE KEYS */;
INSERT INTO `user_emails` VALUES ('chillisaucery@gmail.com','@chillisauce'),('ITITIU190haha@student.emo.hcmiu.us','@chillisauce'),('luuhienlong201@gmail.com','@chillisauce'),('randomlygenerated432512@gmail.com','@chillisauce'),('donaldtrump@gmail.com','@donaldtrump'),('donaldtrumpactualoffical@gmail.com','@donaldtrump'),('donaldtrumpoffical@gmail.com','@donaldtrump'),('hollowknight@gmail.business.com','@teamcherry'),('silksong@gmail.business.com','@teamcherry');
/*!40000 ALTER TABLE `user_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_phones`
--

DROP TABLE IF EXISTS `user_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_phones` (
  `phone` bigint NOT NULL,
  `userID` varchar(30) NOT NULL,
  PRIMARY KEY (`phone`),
  KEY `userID` (`userID`),
  CONSTRAINT `user_phones_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user_authen` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_phones`
--

LOCK TABLES `user_phones` WRITE;
/*!40000 ALTER TABLE `user_phones` DISABLE KEYS */;
INSERT INTO `user_phones` VALUES (123456789,'@chillisauce'),(912444555,'@chillisauce'),(912444666,'@chillisauce'),(912111555,'@crazymeowl'),(912555999,'@crazymeowl'),(912951847,'@yoasobi');
/*!40000 ALTER TABLE `user_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profileimages`
--

DROP TABLE IF EXISTS `user_profileimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profileimages` (
  `userID` varchar(30) NOT NULL,
  `image_date` date NOT NULL,
  `filename` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`,`filename`),
  CONSTRAINT `user_profileimages_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user_authen` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profileimages`
--

LOCK TABLES `user_profileimages` WRITE;
/*!40000 ALTER TABLE `user_profileimages` DISABLE KEYS */;
INSERT INTO `user_profileimages` VALUES ('@chillisauce','2021-05-12','abc.png'),('@chillisauce','2021-05-10','arknights.png'),('@chillisauce','2021-05-12','hornet.png'),('@chillisauce','2021-05-09','madoka.png'),('@chillisauce','2021-05-12','ricardo.png'),('@chillisauce','2021-05-12','trainerred.png'),('@donaldtrump','2021-05-07','donalddonald.png'),('@donaldtrump','2021-05-05','donaldtrump.png'),('@donaldtrump','2021-05-09','trumptrump.png'),('@gigguk','2021-05-01','domestic.png'),('@gigguk','2021-05-12','electricalengineer.png');
/*!40000 ALTER TABLE `user_profileimages` ENABLE KEYS */;
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
INSERT INTO `wfd` VALUES ('2021-04-27',6,19,'Sunny','Null','Clear','Null',623),('2021-04-27',3,13,'Mostly sunny','Null','Mostly clear','Null',178087),('2021-04-27',19,31,'Mostly sunny','Null','Partly cloudy','Null',327659),('2021-04-27',5,17,'Intermittent clouds','Null','Mostly cloudy w/ showers','Rain',328328),('2021-04-27',13,20,'Partly sunny','Null','Clear','Null',347625),('2021-04-27',13,18,'Partly sunny','Null','Partly cloudy','Null',349727),('2021-04-27',22,26,'Thunderstorms','Rain','Mostly cloudy w/ t-storms','Rain',351194),('2021-04-28',6,19,'Intermittent clouds','Null','Mostly clear','Null',623),('2021-04-28',14,21,'Mostly cloudy','Null','Intermittent clouds','Null',22889),('2021-04-28',8,17,'Partly sunny','Null','Showers','Rain',178087),('2021-04-28',25,32,'Mostly cloudy w/ showers','Rain','Intermittent clouds','Rain',208971),('2021-04-28',25,32,'Showers','Rain','Showers','Rain',230276),('2021-04-28',26,33,'Partly sunny w/ showers','Rain','Showers','Rain',300597),('2021-04-28',21,32,'Partly sunny','Null','Mostly cloudy','Null',327659),('2021-04-28',4,12,'Showers','Rain','Mostly cloudy w/ showers','Rain',328328),('2021-04-28',14,28,'Sunny','Null','Clear','Null',347625),('2021-04-28',18,29,'Mostly cloudy','Null','Thunderstorms','Rain',349727),('2021-04-28',19,30,'Thunderstorms','Rain','Thunderstorms','Rain',351194),('2021-04-28',24,33,'Thunderstorms','Rain','Partly cloudy w/ t-storms','Rain',351820),('2021-04-28',24,32,'Thunderstorms','Rain','Intermittent clouds','Null',352499),('2021-04-28',20,26,'Thunderstorms','Rain','Thunderstorms','Rain',353412),('2021-04-28',26,34,'Mostly cloudy','Null','Partly cloudy','Null',353981),('2021-04-28',24,31,'Intermittent clouds','Null','Mostly cloudy','Null',356204),('2021-04-28',26,33,'Showers','Rain','Intermittent clouds','Null',414495),('2021-04-28',14,24,'Mostly sunny','Null','Clear','Null',979978),('2021-04-29',6,13,'Intermittent clouds','Null','Intermittent clouds','Null',623),('2021-04-29',13,22,'Mostly sunny','Null','Mostly clear','Null',22889),('2021-04-29',7,17,'Mostly cloudy w/ showers','Rain','Mostly cloudy','Rain',178087),('2021-04-29',25,33,'Intermittent clouds','Null','Mostly cloudy w/ t-storms','Rain',208971),('2021-04-29',25,32,'Partly sunny w/ showers','Rain','Thunderstorms','Rain',230276),('2021-04-29',25,34,'Thunderstorms','Rain','Partly cloudy w/ t-storms','Rain',300597),('2021-04-29',14,29,'Mostly cloudy','Rain','Showers','Rain',327659),('2021-04-29',3,12,'Intermittent clouds','Null','Intermittent clouds','Null',328328),('2021-04-29',19,31,'Sunny','Null','Clear','Null',347625),('2021-04-29',15,24,'Thunderstorms','Rain','Showers','Rain',349727),('2021-04-29',17,22,'Showers','Rain','Rain','Rain',351194),('2021-04-29',24,34,'Partly sunny w/ t-storms','Rain','Intermittent clouds','Null',351820),('2021-04-29',25,33,'Mostly cloudy w/ t-storms','Rain','Mostly cloudy','Rain',352499),('2021-04-29',19,28,'Cloudy','Null','Cloudy','Null',353412),('2021-04-29',26,34,'Intermittent clouds','Null','Partly cloudy','Null',353981),('2021-04-29',24,30,'Partly sunny w/ t-storms','Rain','Cloudy','Null',356204),('2021-04-29',26,35,'Partly sunny w/ t-storms','Rain','Partly cloudy','Null',414495),('2021-04-29',11,29,'Sunny','Null','Partly cloudy','Null',979978),('2021-04-30',7,13,'Intermittent clouds','Null','Mostly cloudy','Null',623),('2021-04-30',14,22,'Mostly sunny','Null','Mostly cloudy w/ showers','Rain',22889),('2021-04-30',5,11,'Showers','Rain','Mostly cloudy','Null',178087),('2021-04-30',26,32,'Mostly cloudy','Null','Mostly cloudy w/ t-storms','Rain',208971),('2021-04-30',25,31,'Thunderstorms','Rain','Thunderstorms','Rain',230276),('2021-04-30',26,31,'Mostly cloudy w/ t-storms','Rain','Cloudy','Null',300597),('2021-04-30',7,21,'Windy','Null','Clear','Null',327659),('2021-04-30',3,13,'Partly sunny w/ showers','Rain','Partly cloudy','Null',328328),('2021-04-30',16,32,'Mostly sunny','Null','Partly cloudy','Null',347625),('2021-04-30',6,21,'Mostly cloudy w/ showers','Rain','Windy','Null',349727),('2021-04-30',17,22,'Showers','Rain','Showers','Rain',351194),('2021-04-30',24,35,'Thunderstorms','Rain','Partly cloudy','Null',351820),('2021-04-30',25,34,'Thunderstorms','Rain','Partly cloudy w/ showers','Rain',352499),('2021-04-30',22,29,'Partly sunny','Null','Mostly cloudy','Null',353412),('2021-04-30',27,35,'Intermittent clouds','Null','Mostly clear','Null',353981),('2021-04-30',25,29,'Partly sunny w/ t-storms','Rain','Intermittent clouds','Null',356204),('2021-04-30',26,34,'Intermittent clouds','Null','Mostly clear','Null',414495),('2021-04-30',9,31,'Sunny','Null','Clear','Null',979978),('2021-05-01',4,11,'Rain','Rain','Mostly cloudy w/ showers','Rain',623),('2021-05-01',14,23,'Partly sunny','Null','Mostly cloudy','Null',22889),('2021-05-01',7,13,'Mostly cloudy','Null','Cloudy','Null',178087),('2021-05-01',26,33,'Intermittent clouds','Null','Partly cloudy w/ t-storms','Rain',208971),('2021-05-01',25,31,'Cloudy','Null','Thunderstorms','Rain',230276),('2021-05-01',25,33,'Showers','Rain','Partly cloudy w/ t-storms','Rain',300597),('2021-05-01',12,21,'Mostly sunny','Null','Partly cloudy','Null',327659),('2021-05-01',3,12,'Partly sunny w/ showers','Rain','Partly cloudy','Null',328328),('2021-05-01',15,25,'Mostly cloudy','Null','Mostly cloudy','Null',347625),('2021-05-01',13,18,'Mostly sunny','Null','Mostly cloudy w/ showers','Rain',349727),('2021-05-01',17,23,'Rain','Rain','Rain','Rain',351194),('2021-05-01',24,33,'Mostly cloudy w/ t-storms','Rain','Cloudy','Null',351820),('2021-05-01',25,33,'Thunderstorms','Rain','Thunderstorms','Rain',352499),('2021-05-01',25,30,'Thunderstorms','Rain','Dreary','Null',353412),('2021-05-01',27,34,'Partly sunny w/ t-storms','Rain','Mostly cloudy','Null',353981),('2021-05-01',24,32,'Mostly cloudy w/ t-storms','Rain','Cloudy','Null',356204),('2021-05-01',26,35,'Thunderstorms','Rain','Intermittent clouds','Null',414495),('2021-05-01',12,27,'Partly sunny','Null','Partly cloudy','Null',979978),('2021-05-02',4,14,'Partly sunny w/ showers','Rain','Mostly clear','Null',623),('2021-05-02',13,22,'Cloudy','Null','Intermittent clouds','Null',22889),('2021-05-02',5,12,'Showers','Rain','Partly cloudy','Null',178087),('2021-05-02',26,34,'Partly sunny w/ t-storms','Rain','Intermittent clouds','Null',208971),('2021-05-02',26,31,'Partly sunny w/ t-storms','Rain','Mostly cloudy w/ showers','Rain',230276),('2021-05-02',25,33,'Thunderstorms','Rain','Thunderstorms','Rain',300597),('2021-05-02',19,29,'Partly sunny','Null','Mostly cloudy w/ showers','Rain',327659),('2021-05-02',6,13,'Partly sunny w/ showers','Rain','Mostly cloudy','Null',328328),('2021-05-02',14,22,'Intermittent clouds','Null','Mostly cloudy','Null',347625),('2021-05-02',15,26,'Partly sunny w/ showers','Rain','Intermittent clouds','Null',349727),('2021-05-02',20,28,'Mostly cloudy','Null','Clear','Null',351194),('2021-05-02',25,36,'Intermittent clouds','Null','Partly cloudy','Null',351820),('2021-05-02',25,35,'Intermittent clouds','Null','Partly cloudy','Null',352499),('2021-05-02',25,30,'Showers','Rain','Dreary','Null',353412),('2021-05-02',27,36,'Partly sunny','Null','Mostly clear','Null',353981),('2021-05-02',25,33,'Mostly cloudy w/ t-storms','Rain','Partly cloudy','Null',356204),('2021-05-02',27,37,'Intermittent clouds','Null','Mostly clear','Null',414495),('2021-05-02',13,21,'Cloudy','Null','Cloudy','Null',979978),('2021-05-03',9,17,'Intermittent clouds','Null','Showers','Rain',623),('2021-05-03',15,26,'Mostly sunny','Null','Intermittent clouds','Null',22889),('2021-05-03',6,11,'Intermittent clouds','Null','Cloudy','Null',178087),('2021-05-03',26,33,'Partly sunny w/ t-storms','Rain','Thunderstorms','Rain',208971),('2021-05-03',26,32,'Mostly cloudy w/ showers','Rain','Mostly cloudy w/ t-storms','Rain',230276),('2021-05-03',26,34,'Showers','Rain','Showers','Rain',300597),('2021-05-03',19,23,'Mostly cloudy w/ t-storms','Rain','Thunderstorms','Rain',327659),('2021-05-03',7,12,'Showers','Rain','Mostly cloudy w/ showers','Rain',328328),('2021-05-03',15,26,'Intermittent clouds','Null','Mostly clear','Null',347625),('2021-05-03',16,21,'Mostly cloudy w/ showers','Rain','Showers','Rain',349727),('2021-05-03',17,31,'Mostly sunny','Null','Thunderstorms','Rain',351194),('2021-05-03',24,35,'Intermittent clouds','Null','Partly cloudy w/ t-storms','Rain',351820),('2021-05-03',26,34,'Partly sunny','Null','Partly cloudy','Null',352499),('2021-05-03',26,33,'Partly sunny w/ t-storms','Rain','Partly cloudy','Null',353412),('2021-05-03',27,36,'Intermittent clouds','Null','Mostly clear','Null',353981),('2021-05-03',25,34,'Partly sunny w/ t-storms','Rain','Partly cloudy','Null',356204),('2021-05-03',26,36,'Intermittent clouds','Null','Partly cloudy','Null',414495),('2021-05-03',12,21,'Cloudy','Null','Cloudy','Null',979978),('2021-05-04',5,14,'Rain','Rain','Mostly clear','Null',623),('2021-05-04',15,19,'Showers','Rain','Showers','Rain',22889),('2021-05-04',8,14,'Mostly cloudy w/ showers','Rain','Partly cloudy','Rain',178087),('2021-05-04',26,34,'Thunderstorms','Rain','Mostly cloudy','Null',208971),('2021-05-04',25,31,'Thunderstorms','Rain','Thunderstorms','Rain',230276),('2021-05-04',26,32,'Showers','Rain','Thunderstorms','Rain',300597),('2021-05-04',19,29,'Partly sunny w/ t-storms','Rain','Thunderstorms','Rain',327659),('2021-05-04',4,14,'Intermittent clouds','Null','Partly cloudy w/ showers','Rain',328328),('2021-05-04',16,26,'Mostly sunny','Null','Partly cloudy','Null',347625),('2021-05-04',12,23,'Mostly cloudy','Null','Thunderstorms','Rain',349727),('2021-05-04',11,23,'Mostly cloudy w/ showers','Rain','Clear','Null',351194),('2021-05-04',26,37,'Intermittent clouds','Null','Mostly cloudy w/ t-storms','Rain',351820),('2021-05-04',27,36,'Thunderstorms','Rain','Mostly cloudy w/ showers','Rain',352499),('2021-05-04',25,32,'Partly sunny w/ t-storms','Rain','Showers','Rain',353412),('2021-05-04',28,36,'Mostly cloudy w/ t-storms','Rain','Partly cloudy','Null',353981),('2021-05-04',24,33,'Intermittent clouds','Null','Partly cloudy','Null',356204),('2021-05-04',27,37,'Partly sunny w/ t-storms','Rain','Mostly clear','Null',414495),('2021-05-04',10,26,'Mostly sunny','Null','Clear','Null',979978),('2021-05-05',7,13,'Mostly cloudy w/ showers','Rain','Mostly cloudy','Null',623),('2021-05-05',17,18,'Rain','Rain','Mostly cloudy w/ showers','Rain',22889),('2021-05-05',4,11,'Mostly cloudy w/ showers','Rain','Mostly clear','Rain',178087),('2021-05-05',25,33,'Thunderstorms','Rain','Mostly cloudy w/ t-storms','Rain',208971),('2021-05-05',25,29,'Thunderstorms','Rain','Thunderstorms','Rain',230276),('2021-05-05',25,32,'Thunderstorms','Rain','Thunderstorms','Rain',300597),('2021-05-05',8,25,'Thunderstorms','Rain','Mostly clear','Null',327659),('2021-05-05',3,12,'Partly sunny w/ showers','Rain','Mostly cloudy','Rain',328328),('2021-05-05',16,27,'Partly sunny','Null','Intermittent clouds','Null',347625),('2021-05-05',9,19,'Thunderstorms','Rain','Intermittent clouds','Null',349727),('2021-05-05',15,24,'Sunny','Null','Mostly clear','Null',351194),('2021-05-05',27,36,'Thunderstorms','Rain','Mostly cloudy w/ t-storms','Rain',351820),('2021-05-05',27,36,'Mostly cloudy w/ t-storms','Rain','Thunderstorms','Rain',352499),('2021-05-05',24,29,'Thunderstorms','Rain','Thunderstorms','Rain',353412),('2021-05-05',28,35,'Thunderstorms','Rain','Partly cloudy','Null',353981),('2021-05-05',25,33,'Partly sunny','Null','Mostly clear','Null',356204),('2021-05-05',27,37,'Thunderstorms','Rain','Partly cloudy','Null',414495),('2021-05-05',15,28,'Sunny','Null','Partly cloudy','Null',979978),('2021-05-06',3,11,'Rain','Rain','Intermittent clouds','Null',623),('2021-05-06',18,21,'Showers','Rain','Showers','Rain',22889),('2021-05-06',5,11,'Mostly cloudy w/ showers','Rain','Rain','Rain',178087),('2021-05-06',25,32,'Partly sunny w/ t-storms','Rain','Mostly cloudy w/ t-storms','Rain',208971),('2021-05-06',24,30,'Thunderstorms','Rain','Thunderstorms','Rain',230276),('2021-05-06',26,30,'Showers','Rain','Cloudy','Null',300597),('2021-05-06',9,19,'Mostly sunny','Null','Cloudy','Null',327659),('2021-05-06',4,13,'Partly sunny w/ showers','Rain','Clear','Null',328328),('2021-05-06',14,24,'Intermittent clouds','Null','Intermittent clouds','Null',347625),('2021-05-06',10,18,'Mostly sunny','Null','Partly cloudy','Null',349727),('2021-05-06',16,27,'Partly sunny','Null','Clear','Null',351194),('2021-05-06',25,35,'Thunderstorms','Rain','Thunderstorms','Rain',351820),('2021-05-06',26,32,'Thunderstorms','Rain','Thunderstorms','Rain',352499),('2021-05-06',25,31,'Mostly cloudy','Null','Cloudy','Null',353412),('2021-05-06',26,36,'Mostly cloudy w/ t-storms','Rain','Mostly cloudy','Null',353981),('2021-05-06',24,32,'Partly sunny','Null','Partly cloudy','Null',356204),('2021-05-06',27,36,'Thunderstorms','Rain','Cloudy','Null',414495),('2021-05-06',14,33,'Cloudy','Null','Partly cloudy','Null',979978),('2021-05-07',8,16,'Mostly cloudy','Null','Mostly cloudy','Null',623),('2021-05-07',16,22,'Mostly cloudy w/ showers','Rain','Partly cloudy','Null',22889),('2021-05-07',3,8,'Rain','Rain','Mostly clear','Null',178087),('2021-05-07',26,33,'Intermittent clouds','Null','Partly cloudy w/ showers','Rain',208971),('2021-05-07',23,30,'Thunderstorms','Rain','Thunderstorms','Rain',230276),('2021-05-07',26,32,'Partly sunny w/ t-storms','Rain','Partly cloudy w/ t-storms','Rain',300597),('2021-05-07',6,19,'Rain','Rain','Mostly cloudy w/ showers','Rain',327659),('2021-05-07',6,13,'Partly sunny w/ showers','Rain','Mostly cloudy w/ showers','Rain',328328),('2021-05-07',14,22,'Intermittent clouds','Null','Intermittent clouds','Null',347625),('2021-05-07',9,18,'Mostly cloudy','Null','Showers','Rain',349727),('2021-05-07',18,29,'Mostly sunny','Null','Partly cloudy','Null',351194),('2021-05-07',26,33,'Thunderstorms','Rain','Mostly cloudy','Null',351820),('2021-05-07',26,33,'Thunderstorms','Rain','Cloudy','Null',352499),('2021-05-07',24,32,'Intermittent clouds','Null','Mostly cloudy','Null',353412),('2021-05-07',27,34,'Mostly cloudy','Null','Intermittent clouds','Null',353981),('2021-05-07',24,32,'Mostly cloudy','Null','Clear','Null',356204),('2021-05-07',26,34,'Thunderstorms','Rain','Mostly cloudy','Null',414495),('2021-05-07',15,28,'Mostly sunny','Null','Clear','Null',979978),('2021-05-08',14,22,'Mostly cloudy w/ showers','Rain','Partly cloudy','Null',623),('2021-05-08',15,27,'Mostly cloudy','Null','Cloudy','Null',22889),('2021-05-08',9,14,'Intermittent clouds','Null','Cloudy','Null',178087),('2021-05-08',25,33,'Intermittent clouds','Null','Partly cloudy w/ t-storms','Rain',208971),('2021-05-08',25,32,'Partly sunny w/ showers','Rain','Showers','Rain',230276),('2021-05-08',26,31,'Showers','Rain','Mostly cloudy','Rain',300597),('2021-05-08',7,15,'Partly sunny w/ showers','Rain','Partly cloudy','Null',327659),('2021-05-08',12,16,'Rain','Rain','Partly cloudy','Null',328328),('2021-05-08',14,23,'Intermittent clouds','Null','Intermittent clouds','Null',347625),('2021-05-08',8,12,'Showers','Rain','Partly cloudy','Null',349727),('2021-05-08',22,31,'Mostly cloudy','Null','Partly cloudy w/ t-storms','Rain',351194),('2021-05-08',26,34,'Thunderstorms','Rain','Intermittent clouds','Null',351820),('2021-05-08',26,33,'Thunderstorms','Rain','Intermittent clouds','Null',352499),('2021-05-08',25,33,'Mostly cloudy','Null','Mostly cloudy','Null',353412),('2021-05-08',27,35,'Mostly cloudy w/ t-storms','Rain','Partly cloudy w/ t-storms','Rain',353981),('2021-05-08',23,33,'Partly sunny','Null','Clear','Null',356204),('2021-05-08',26,34,'Mostly cloudy w/ t-storms','Rain','Partly cloudy w/ t-storms','Rain',414495),('2021-05-08',17,34,'Partly sunny','Null','Clear','Null',979978),('2021-05-09',12,27,'Showers','Rain','Rain','Rain',623),('2021-05-09',14,22,'Intermittent clouds','Null','Partly cloudy','Null',22889),('2021-05-09',12,24,'Intermittent clouds','Null','Mostly clear','Null',178087),('2021-05-09',26,33,'Partly sunny w/ showers','Rain','Partly cloudy','Null',208971),('2021-05-09',25,32,'Rain','Rain','Partly cloudy','Null',230276),('2021-05-09',27,32,'Partly sunny w/ t-storms','Rain','Partly cloudy','Null',300597),('2021-05-09',16,18,'Mostly cloudy w/ showers','Rain','Mostly cloudy','Null',327659),('2021-05-09',11,19,'Showers','Rain','Cloudy','Null',328328),('2021-05-09',15,23,'Intermittent clouds','Null','Intermittent clouds','Null',347625),('2021-05-09',11,17,'Mostly cloudy w/ showers','Rain','Rain','Rain',349727),('2021-05-09',15,29,'Partly sunny w/ t-storms','Rain','Partly cloudy w/ t-storms','Rain',351194),('2021-05-09',25,34,'Partly sunny w/ t-storms','Rain','Partly cloudy','Null',351820),('2021-05-09',25,35,'Partly sunny w/ t-storms','Rain','Mostly clear','Null',352499),('2021-05-09',26,34,'Mostly cloudy w/ t-storms','Rain','Partly cloudy w/ t-storms','Rain',353412),('2021-05-09',27,35,'Partly sunny w/ t-storms','Rain','Partly cloudy','Null',353981),('2021-05-09',25,34,'Mostly cloudy','Null','Clear','Null',356204),('2021-05-09',27,36,'Partly sunny w/ t-storms','Rain','Partly cloudy w/ t-storms','Rain',414495),('2021-05-09',19,30,'Partly sunny','Null','Partly cloudy','Null',979978),('2021-05-10',8,18,'Showers','Rain','Intermittent clouds','Null',623),('2021-05-10',15,24,'Mostly sunny','Null','Partly cloudy','Null',22889),('2021-05-10',13,27,'Partly sunny','Null','Partly cloudy','Null',178087),('2021-05-10',25,33,'Mostly cloudy','Null','Mostly clear','Null',208971),('2021-05-10',25,32,'Partly sunny','Null','Intermittent clouds','Null',230276),('2021-05-10',27,32,'Intermittent clouds','Rain','Intermittent clouds','Rain',300597),('2021-05-10',8,18,'Mostly cloudy','Rain','Mostly cloudy','Null',327659),('2021-05-10',8,16,'Mostly sunny','Rain','Mostly clear','Null',328328),('2021-05-10',14,22,'Intermittent clouds','Null','Intermittent clouds','Null',347625),('2021-05-10',8,17,'Mostly cloudy','Rain','Partly cloudy','Null',349727),('2021-05-10',15,19,'Thunderstorms','Rain','Thunderstorms','Rain',351194),('2021-05-10',25,35,'Partly sunny','Null','Mostly clear','Null',351820),('2021-05-10',24,36,'Partly sunny','Rain','Mostly clear','Null',352499),('2021-05-10',27,35,'Partly sunny','Null','Mostly clear','Null',353412),('2021-05-10',27,35,'Partly sunny','Rain','Partly cloudy','Null',353981),('2021-05-10',26,35,'Mostly cloudy','Rain','Partly cloudy','Null',356204),('2021-05-10',27,35,'Partly sunny','Null','Partly cloudy','Null',414495),('2021-05-10',18,26,'Cloudy','Null','Cloudy','Null',979978),('2021-05-11',8,16,'Partly sunny w/ showers','Rain','Mostly clear','Null',623),('2021-05-11',14,18,'Intermittent clouds','Null','Intermittent clouds','Rain',22889),('2021-05-11',11,23,'Showers','Rain','Showers','Rain',178087),('2021-05-11',25,34,'Intermittent clouds','Null','Cloudy','Rain',208971),('2021-05-11',26,31,'Intermittent clouds','Rain','Cloudy','Rain',230276),('2021-05-11',26,32,'Mostly cloudy','Rain','Cloudy','Rain',300597),('2021-05-11',9,17,'Partly sunny','Null','Mostly clear','Null',327659),('2021-05-11',9,16,'Intermittent clouds','Rain','Mostly clear','Null',328328),('2021-05-11',14,23,'Intermittent clouds','Null','Mostly cloudy','Null',347625),('2021-05-11',8,17,'Partly sunny','Null','Mostly clear','Null',349727),('2021-05-11',16,20,'Thunderstorms','Rain','Thunderstorms','Rain',351194),('2021-05-11',26,36,'Partly sunny','Null','Partly cloudy','Rain',351820),('2021-05-11',25,37,'Partly sunny w/ showers','Rain','Mostly clear','Null',352499),('2021-05-11',27,36,'Mostly sunny','Null','Mostly clear','Null',353412),('2021-05-11',27,36,'Partly sunny','Null','Intermittent clouds','Rain',353981),('2021-05-11',26,36,'Mostly cloudy','Null','Mostly clear','Null',356204),('2021-05-11',27,36,'Partly sunny','Null','Intermittent clouds','Rain',414495),('2021-05-11',16,24,'Mostly cloudy w/ showers','Rain','Partly cloudy','Null',979978),('2021-05-12',10,16,'Intermittent clouds','Null','Intermittent clouds','Null',623),('2021-05-12',14,19,'Mostly cloudy','Rain','Mostly cloudy w/ showers','Rain',22889),('2021-05-12',9,14,'Showers','Rain','Rain','Rain',178087),('2021-05-12',26,34,'Partly sunny w/ t-storms','Rain','Cloudy','Rain',208971),('2021-05-12',25,31,'Intermittent clouds','Rain','Cloudy','Rain',230276),('2021-05-12',26,32,'Cloudy','Rain','Showers','Rain',300597),('2021-05-12',7,19,'Mostly sunny','Null','Clear','Null',327659),('2021-05-12',9,16,'Intermittent clouds','Rain','Mostly cloudy w/ showers','Rain',328328),('2021-05-12',15,25,'Mostly sunny','Null','Partly cloudy','Null',347625),('2021-05-12',10,19,'Intermittent clouds','Null','Clear','Null',349727),('2021-05-12',16,23,'Mostly cloudy','Rain','Intermittent clouds','Null',351194),('2021-05-12',26,36,'Partly sunny','Rain','Partly cloudy','Rain',351820),('2021-05-12',25,37,'Partly sunny','Rain','Partly cloudy','Rain',352499),('2021-05-12',27,36,'Mostly sunny','Null','Partly cloudy','Null',353412),('2021-05-12',27,35,'Intermittent clouds','Null','Showers','Rain',353981),('2021-05-12',27,36,'Partly sunny','Rain','Partly cloudy','Null',356204),('2021-05-12',28,36,'Mostly cloudy','Null','Cloudy','Rain',414495),('2021-05-12',19,30,'Partly sunny','Null','Intermittent clouds','Null',979978);
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

-- Dump completed on 2021-05-14 23:31:34
