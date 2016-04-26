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
-- Table structure for table `aidstatus`
--

DROP TABLE IF EXISTS `aidstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aidstatus` (
  `StatusId` int(1) NOT NULL,
  `stats` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`StatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aidstatus`
--

LOCK TABLES `aidstatus` WRITE;
/*!40000 ALTER TABLE `aidstatus` DISABLE KEYS */;
INSERT INTO `aidstatus` VALUES (1,'Pending'),(2,'Active'),(3,'Inactive');
/*!40000 ALTER TABLE `aidstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callcenter`
--

DROP TABLE IF EXISTS `callcenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callcenter` (
  `CallCenterId` int(11) NOT NULL AUTO_INCREMENT,
  `CCName` varchar(45) DEFAULT NULL,
  `CCphone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CallCenterId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callcenter`
--

LOCK TABLES `callcenter` WRITE;
/*!40000 ALTER TABLE `callcenter` DISABLE KEYS */;
INSERT INTO `callcenter` VALUES (1,'Fake center','6666666666'),(2,'real center','5555555555'),(3,'Unreal Center','4444444444');
/*!40000 ALTER TABLE `callcenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccemp`
--

DROP TABLE IF EXISTS `ccemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccemp` (
  `CCEmp` int(11) NOT NULL,
  `CallCenter` int(11) NOT NULL,
  KEY `callcenter_idx` (`CallCenter`),
  KEY `CCEmp_idx` (`CCEmp`),
  CONSTRAINT `CCEmp` FOREIGN KEY (`CCEmp`) REFERENCES `users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `callcenter` FOREIGN KEY (`CallCenter`) REFERENCES `callcenter` (`CallCenterId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccemp`
--

LOCK TABLES `ccemp` WRITE;
/*!40000 ALTER TABLE `ccemp` DISABLE KEYS */;
INSERT INTO `ccemp` VALUES (1,1),(4,2),(3,1);
/*!40000 ALTER TABLE `ccemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disaster`
--

DROP TABLE IF EXISTS `disaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disaster` (
  `DisasterId` int(10) NOT NULL AUTO_INCREMENT,
  `ZipCode` int(5) NOT NULL,
  `DisasterType` mediumint(9) DEFAULT NULL,
  `CallCenter` int(11) DEFAULT NULL,
  PRIMARY KEY (`DisasterId`),
  KEY `DisasType_idx` (`DisasterType`),
  KEY `CallCenter_idx` (`CallCenter`),
  CONSTRAINT `DisasCC` FOREIGN KEY (`CallCenter`) REFERENCES `callcenter` (`CallCenterId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `DisasType` FOREIGN KEY (`DisasterType`) REFERENCES `disastertype` (`TypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disaster`
--

LOCK TABLES `disaster` WRITE;
/*!40000 ALTER TABLE `disaster` DISABLE KEYS */;
INSERT INTO `disaster` VALUES (1,52246,1,1),(2,55555,3,2),(3,52246,4,1),(4,55555,2,2);
/*!40000 ALTER TABLE `disaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disastertype`
--

DROP TABLE IF EXISTS `disastertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disastertype` (
  `TypeId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `DisasterDesc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disastertype`
--

LOCK TABLES `disastertype` WRITE;
/*!40000 ALTER TABLE `disastertype` DISABLE KEYS */;
INSERT INTO `disastertype` VALUES (1,'Fire'),(2,'Tornado'),(3,'Hurricane'),(4,'Earthquake'),(5,'hail');
/*!40000 ALTER TABLE `disastertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `ItemId` int(10) NOT NULL AUTO_INCREMENT,
  `ItemDesc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'water'),(2,'bread'),(3,'rice'),(4,'Work'),(5,'wood');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provideaid`
--

DROP TABLE IF EXISTS `provideaid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provideaid` (
  `ProvideAidId` int(10) NOT NULL AUTO_INCREMENT,
  `ProvideUser` int(11) NOT NULL,
  `RequestId` int(10) NOT NULL,
  `ProvideAidStatus` int(1) DEFAULT NULL,
  PRIMARY KEY (`ProvideAidId`),
  KEY `Status_idx` (`ProvideAidStatus`),
  KEY `RequestedAid_idx` (`RequestId`),
  KEY `PovidingUser_idx` (`ProvideUser`),
  CONSTRAINT `ProvideUser` FOREIGN KEY (`ProvideUser`) REFERENCES `users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `RequestedAid` FOREIGN KEY (`RequestId`) REFERENCES `requests` (`RequestId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Status` FOREIGN KEY (`ProvideAidStatus`) REFERENCES `aidstatus` (`StatusId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provideaid`
--

LOCK TABLES `provideaid` WRITE;
/*!40000 ALTER TABLE `provideaid` DISABLE KEYS */;
INSERT INTO `provideaid` VALUES (1,3,1,1),(2,6,2,3),(3,3,2,3);
/*!40000 ALTER TABLE `provideaid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provideitem`
--

DROP TABLE IF EXISTS `provideitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provideitem` (
  `ProvideId` int(11) DEFAULT NULL,
  `ProvideItem` int(11) DEFAULT NULL,
  `Quantity` int(5) DEFAULT NULL,
  KEY `ProvideAidId_idx` (`ProvideId`),
  KEY `Provideitem_idx` (`ProvideItem`),
  CONSTRAINT `ProvideAidId` FOREIGN KEY (`ProvideId`) REFERENCES `provideaid` (`ProvideAidId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Provideitem` FOREIGN KEY (`ProvideItem`) REFERENCES `items` (`ItemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provideitem`
--

LOCK TABLES `provideitem` WRITE;
/*!40000 ALTER TABLE `provideitem` DISABLE KEYS */;
INSERT INTO `provideitem` VALUES (1,2,3),(1,1,2),(2,2,10);
/*!40000 ALTER TABLE `provideitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestitem`
--

DROP TABLE IF EXISTS `requestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestitem` (
  `RequestId` int(10) DEFAULT NULL,
  `ItemId` int(10) DEFAULT NULL,
  `Quantity` int(5) DEFAULT NULL,
  KEY `Request_idx` (`RequestId`),
  KEY `requestitem_idx` (`ItemId`),
  CONSTRAINT `request` FOREIGN KEY (`RequestId`) REFERENCES `requests` (`RequestId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `requestitem` FOREIGN KEY (`ItemId`) REFERENCES `items` (`ItemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestitem`
--

LOCK TABLES `requestitem` WRITE;
/*!40000 ALTER TABLE `requestitem` DISABLE KEYS */;
INSERT INTO `requestitem` VALUES (1,1,20),(1,2,10),(1,3,10),(1,4,15),(4,1,25),(2,2,10);
/*!40000 ALTER TABLE `requestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `RequestId` int(10) NOT NULL AUTO_INCREMENT,
  `RequestStatus` int(1) DEFAULT NULL,
  `DisasterId` int(10) DEFAULT NULL,
  `RequestUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`RequestId`),
  KEY `status_idx` (`RequestStatus`),
  KEY `RequestStatus_idx` (`RequestStatus`),
  KEY `disasterid_idx` (`DisasterId`),
  KEY `RequestId_idx` (`RequestUser`),
  CONSTRAINT `RequestId` FOREIGN KEY (`RequestUser`) REFERENCES `users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `RequestStatus` FOREIGN KEY (`RequestStatus`) REFERENCES `aidstatus` (`StatusId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `disasterid` FOREIGN KEY (`DisasterId`) REFERENCES `disaster` (`DisasterId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,2,1,1),(2,3,2,1),(3,1,3,1),(4,2,1,3);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `RoleId` int(1) NOT NULL,
  `Role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'Call Center'),(3,'Normal');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` char(20) NOT NULL,
  `LastName` char(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `Passwordd` varchar(20) NOT NULL,
  `ZipCode` int(5) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `RoleId` int(1) DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  KEY `RoleId_idx` (`RoleId`),
  CONSTRAINT `RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sam','sam','sam@gmail.com','sam',55555,'5555555555',2),(2,'marlow','wink','m@gamil.com','this',52246,'6666666666',1),(3,'n','n','n@gamil.com','n',55555,'3333333333',2),(4,'c','c','c@gmail.com','c',55555,'2222222222',2),(5,'raman','a','raman@gmail.com','raman',52246,'1111111111',3),(6,'sydney','s','sydeny@gmail.com','f',55555,'4444444444',1);
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

-- Dump completed on 2016-04-26 15:44:19
