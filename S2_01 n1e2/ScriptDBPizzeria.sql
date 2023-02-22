-- MySQL Workbench Synchronization
-- Generated: 2023-02-22 17:47
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: The ENGINEER

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `DatabasePizzeria` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Client` (
  `Client_Id` INT(12) NOT NULL AUTO_INCREMENT COMMENT 'Per a cada client/a emmagatzemem un identificador únic:\n\n    Nom.\n    Cognoms.\n    Adreça.\n    Codi postal.\n    Localitat.\n    Província.\n    Número de telèfon.',
  `Name` VARCHAR(50) NOT NULL,
  `Surname` VARCHAR(50) NULL DEFAULT NULL,
  `AdressStreet` VARCHAR(50) NOT NULL,
  `PostCode` VARCHAR(50) NOT NULL,
  `Location_Location_Id` INT(12) NOT NULL,
  `Province_Province_Id` INT(12) NOT NULL,
  `PhoneNumber` INT(12) NOT NULL,
  PRIMARY KEY (`Client_Id`),
  INDEX `fk_Client_Province 1_idx` (`Province_Province_Id` ASC) VISIBLE,
  INDEX `fk_Client_Location 1_idx` (`Location_Location_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Province 1`
    FOREIGN KEY (`Province_Province_Id`)
    REFERENCES `DatabasePizzeria`.`Province` (`Province_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Client_Location 1`
    FOREIGN KEY (`Location_Location_Id`)
    REFERENCES `DatabasePizzeria`.`Location` (`Location_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Province` (
  `Province_Id` INT(12) NOT NULL AUTO_INCREMENT COMMENT 'Les dades de localitat i província estaran emmagatzemats en taules separades. Sabem que una localitat pertany a una única província, i que una província pot tenir moltes localitats. Per a cada localitat emmagatzemem un identificador únic i un nom. Per a cada província emmagatzemem un identificador únic i un nom.',
  `Province_Name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Province_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Location` (
  `Location_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `Location_Name` VARCHAR(50) NOT NULL,
  `Province_Province_Id` INT(12) NOT NULL,
  PRIMARY KEY (`Location_Id`),
  INDEX `fk_Location_Province 1_idx` (`Province_Province_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Location_Province 1`
    FOREIGN KEY (`Province_Province_Id`)
    REFERENCES `DatabasePizzeria`.`Province` (`Province_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Order` (
  `Order_Id` INT(12) NOT NULL AUTO_INCREMENT COMMENT 'Una persona pot realitzar moltes comandes, però una única comanda només pot ser realitzat per una única persona. De cada comanda s\'emmagatzema un identificador únic:\n\n    Data/hora.\n    Si la comanda és per a repartiment a domicili o per a recollir en botiga.\n    La quantitat de productes que s\'han seleccionat de cada tipus.\n    El preu total.\n',
  `Client_Id` INT(12) NOT NULL,
  `Shop_Shop_Id` INT(12) NOT NULL,
  `OrderDate` TIMESTAMP NOT NULL,
  `PickUp_Store_TakeAway` ENUM('PickUP', 'TakeAway') NOT NULL,
  `TotalPrice` INT(11) NOT NULL,
  `Deliver_Employee_Id` INT(12) NOT NULL,
  PRIMARY KEY (`Order_Id`, `Shop_Shop_Id`),
  INDEX `fk_Order_Client 1_idx` (`Client_Id` ASC) VISIBLE,
  INDEX `fk_Order_Shop 1_idx` (`Shop_Shop_Id` ASC) VISIBLE,
  INDEX `fk_Order_Deliver 1_idx` (`Deliver_Employee_Id` ASC) VISIBLE,
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
  CONSTRAINT `fk_Order_Deliver 1`
    FOREIGN KEY (`Deliver_Employee_Id`)
    REFERENCES `DatabasePizzeria`.`Deliver` (`Employee_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Products` (
  `Products_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `ProductsToChoise` ENUM('Pizza', 'Burguer', 'Drinks') NOT NULL COMMENT 'Els productes poden ser pizzes, hamburgueses i begudes. ',
  `Name` VARCHAR(50) NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `Photo_URL` VARCHAR(50) NULL DEFAULT NULL,
  `Preu` INT(11) NOT NULL,
  PRIMARY KEY (`Products_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`CategoryProduct` (
  `Category_Id` INT(12) NOT NULL AUTO_INCREMENT COMMENT 'En el cas de les pizzes existeixen diverses categories que poden anar canviant de nom al llarg de l\'any. Una pizza només pot estar dins d\'una categoria, però una categoria pot tenir moltes pizzes.',
  `Products_Id` INT(12) NOT NULL,
  `Category_Name` VARCHAR(50) NOT NULL COMMENT 'En el cas de les pizzes existeixen diverses categories que poden anar canviant de nom al llarg de l\'any.',
  PRIMARY KEY (`Category_Id`),
  INDEX `fk_CategoriaPizza_Products 1_idx` (`Products_Id` ASC) VISIBLE,
  CONSTRAINT `fk_CategoriaPizza_Products 1`
    FOREIGN KEY (`Products_Id`)
    REFERENCES `DatabasePizzeria`.`Products` (`Products_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Shop` (
  `Shop_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `Adress` VARCHAR(50) NOT NULL,
  `PostCode` VARCHAR(50) NOT NULL,
  `Location_Location_Id` INT(12) NOT NULL,
  `Province_Province_Id` INT(12) NOT NULL,
  PRIMARY KEY (`Shop_Id`),
  INDEX `fk_Shop_Location 1_idx` (`Location_Location_Id` ASC) VISIBLE,
  INDEX `fk_Shop_Province 1_idx` (`Province_Province_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Shop_Location 1`
    FOREIGN KEY (`Location_Location_Id`)
    REFERENCES `DatabasePizzeria`.`Location` (`Location_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Shop_Province 1`
    FOREIGN KEY (`Province_Province_Id`)
    REFERENCES `DatabasePizzeria`.`Province` (`Province_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Employee` (
  `Employee_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `Shop_Id` INT(12) NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `Surname` VARCHAR(50) NULL DEFAULT NULL,
  `Nif` VARCHAR(50) NOT NULL,
  `MovilPhone` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Employee_Id`),
  INDEX `fk_Employee_Shop 1_idx` (`Shop_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Shop 1`
    FOREIGN KEY (`Shop_Id`)
    REFERENCES `DatabasePizzeria`.`Shop` (`Shop_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Deliver` (
  `Employee_Id` INT(12) NOT NULL AUTO_INCREMENT,
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

CREATE TABLE IF NOT EXISTS `DatabasePizzeria`.`Order_has_product` (
  `Order_Order_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `Products_Products_Id` INT(12) NOT NULL,
  `quantityProducts` INT(11) NOT NULL,
  PRIMARY KEY (`Order_Order_Id`),
  INDEX `fk_Order_has_product_Products 1_idx` (`Products_Products_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Order_has_product_Order 1`
    FOREIGN KEY (`Order_Order_Id`)
    REFERENCES `DatabasePizzeria`.`Order` (`Order_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_has_product_Products 1`
    FOREIGN KEY (`Products_Products_Id`)
    REFERENCES `DatabasePizzeria`.`Products` (`Products_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
