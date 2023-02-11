-- MySQL Workbench Synchronization
-- Generated: 2023-02-11 01:38
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: azoli

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Youtube` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Youtube`.`User` (
  `User_Id` INT(12) NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  `BornDate` DATE NULL DEFAULT NULL,
  `Sex` ENUM('F', 'M') NULL DEFAULT NULL COMMENT 'Sexe\n\n F    :    Female\nM    :    Male\n',
  `Country` VARCHAR(50) NULL DEFAULT NULL,
  `PostCode` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`User_Id`, `Name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`UploadVideos` (
  `UploadVideos_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `User_User_Id` INT(12) NOT NULL,
  `User_Name` VARCHAR(50) NOT NULL,
  `Title` VARCHAR(500) NOT NULL,
  `Description` VARCHAR(2000) NULL DEFAULT NULL,
  `Size` VARCHAR(50) NULL DEFAULT NULL,
  `Name_Video_File` VARCHAR(50) NULL DEFAULT NULL,
  `Video_Length` VARCHAR(50) NULL DEFAULT NULL,
  `Thumbnail` VARCHAR(50) NULL DEFAULT NULL,
  `NumberReproductions` INT(12) NULL DEFAULT NULL,
  `NumberLikes` INT(12) NULL DEFAULT NULL,
  `NumberDisLikes` INT(12) NOT NULL,
  `stateVideo` ENUM('Public', 'Hidden', 'Private') NOT NULL,
  `PublishDataTime` DATETIME NOT NULL,
  PRIMARY KEY (`UploadVideos_Id`, `User_User_Id`, `User_Name`),
  INDEX `fk_UploadVideos_User1_idx` (`User_User_Id` ASC, `User_Name` ASC) VISIBLE,
  CONSTRAINT `fk_UploadVideos_User1`
    FOREIGN KEY (`User_User_Id` , `User_Name`)
    REFERENCES `Youtube`.`User` (`User_Id` , `Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`TagVideos` (
  `UploadVideos_UploadVideos_Id` INT(12) NOT NULL,
  `Tag_Tag_Id` INT(12) NOT NULL,
  PRIMARY KEY (`UploadVideos_UploadVideos_Id`, `Tag_Tag_Id`),
  INDEX `fk_TagVideos_UploadVideos1_idx` (`UploadVideos_UploadVideos_Id` ASC) VISIBLE,
  INDEX `fk_TagVideos_Tag1_idx` (`Tag_Tag_Id` ASC) VISIBLE,
  CONSTRAINT `fk_TagVideos_UploadVideos1`
    FOREIGN KEY (`UploadVideos_UploadVideos_Id`)
    REFERENCES `Youtube`.`UploadVideos` (`UploadVideos_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TagVideos_Tag1`
    FOREIGN KEY (`Tag_Tag_Id`)
    REFERENCES `Youtube`.`Tag` (`Tag_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Channel` (
  `Channel_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `User_User_Id` INT(12) NOT NULL,
  `ChannelName` VARCHAR(50) NOT NULL,
  `ChannelDescription` VARCHAR(50) NULL DEFAULT NULL,
  `ChannelDataTime` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Channel_Id`, `User_User_Id`),
  INDEX `fk_Channel_User1_idx` (`User_User_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Channel_User1`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `Youtube`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Tag` (
  `Tag_Id` INT(12) NOT NULL,
  `Name_Tag` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Tag_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Channel_has_User_Subscription` (
  `Channel_Channel_Id` INT(12) NOT NULL,
  `User_User_Id` INT(12) NOT NULL,
  PRIMARY KEY (`Channel_Channel_Id`, `User_User_Id`),
  INDEX `fk_Channel_has_User_User1_idx` (`User_User_Id` ASC) VISIBLE,
  INDEX `fk_Channel_has_User_Channel1_idx` (`Channel_Channel_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Channel_has_User_Channel1`
    FOREIGN KEY (`Channel_Channel_Id`)
    REFERENCES `Youtube`.`Channel` (`Channel_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Channel_has_User_User1`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `Youtube`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`VideLike` (
  `VideoLike_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `User_Name` VARCHAR(50) NOT NULL,
  `UploadVideos_UploadVideos_Id` INT(12) NOT NULL,
  `DateTimeLike` TIMESTAMP NOT NULL,
  PRIMARY KEY (`VideoLike_Id`, `User_Name`, `UploadVideos_UploadVideos_Id`),
  INDEX `fk_VideLike_UploadVideos1_idx` (`UploadVideos_UploadVideos_Id` ASC) VISIBLE,
  CONSTRAINT `fk_VideLike_UploadVideos1`
    FOREIGN KEY (`UploadVideos_UploadVideos_Id`)
    REFERENCES `Youtube`.`UploadVideos` (`UploadVideos_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`VideoDislike` (
  `VideoDislike_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `User_Name` VARCHAR(50) NOT NULL,
  `UploadVideos_UploadVideos_Id` INT(12) NOT NULL,
  `DateTimeLike` DATETIME NOT NULL,
  PRIMARY KEY (`VideoDislike_Id`, `User_Name`, `UploadVideos_UploadVideos_Id`),
  INDEX `fk_VideoDislike_UploadVideos1_idx` (`UploadVideos_UploadVideos_Id` ASC) VISIBLE,
  CONSTRAINT `fk_VideoDislike_UploadVideos1`
    FOREIGN KEY (`UploadVideos_UploadVideos_Id`)
    REFERENCES `Youtube`.`UploadVideos` (`UploadVideos_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Playlist` (
  `Playlist_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `Playlist_Name` VARCHAR(50) NOT NULL,
  `CreationDatePlaylist` TIMESTAMP NULL DEFAULT NULL,
  `Estado` ENUM('Public', 'Private') NOT NULL,
  `VideLike_VideoLike_Id` INT(12) NOT NULL,
  PRIMARY KEY (`Playlist_Id`, `VideLike_VideoLike_Id`),
  INDEX `fk_Playlist_VideLike1_idx` (`VideLike_VideoLike_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Playlist_VideLike1`
    FOREIGN KEY (`VideLike_VideoLike_Id`)
    REFERENCES `Youtube`.`VideLike` (`VideoLike_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Commet` (
  `Commet_Id` INT(12) NOT NULL,
  `UploadVideos_UploadVideos_Id` INT(12) NOT NULL,
  `TextCommet` TEXT NULL DEFAULT NULL,
  `DataTimeComment` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`Commet_Id`, `UploadVideos_UploadVideos_Id`),
  INDEX `fk_Commet_UploadVideos1_idx` (`UploadVideos_UploadVideos_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Commet_UploadVideos1`
    FOREIGN KEY (`UploadVideos_UploadVideos_Id`)
    REFERENCES `Youtube`.`UploadVideos` (`UploadVideos_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`CommentLikeDislike` (
  `CommentLikeDislike_Id` INT(12) NOT NULL AUTO_INCREMENT,
  `Commet_Commet_Id` INT(12) NOT NULL,
  `statusLikeDislikeCome` ENUM('LIKE', 'DISLIKE') NOT NULL,
  `DataTimeLikeDislike` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`CommentLikeDislike_Id`, `Commet_Commet_Id`),
  INDEX `fk_CommentLikeDislike_Commet1_idx` (`Commet_Commet_Id` ASC) VISIBLE,
  CONSTRAINT `fk_CommentLikeDislike_Commet1`
    FOREIGN KEY (`Commet_Commet_Id`)
    REFERENCES `Youtube`.`Commet` (`Commet_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
