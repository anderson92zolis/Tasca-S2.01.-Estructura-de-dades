-- MySQL Workbench Synchronization
-- Generated: 2023-02-23 16:54
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: The ENGINEER

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `databaseglasses` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `databaseglasses`.`Supplier` (
  `Supplier_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `Supplier_Name` VARCHAR(50) NOT NULL,
  `Supplier_PhoneNumber` INT(12) NOT NULL,
  `Supplier_Fax` INT(12) NULL DEFAULT NULL,
  `Supplier_NIF` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Supplier_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `databaseglasses`.`SupplierAdress` (
  `Supplier_Supplier_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `NameStreet` VARCHAR(50) NOT NULL,
  `Floor` VARCHAR(50) NOT NULL,
  `Door` VARCHAR(50) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `CP` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Floor`),
  INDEX `fk_SupplierAdress_Supplier 1_idx` (`Supplier_Supplier_Id` ASC) VISIBLE,
  CONSTRAINT `fk_SupplierAdress_Supplier 1`
    FOREIGN KEY (`Supplier_Supplier_Id`)
    REFERENCES `databaseglasses`.`Supplier` (`Supplier_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `databaseglasses`.`Glasses` (
  `BrandId` INT(12) NOT NULL AUTO_INCREMENT,
  `Client_Id` INT(12) NOT NULL,
  `SupplierId` INT(12) NOT NULL,
  `Brands` VARCHAR(50) NOT NULL,
  `GlassesGraduation` VARCHAR(50) NULL DEFAULT NULL,
  `FrameType` ENUM('Floating', 'Paste', 'Metalic') NOT NULL,
  `FrameColour` VARCHAR(50) NULL DEFAULT NULL,
  `GlassColour` VARCHAR(50) NULL DEFAULT NULL,
  `Price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`BrandId`),
  UNIQUE INDEX `fk_Glasses_Supplier 1_idx` (`SupplierId` ASC) INVISIBLE,
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
  `Client_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Address` VARCHAR(50) NULL DEFAULT NULL,
  `Phone` INT(12) NOT NULL,
  `Email` VARCHAR(50) NULL DEFAULT NULL,
  `DataRegister` DATETIME NOT NULL,
  `RecommentClient` INT(12) NULL DEFAULT NULL COMMENT 'Recomment clients if exists,',
  PRIMARY KEY (`Client_Id`),
  INDEX `fk_Clients_Clients 1_idx` (`RecommentClient` ASC) INVISIBLE,
  CONSTRAINT `fk_Clients_Clients 1`
    FOREIGN KEY (`RecommentClient`)
    REFERENCES `databaseglasses`.`Clients` (`Client_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `databaseglasses`.`Employee` (
  `EmployeeId` INT(12) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Surname` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`EmployeeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `databaseglasses`.`Sells` (
  `Sell_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Sell_name` VARCHAR(50) NOT NULL,
  `Sell_date` DATE NOT NULL,
  `Clients_Client_Id` INT(12) NOT NULL,
  `Employee_EmployeeId` INT(12) NOT NULL,
  `Glasses_BrandId` INT(12) NOT NULL,
  PRIMARY KEY (`Sell_id`),
  INDEX `fk_Sell_Clients 1_idx` (`Clients_Client_Id` ASC) VISIBLE,
  INDEX `fk_Sell_Employee 1_idx` (`Employee_EmployeeId` ASC) VISIBLE,
  INDEX `fk_Sells_Glasses 1_idx` (`Glasses_BrandId` ASC) VISIBLE,
  CONSTRAINT `fk_Sell_Clients 1`
    FOREIGN KEY (`Clients_Client_Id`)
    REFERENCES `databaseglasses`.`Clients` (`Client_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sell_Employee 1`
    FOREIGN KEY (`Employee_EmployeeId`)
    REFERENCES `databaseglasses`.`Employee` (`EmployeeId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sells_Glasses 1`
    FOREIGN KEY (`Glasses_BrandId`)
    REFERENCES `databaseglasses`.`Glasses` (`BrandId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
