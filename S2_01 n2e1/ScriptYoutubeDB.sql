-- MySQL Workbench Synchronization
-- Generated: 2023-02-19 23:24
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: azoli

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Youtube` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Youtube`.`User` (
  `User_Id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '\n    De cada usuari/ària guardem un identificador únic:\n        Email.\n        Password.\n        Nom d\'usuari/ària.\n        Data de naixement.\n        Sexe.\n        País.\n        Codi postal.\n',
  `Email` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  `NameUser` VARCHAR(50) NOT NULL,
  `BornDate` DATE NULL DEFAULT NULL,
  `Sex` ENUM('F', 'M') NOT NULL COMMENT 'Sexe\n\n F    :    Female\nM    :    Male\n',
  `Country` VARCHAR(50) NOT NULL,
  `PostCode` VARCHAR(50) NULL DEFAULT NULL,
  `Channel_Channel_Id` INT(11) NOT NULL,
  PRIMARY KEY (`User_Id`),
  UNIQUE INDEX `User_Id_UNIQUE` (`User_Id` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `NameUser_UNIQUE` (`NameUser` ASC) VISIBLE,
  INDEX `fk_User_Channel1_idx` (`Channel_Channel_Id` ASC) VISIBLE,
  CONSTRAINT `fk_User_Channel1`
    FOREIGN KEY (`Channel_Channel_Id`)
    REFERENCES `Youtube`.`Channel` (`Channel_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Videos` (
  `Videos_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(500) NOT NULL,
  `Description` VARCHAR(2000) NOT NULL,
  `Size` VARCHAR(50) NULL DEFAULT NULL,
  `Name_Video_File` VARCHAR(50) NOT NULL,
  `Video_Length` INT(11) NOT NULL,
  `Thumbnail` VARCHAR(50) NULL DEFAULT NULL,
  `NumberReproductions` INT(11) NOT NULL,
  `PublishDataTime` DATETIME NOT NULL,
  `Channel_Channel_Id` INT(11) NOT NULL,
  `User_User_Id` INT(11) NOT NULL,
  `State_State_Id` INT(11) NOT NULL,
  PRIMARY KEY (`Videos_Id`, `User_User_Id`),
  INDEX `fk_Videos_Channel1_idx` (`Channel_Channel_Id` ASC) VISIBLE,
  INDEX `fk_Videos_User1_idx` (`User_User_Id` ASC) VISIBLE,
  INDEX `fk_Videos_State1_idx` (`State_State_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Videos_Channel1`
    FOREIGN KEY (`Channel_Channel_Id`)
    REFERENCES `Youtube`.`Channel` (`Channel_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Videos_User1`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `Youtube`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Videos_State1`
    FOREIGN KEY (`State_State_Id`)
    REFERENCES `Youtube`.`State` (`State_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Channel` (
  `Channel_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `ChannelName` VARCHAR(50) NOT NULL,
  `ChannelDescription` VARCHAR(50) NULL DEFAULT NULL,
  `ChannelDataTime` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Channel_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Tag` (
  `Tag_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name_Tag` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Tag_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`VideoLikeDislike` (
  `VideoLikeDislike_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `VideoLikeDislike` ENUM('Like', 'Dislike') NOT NULL,
  `DateTimeLD` TIMESTAMP NOT NULL,
  `User_User_Id` INT(11) NOT NULL,
  `Videos_Videos_Id` INT(11) NOT NULL,
  `Playlist_Playlist_Id` INT(11) NOT NULL,
  PRIMARY KEY (`VideoLikeDislike_Id`, `User_User_Id`, `Videos_Videos_Id`),
  INDEX `fk_VideLike_User1_idx` (`User_User_Id` ASC) VISIBLE,
  INDEX `fk_VideoLikeDislike_Videos1_idx` (`Videos_Videos_Id` ASC) VISIBLE,
  INDEX `fk_VideoLikeDislike_Playlist1_idx` (`Playlist_Playlist_Id` ASC) VISIBLE,
  CONSTRAINT `fk_VideLike_User1`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `Youtube`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VideoLikeDislike_Videos1`
    FOREIGN KEY (`Videos_Videos_Id`)
    REFERENCES `Youtube`.`Videos` (`Videos_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VideoLikeDislike_Playlist1`
    FOREIGN KEY (`Playlist_Playlist_Id`)
    REFERENCES `Youtube`.`Playlist` (`Playlist_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Playlist` (
  `Playlist_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Playlist_Name` VARCHAR(50) NOT NULL,
  `CreationDatePlaylist` TIMESTAMP NULL DEFAULT NULL,
  `Estado` ENUM('Public', 'Private') NOT NULL,
  `State_State_Id` INT(11) NOT NULL,
  PRIMARY KEY (`Playlist_Id`),
  INDEX `fk_Playlist_State1_idx` (`State_State_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Playlist_State1`
    FOREIGN KEY (`State_State_Id`)
    REFERENCES `Youtube`.`State` (`State_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Comment` (
  `Comment_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `TextCommet` TEXT NULL DEFAULT NULL,
  `DataTimeComment` TIMESTAMP NULL DEFAULT NULL,
  `User_User_Id` INT(11) NOT NULL,
  `Videos_Videos_Id` INT(11) NOT NULL,
  PRIMARY KEY (`Comment_Id`, `User_User_Id`, `Videos_Videos_Id`),
  INDEX `fk_Commet_User1_idx` (`User_User_Id` ASC) VISIBLE,
  INDEX `fk_Commet_Videos1_idx` (`Videos_Videos_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Commet_User1`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `Youtube`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commet_Videos1`
    FOREIGN KEY (`Videos_Videos_Id`)
    REFERENCES `Youtube`.`Videos` (`Videos_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Videos_has_Tag` (
  `Videos_Videos_Id` INT(11) NOT NULL,
  `Tag_Tag_Id` INT(11) NOT NULL,
  PRIMARY KEY (`Videos_Videos_Id`, `Tag_Tag_Id`),
  INDEX `fk_Videos_has_Tag_Tag1_idx` (`Tag_Tag_Id` ASC) VISIBLE,
  INDEX `fk_Videos_has_Tag_Videos1_idx` (`Videos_Videos_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Videos_has_Tag_Videos1`
    FOREIGN KEY (`Videos_Videos_Id`)
    REFERENCES `Youtube`.`Videos` (`Videos_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Videos_has_Tag_Tag1`
    FOREIGN KEY (`Tag_Tag_Id`)
    REFERENCES `Youtube`.`Tag` (`Tag_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Subscribe_User_has_Channel` (
  `User_User_Id` INT(11) NOT NULL,
  `Channel_Channel_Id` INT(11) NOT NULL,
  PRIMARY KEY (`User_User_Id`, `Channel_Channel_Id`),
  INDEX `fk_User_has_Channel_Channel1_idx` (`Channel_Channel_Id` ASC) VISIBLE,
  INDEX `fk_User_has_Channel_User1_idx` (`User_User_Id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Channel_User1`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `Youtube`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Channel_Channel1`
    FOREIGN KEY (`Channel_Channel_Id`)
    REFERENCES `Youtube`.`Channel` (`Channel_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`feedBack_has_Comment` (
  `User_has_Comment_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `User_User_Id` INT(11) NOT NULL,
  `Comment_Comment_Id` INT(11) NOT NULL,
  `DATA` DATE NOT NULL,
  `LikeDislikeComment` ENUM('Like', 'Dislike') NOT NULL,
  PRIMARY KEY (`User_has_Comment_Id`, `User_User_Id`, `Comment_Comment_Id`),
  INDEX `fk_User_has_Commet_Commet1_idx` (`Comment_Comment_Id` ASC) VISIBLE,
  INDEX `fk_User_has_Commet_User1_idx` (`User_User_Id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Commet_User1`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `Youtube`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Commet_Commet1`
    FOREIGN KEY (`Comment_Comment_Id`)
    REFERENCES `Youtube`.`Comment` (`Comment_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`State` (
  `State_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `State_Name` ENUM('Public', 'Hidden', 'Private') NOT NULL,
  PRIMARY KEY (`State_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
