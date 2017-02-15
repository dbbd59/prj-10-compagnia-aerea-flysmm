-- MySQL Script generated by MySQL Workbench
-- 02/15/17 12:29:48
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema flysmmdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema flysmmdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flysmmdb` DEFAULT CHARACTER SET utf8 ;
USE `flysmmdb` ;

-- -----------------------------------------------------
-- Table `flysmmdb`.`Airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Airport` (
  `ICAO` VARCHAR(4) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Timezone` INT NOT NULL,
  PRIMARY KEY (`ICAO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Aircraft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Aircraft` (
  `ID_aircraft` INT NOT NULL,
  `Model` VARCHAR(45) NULL,
  `Seat_Number` INT NULL,
  `Weight_Bound` INT NULL,
  `Constructor` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_aircraft`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Flight` (
  `Departure_ICAO` VARCHAR(4) NOT NULL,
  `Arrival_ICAO` VARCHAR(4) NOT NULL,
  `Flight_ID` VARCHAR(5) NOT NULL,
  `Departure_Date` DATE NOT NULL,
  `Departure_Time` TIME(2) NOT NULL,
  `Arrival_Date` DATE NOT NULL,
  `Arrival_Time` TIME(2) NOT NULL,
  `Aircraft_ID_aircraft` INT NOT NULL,
  PRIMARY KEY (`Flight_ID`, `Departure_Date`, `Aircraft_ID_aircraft`),
  INDEX `fk_Airport_has_Airport_Airport1_idx` (`Arrival_ICAO` ASC),
  INDEX `fk_Airport_has_Airport_Airport_idx` (`Departure_ICAO` ASC),
  INDEX `fk_Flight_Aircraft1_idx` (`Aircraft_ID_aircraft` ASC),
  CONSTRAINT `fk_Airport_has_Airport_Airport`
    FOREIGN KEY (`Departure_ICAO`)
    REFERENCES `flysmmdb`.`Airport` (`ICAO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airport_has_Airport_Airport1`
    FOREIGN KEY (`Arrival_ICAO`)
    REFERENCES `flysmmdb`.`Airport` (`ICAO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flight_Aircraft1`
    FOREIGN KEY (`Aircraft_ID_aircraft`)
    REFERENCES `flysmmdb`.`Aircraft` (`ID_aircraft`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Seat` (
  `Row` INT NOT NULL,
  `Seat` VARCHAR(45) NOT NULL,
  `Tariff` VARCHAR(45) NOT NULL,
  `Aircraft_ID_aircraft` INT NOT NULL,
  PRIMARY KEY (`Row`, `Seat`, `Aircraft_ID_aircraft`),
  INDEX `fk_Seat_Aircraft1_idx` (`Aircraft_ID_aircraft` ASC),
  CONSTRAINT `fk_Seat_Aircraft1`
    FOREIGN KEY (`Aircraft_ID_aircraft`)
    REFERENCES `flysmmdb`.`Aircraft` (`ID_aircraft`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Promotion` (
  `IdPromo` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Expire_Date` DATE NULL DEFAULT NULL,
  `Discount_rate` INT NULL DEFAULT NULL,
  `Start_Date` DATE NULL DEFAULT NULL,
  `Fidelity` TINYINT(1) NULL DEFAULT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IdPromo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Price` (
  `Price` FLOAT NOT NULL,
  `No_Seats_Available` INT NOT NULL,
  `Promotion_IdPromo` INT NULL,
  `Flight_Flight_ID` VARCHAR(5) NOT NULL,
  `Flight_Departure_Date` DATE NOT NULL,
  `Seat_Row` INT NOT NULL,
  `Seat_Seat` VARCHAR(45) NOT NULL,
  `Seat_Aircraft_ID_aircraft` INT NOT NULL,
  `Price_baggage` FLOAT NOT NULL,
  INDEX `fk_Price_Promotion1_idx` (`Promotion_IdPromo` ASC),
  PRIMARY KEY (`Flight_Flight_ID`, `Flight_Departure_Date`),
  INDEX `fk_Price_Seat1_idx` (`Seat_Row` ASC, `Seat_Seat` ASC, `Seat_Aircraft_ID_aircraft` ASC),
  CONSTRAINT `fk_Price_Promotion1`
    FOREIGN KEY (`Promotion_IdPromo`)
    REFERENCES `flysmmdb`.`Promotion` (`IdPromo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Price_Flight1`
    FOREIGN KEY (`Flight_Flight_ID` , `Flight_Departure_Date`)
    REFERENCES `flysmmdb`.`Flight` (`Flight_ID` , `Departure_Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Price_Seat1`
    FOREIGN KEY (`Seat_Row` , `Seat_Seat` , `Seat_Aircraft_ID_aircraft`)
    REFERENCES `flysmmdb`.`Seat` (`Row` , `Seat` , `Aircraft_ID_aircraft`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Customer` (
  `ID_Customer` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Surname` VARCHAR(45) NULL,
  `Date_of_birth` DATE NULL,
  `Fidelity_Points` INT NULL,
  `Type_of_custumers` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `Phone_NO` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Customer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Payment_methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Payment_methods` (
  `No_card` INT NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `CVV` VARCHAR(45) NOT NULL,
  `Expire` DATE NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `User_Fiscal_Code` INT NOT NULL,
  PRIMARY KEY (`No_card`, `User_Fiscal_Code`),
  INDEX `fk_Payment_methods_User1_idx` (`User_Fiscal_Code` ASC),
  CONSTRAINT `fk_Payment_methods_User1`
    FOREIGN KEY (`User_Fiscal_Code`)
    REFERENCES `flysmmdb`.`Customer` (`ID_Customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Registrer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Registrer` (
  `Code_prenotazione` INT NOT NULL,
  `ID_payment` VARCHAR(45) NULL,
  `Date` DATE NULL,
  PRIMARY KEY (`Code_prenotazione`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Baggage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Baggage` (
  `ID_Baggage` INT NOT NULL,
  `Weight` INT NOT NULL,
  PRIMARY KEY (`ID_Baggage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Passenger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Passenger` (
  `Fiscal_code` VARCHAR(16) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Birth_date` DATE NOT NULL,
  `ID_code` VARCHAR(45) NOT NULL,
  `Type_ID` VARCHAR(45) NOT NULL,
  `Baggage_ID_Baggage` INT NOT NULL,
  PRIMARY KEY (`Fiscal_code`),
  INDEX `fk_Passenger_Baggage1_idx` (`Baggage_ID_Baggage` ASC),
  CONSTRAINT `fk_Passenger_Baggage1`
    FOREIGN KEY (`Baggage_ID_Baggage`)
    REFERENCES `flysmmdb`.`Baggage` (`ID_Baggage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flysmmdb`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flysmmdb`.`Book` (
  `User_ID` INT NOT NULL,
  `IdBook` INT NOT NULL,
  `Payed` INT(1) NOT NULL,
  `Expired` INT(1) NOT NULL,
  `Booking_date` DATETIME NOT NULL,
  `Passenger_Fiscal_code` VARCHAR(16) NOT NULL,
  `Flight_Flight_ID` VARCHAR(5) NOT NULL,
  `Flight_Departure_Date` DATE NOT NULL,
  `Flight_Airplane_ID` INT NOT NULL,
  `Total_Price` FLOAT NULL,
  PRIMARY KEY (`User_ID`, `IdBook`, `Flight_Flight_ID`, `Flight_Departure_Date`, `Flight_Airplane_ID`),
  INDEX `fk_User_has_Flight_User1_idx` (`User_ID` ASC),
  INDEX `fk_Book_Passenger1_idx` (`Passenger_Fiscal_code` ASC),
  INDEX `fk_Book_Flight1_idx` (`Flight_Flight_ID` ASC, `Flight_Departure_Date` ASC, `Flight_Airplane_ID` ASC),
  CONSTRAINT `fk_User_has_Flight_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `flysmmdb`.`Customer` (`ID_Customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_Passenger1`
    FOREIGN KEY (`Passenger_Fiscal_code`)
    REFERENCES `flysmmdb`.`Passenger` (`Fiscal_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_Flight1`
    FOREIGN KEY (`Flight_Flight_ID` , `Flight_Departure_Date`)
    REFERENCES `flysmmdb`.`Flight` (`Flight_ID` , `Departure_Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
