-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema relief
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema relief
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `relief` DEFAULT CHARACTER SET utf8 ;
USE `relief` ;

-- -----------------------------------------------------
-- Table `relief`.`aidstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`aidstatus` (
  `StatusId` INT(1) NOT NULL,
  `stats` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`StatusId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relief`.`callcenter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`callcenter` (
  `CallCenterId` INT(11) NOT NULL AUTO_INCREMENT,
  `CCName` VARCHAR(45) NULL DEFAULT NULL,
  `CCphone` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`CallCenterId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relief`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`role` (
  `RoleId` INT(1) NOT NULL,
  `Role` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`RoleId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relief`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`users` (
  `UserId` INT(11) NOT NULL AUTO_INCREMENT,
  `FirstName` CHAR(20) NOT NULL,
  `LastName` CHAR(20) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `Passwordd` VARCHAR(20) NOT NULL,
  `ZipCode` INT(5) NULL DEFAULT NULL,
  `Phone` VARCHAR(20) NULL DEFAULT NULL,
  `RoleId` INT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  INDEX `RoleId_idx` (`RoleId` ASC),
  CONSTRAINT `RoleId`
    FOREIGN KEY (`RoleId`)
    REFERENCES `relief`.`role` (`RoleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relief`.`ccemp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`ccemp` (
  `CCEmp` INT(11) NOT NULL,
  `CallCenter` INT(11) NOT NULL,
  INDEX `callcenter_idx` (`CallCenter` ASC),
  INDEX `CCEmp_idx` (`CCEmp` ASC),
  CONSTRAINT `CCEmp`
    FOREIGN KEY (`CCEmp`)
    REFERENCES `relief`.`users` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `callcenter`
    FOREIGN KEY (`CallCenter`)
    REFERENCES `relief`.`callcenter` (`CallCenterId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relief`.`disastertype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`disastertype` (
  `TypeId` MEDIUMINT(9) NOT NULL AUTO_INCREMENT,
  `DisasterDesc` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`TypeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relief`.`disaster`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`disaster` (
  `DisasterId` INT(10) NOT NULL AUTO_INCREMENT,
  `ZipCode` INT(5) NOT NULL,
  `DisasterType` MEDIUMINT(9) NULL DEFAULT NULL,
  `CallCenter` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`DisasterId`),
  INDEX `DisasType_idx` (`DisasterType` ASC),
  INDEX `CallCenter_idx` (`CallCenter` ASC),
  CONSTRAINT `DisasCC`
    FOREIGN KEY (`CallCenter`)
    REFERENCES `relief`.`callcenter` (`CallCenterId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DisasType`
    FOREIGN KEY (`DisasterType`)
    REFERENCES `relief`.`disastertype` (`TypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relief`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`items` (
  `ItemId` INT(10) NOT NULL AUTO_INCREMENT,
  `ItemDesc` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`ItemId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relief`.`requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`requests` (
  `RequestId` INT(10) NOT NULL AUTO_INCREMENT,
  `RequestedItems` VARCHAR(30) NULL DEFAULT NULL,
  `RequestStatus` INT(1) NULL DEFAULT NULL,
  `DisasterId` INT(10) NULL DEFAULT NULL,
  `RequestUser` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`RequestId`),
  INDEX `status_idx` (`RequestStatus` ASC),
  INDEX `RequestStatus_idx` (`RequestStatus` ASC),
  INDEX `disasterid_idx` (`DisasterId` ASC),
  INDEX `RequestId_idx` (`RequestUser` ASC),
  CONSTRAINT `RequestId`
    FOREIGN KEY (`RequestUser`)
    REFERENCES `relief`.`users` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RequestStatus`
    FOREIGN KEY (`RequestStatus`)
    REFERENCES `relief`.`aidstatus` (`StatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `disasterid`
    FOREIGN KEY (`DisasterId`)
    REFERENCES `relief`.`disaster` (`DisasterId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relief`.`provideaid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`provideaid` (
  `ProvideAidId` INT(10) NOT NULL AUTO_INCREMENT,
  `ProvideUser` INT(11) NOT NULL,
  `RequestId` INT(10) NOT NULL,
  `ProvidedItems` VARCHAR(30) NULL DEFAULT NULL,
  `ProvideQuantity` INT(10) NULL DEFAULT NULL,
  `ProvideAidStatus` INT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ProvideAidId`),
  INDEX `Status_idx` (`ProvideAidStatus` ASC),
  INDEX `RequestedAid_idx` (`RequestId` ASC),
  INDEX `PovidingUser_idx` (`ProvideUser` ASC),
  CONSTRAINT `ProvideUser`
    FOREIGN KEY (`ProvideUser`)
    REFERENCES `relief`.`users` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RequestedAid`
    FOREIGN KEY (`RequestId`)
    REFERENCES `relief`.`requests` (`RequestId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Status`
    FOREIGN KEY (`ProvideAidStatus`)
    REFERENCES `relief`.`aidstatus` (`StatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relief`.`requestitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relief`.`requestitem` (
  `RequestId` INT(10) NULL DEFAULT NULL,
  `ItemId` INT(10) NULL DEFAULT NULL,
  `Quantity` INT(5) NULL DEFAULT NULL,
  INDEX `Request_idx` (`RequestId` ASC),
  INDEX `requestitem_idx` (`ItemId` ASC),
  CONSTRAINT `request`
    FOREIGN KEY (`RequestId`)
    REFERENCES `relief`.`requests` (`RequestId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `requestitem`
    FOREIGN KEY (`ItemId`)
    REFERENCES `relief`.`items` (`ItemId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
