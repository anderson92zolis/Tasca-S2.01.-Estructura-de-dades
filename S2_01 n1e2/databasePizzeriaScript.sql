-- MySQL Workbench Synchronization
-- Generated: 2023-02-10 21:54
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: The ENGINEER

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `DatabasePizzeria` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Client` (
  `Client_Id` INT(12) NOT NULL COMMENT 'Per a cada client/a emmagatzemem un identificador únic:\n\n    Nom.\n    Cognoms.\n    Adreça.\n    Codi postal.\n    Localitat.\n    Província.\n    Número de telèfon.',
  `Name` VARCHAR(50) NOT NULL,
  `Surname` VARCHAR(50) NULL DEFAULT NULL,
  `AdressStreet` VARCHAR(50) NOT NULL,
  `PostCode` VARCHAR(50) NOT NULL,
  `Location` VARCHAR(50) NOT NULL,
  `Province` VARCHAR(50) NOT NULL,
  `PhoneNumber` INT(12) NOT NULL,
  PRIMARY KEY (`Client_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Province` (
  `Province_Id` INT(12) NOT NULL COMMENT 'Les dades de localitat i província estaran emmagatzemats en taules separades. Sabem que una localitat pertany a una única província, i que una província pot tenir moltes localitats. Per a cada localitat emmagatzemem un identificador únic i un nom. Per a cada província emmagatzemem un identificador únic i un nom.',
  `Client_Id` INT(12) NOT NULL,
  `Province_Name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Province_Id`, `Client_Id`),
  INDEX `Client_id_idx` (`Client_Id` ASC) VISIBLE,
  CONSTRAINT `Client_Id`
    FOREIGN KEY (`Client_Id`)
    REFERENCES `DatabasePizzeria`.`Client` (`Client_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Location` (
  `Location_Id` INT(12) NOT NULL,
  `Province_Id` INT(12) NOT NULL,
  `Location_Name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Location_Id`, `Province_Id`),
  INDEX `fk_Location_Province _idx` (`Province_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Location_Province `
    FOREIGN KEY (`Province_Id`)
    REFERENCES `DatabasePizzeria`.`Province` (`Province_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Order` (
  `Order_Id` INT(12) NOT NULL COMMENT 'Una persona pot realitzar moltes comandes, però una única comanda només pot ser realitzat per una única persona. De cada comanda s\'emmagatzema un identificador únic:\n\n    Data/hora.\n    Si la comanda és per a repartiment a domicili o per a recollir en botiga.\n    La quantitat de productes que s\'han seleccionat de cada tipus.\n    El preu total.\n',
  `Client_Id` INT(12) NOT NULL,
  `Shop_Shop_Id` INT(12) NOT NULL,
  `DeliveryEmployer_Employee_Id` INT(12) NOT NULL,
  `DeliveryEmployer_DeliveryEmployer_Id` INT(12) NOT NULL,
  `OrderDate` TIMESTAMP NOT NULL,
  `PickUp_Store_TakeAway` ENUM('PickUP', 'TakeAway') NOT NULL,
  `QuantityProducts` INT(11) NOT NULL,
  `TotalPrice` INT(11) NOT NULL,
  PRIMARY KEY (`Order_Id`, `Client_Id`, `Shop_Shop_Id`, `DeliveryEmployer_DeliveryEmployer_Id`),
  INDEX `fk_Order_Client 1_idx` (`Client_Id` ASC) VISIBLE,
  INDEX `fk_Order_Shop 1_idx` (`Shop_Shop_Id` ASC) VISIBLE,
  INDEX `fk_Order_DeliveryEmployer 1_idx` (`DeliveryEmployer_Employee_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Client 1`
    FOREIGN KEY (`Client_Id`)
    REFERENCES `DatabasePizzeria`.`Client` (`Client_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Shop 1`
    FOREIGN KEY (`Shop_Shop_Id`)
    REFERENCES `DatabasePizzeria`.`Shop` (`Shop_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_DeliveryEmployer 1`
    FOREIGN KEY (`DeliveryEmployer_Employee_Id`)
    REFERENCES `DatabasePizzeria`.`DeliveryEmployer` (`Employee_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Products` (
  `Products_Id` INT(12) NOT NULL,
  `Order_Id` INT(12) NOT NULL,
  `ProductsToChoise` ENUM('Pizza', 'Burguer', 'Drinks') NOT NULL COMMENT 'Els productes poden ser pizzes, hamburgueses i begudes. ',
  `Name` VARCHAR(50) NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `Photo_URL` VARCHAR(50) NULL DEFAULT NULL,
  `Preu` INT(11) NOT NULL,
  PRIMARY KEY (`Products_Id`, `Order_Id`),
  INDEX `fk_Products_Order 1_idx` (`Order_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Order 1`
    FOREIGN KEY (`Order_Id`)
    REFERENCES `DatabasePizzeria`.`Order` (`Order_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`CategoriaPizza` (
  `Pizza_Id` INT(12) NOT NULL COMMENT 'En el cas de les pizzes existeixen diverses categories que poden anar canviant de nom al llarg de l\'any. Una pizza només pot estar dins d\'una categoria, però una categoria pot tenir moltes pizzes.',
  `Products_Id` INT(12) NOT NULL,
  `Pizza_Name` SET('OptionA', 'OptionB') NOT NULL COMMENT 'En el cas de les pizzes existeixen diverses categories que poden anar canviant de nom al llarg de l\'any.',
  PRIMARY KEY (`Pizza_Id`, `Products_Id`),
  INDEX `fk_CategoriaPizza_Products 1_idx` (`Products_Id` ASC) VISIBLE,
  CONSTRAINT `fk_CategoriaPizza_Products 1`
    FOREIGN KEY (`Products_Id`)
    REFERENCES `DatabasePizzeria`.`Products` (`Products_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Shop` (
  `Shop_Id` INT(12) NOT NULL,
  `Adress` VARCHAR(50) NOT NULL,
  `PostCode` VARCHAR(50) NULL DEFAULT NULL,
  `Location` VARCHAR(50) NOT NULL,
  `Province` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Shop_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Employee` (
  `Employee_Id` INT(12) NOT NULL,
  `Shop_Id` INT(12) NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `Surname` VARCHAR(50) NULL DEFAULT NULL,
  `Nif` VARCHAR(50) NOT NULL,
  `MovilPhone` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Employee_Id`, `Shop_Id`),
  INDEX `fk_Employee_Shop 1_idx` (`Shop_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Shop 1`
    FOREIGN KEY (`Shop_Id`)
    REFERENCES `DatabasePizzeria`.`Shop` (`Shop_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`DeliveryEmployer` (
  `Employee_Id` INT(12) NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `DataTime` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`Employee_Id`),
  INDEX `fk_DeliveryEmployer_Employee 1_idx` (`Employee_Id` ASC) VISIBLE,
  CONSTRAINT `fk_DeliveryEmployer_Employee 1`
    FOREIGN KEY (`Employee_Id`)
    REFERENCES `DatabasePizzeria`.`Employee` (`Employee_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
