-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: relief
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `aidstatus`
--

LOCK TABLES `aidstatus` WRITE;
/*!40000 ALTER TABLE `aidstatus` DISABLE KEYS */;
INSERT INTO `aidstatus` VALUES (1,'Pending'),(2,'Active'),(3,'Inactive');
/*!40000 ALTER TABLE `aidstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `callcenter`
--

LOCK TABLES `callcenter` WRITE;
/*!40000 ALTER TABLE `callcenter` DISABLE KEYS */;
INSERT INTO `callcenter` VALUES (1,'Fake center','6666666666'),(2,'real center','5555555555');
/*!40000 ALTER TABLE `callcenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ccemp`
--

LOCK TABLES `ccemp` WRITE;
/*!40000 ALTER TABLE `ccemp` DISABLE KEYS */;
INSERT INTO `ccemp` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `ccemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `disaster`
--

LOCK TABLES `disaster` WRITE;
/*!40000 ALTER TABLE `disaster` DISABLE KEYS */;
INSERT INTO `disaster` VALUES (1,52246,1,1);
/*!40000 ALTER TABLE `disaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `disastertype`
--

LOCK TABLES `disastertype` WRITE;
/*!40000 ALTER TABLE `disastertype` DISABLE KEYS */;
INSERT INTO `disastertype` VALUES (1,'Fire'),(2,'Tornado'),(3,'Hurricane'),(4,'Earthquake'),(5,'hail');
/*!40000 ALTER TABLE `disastertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'water'),(2,'bread'),(3,'rice'),(4,'Work'),(5,'wood');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `provideaid`
--

LOCK TABLES `provideaid` WRITE;
/*!40000 ALTER TABLE `provideaid` DISABLE KEYS */;
/*!40000 ALTER TABLE `provideaid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `requestitem`
--

LOCK TABLES `requestitem` WRITE;
/*!40000 ALTER TABLE `requestitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'Call Center'),(3,'Normal');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sam','sam','sam@gmail.com','sam',55555,'5555555555',3),(2,'marlow','wink','m@gamil.com','this',52246,'6666666666',1),(3,'n','n','n@gamil.com','n',55555,'3333333333',3),(4,'c','c','c@gmail.com','c',55555,'2222222222',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-21 18:25:49
