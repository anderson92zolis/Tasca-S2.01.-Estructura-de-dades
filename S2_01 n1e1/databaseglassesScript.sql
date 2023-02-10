-- MySQL Workbench Synchronization
-- Generated: 2023-02-10 19:59
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: The ENGINEER

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `databaseglasses` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `databaseglasses`.`Supplier` (
  `Supplier_Id` INT(11) NOT NULL,
  `Supplier_Name` VARCHAR(50) NOT NULL,
  `Supplier_AdressId` VARCHAR(50) NULL DEFAULT NULL,
  `Supplier_PhoneNumber` INT(11) NULL DEFAULT NULL,
  `Supplier_Fax` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Supplier_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `databaseglasses`.`SupplierAdress` (
  `AdressId` INT(11) NOT NULL,
  `Supplier_Id` INT(11) NOT NULL,
  `NameStreet` VARCHAR(45) NULL DEFAULT NULL,
  `Floor` VARCHAR(45) NULL DEFAULT NULL,
  `Door` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `CP` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`AdressId`, `Supplier_Id`),
  INDEX `fk_SupplierAdress_Supplier 1_idx` (`Supplier_Id` ASC) VISIBLE,
  CONSTRAINT `fk_SupplierAdress_Supplier 1`
    FOREIGN KEY (`Supplier_Id`)
    REFERENCES `databaseglasses`.`Supplier` (`Supplier_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `databaseglasses`.`Glasses` (
  `BrandId` INT(12) NOT NULL,
  `Client_Id` INT(12) NULL DEFAULT NULL,
  `SupplierId` INT(11) NULL DEFAULT NULL,
  `GlassesGraduation` VARCHAR(50) NULL DEFAULT NULL,
  `FrameType` VARCHAR(50) NULL DEFAULT NULL,
  `FrameColour` VARCHAR(50) NULL DEFAULT NULL,
  `GlassColour` VARCHAR(50) NULL DEFAULT NULL,
  `Price` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`BrandId`),
  INDEX `fk_Glasses_Supplier 1_idx` (`SupplierId` ASC) VISIBLE,
  INDEX `fk_Glasses_Clients 1_idx` (`Client_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Supplier 1`
    FOREIGN KEY (`SupplierId`)
    REFERENCES `databaseglasses`.`Supplier` (`Supplier_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Clients 1`
    FOREIGN KEY (`Client_Id`)
    REFERENCES `databaseglasses`.`Clients` (`Client_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `databaseglasses`.`Clients` (
  `Client_Id` INT(11) NOT NULL,
  `RecomentClient` INT(12) NULL DEFAULT NULL,
  `Name` VARCHAR(50) NULL DEFAULT NULL,
  `Address` VARCHAR(50) NULL DEFAULT NULL,
  `Phone` INT(12) NULL DEFAULT NULL,
  `Email` VARCHAR(50) NULL DEFAULT NULL,
  `DataRegister` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`Client_Id`),
  INDEX `fk_Clients_Clients 1_idx` (`RecomentClient` ASC) VISIBLE,
  CONSTRAINT `fk_Clients_Clients 1`
    FOREIGN KEY (`RecomentClient`)
    REFERENCES `databaseglasses`.`Clients` (`Client_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `databaseglasses`.`Employee` (
  `EmployeeId` INT(12) NOT NULL,
  `Client_Id` INT(12) NOT NULL,
  `Name` VARCHAR(50) NULL DEFAULT NULL,
  `Surname` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`, `Client_Id`),
  INDEX `fk_Employee_Clients 1_idx` (`Client_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Clients 1`
    FOREIGN KEY (`Client_Id`)
    REFERENCES `databaseglasses`.`Clients` (`Client_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
