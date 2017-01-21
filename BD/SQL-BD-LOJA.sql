-- MySQL Script generated by MySQL Workbench
-- 01/04/17 15:24:19
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Loja-Online
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Loja-Online
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Loja-Online` DEFAULT CHARACTER SET utf8 ;
USE `Loja-Online` ;

-- -----------------------------------------------------
-- Table `Loja-Online`.`PRODUTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja-Online`.`PRODUTOS` (
  `PRO_ID` INT NOT NULL AUTO_INCREMENT,
  `PRO_NOME` VARCHAR(100) NOT NULL,
  `PRO_DESCRICAO` VARCHAR(250) NOT NULL,
  `PRO_VALOR` DOUBLE NOT NULL,
  `PRO_QUANTIDADE` INT NOT NULL,
  `PRO_FOTOS` INT NULL,
  `PRO_MARCA` VARCHAR(100) NOT NULL,
  `PRO_CATEGORIA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PRO_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Loja-Online`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja-Online`.`USUARIO` (
  `USU_ID` INT NOT NULL AUTO_INCREMENT,
  `USU_NOME` VARCHAR(100) NOT NULL,
  `USU_TELEFONE` VARCHAR(25) NOT NULL,
  `USU_SEXO` VARCHAR(1) NOT NULL,
  `USU_ENDERECO` VARCHAR(100) NOT NULL,
  `USU_CEP` VARCHAR(10) NOT NULL,
  `USU_CIDADE` VARCHAR(100) NOT NULL,
  `USU_ESTADO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`USU_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Loja-Online`.`COMPRAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja-Online`.`COMPRAS` (
  `COM_ID` INT NOT NULL AUTO_INCREMENT,
  `COM_NUMERO_PEDIDO` INT NOT NULL,
  `COM_SITUACAO` VARCHAR(15) NOT NULL,
  `COM_FORMA_PAGQAMENTO` VARCHAR(45) NOT NULL,
  `USUARIO_USU_ID` INT NOT NULL,
  PRIMARY KEY (`COM_ID`),
  INDEX `fk_COMPRAS_USUARIO1_idx` (`USUARIO_USU_ID` ASC),
  CONSTRAINT `fk_COMPRAS_USUARIO1`
    FOREIGN KEY (`USUARIO_USU_ID`)
    REFERENCES `Loja-Online`.`USUARIO` (`USU_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Loja-Online`.`COM_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja-Online`.`COM_PRODUTO` (
  `COM_PRO_ID` INT NOT NULL AUTO_INCREMENT,
  `PRO_ID` INT NOT NULL,
  `COM_ID` INT NOT NULL,
  PRIMARY KEY (`COM_PRO_ID`),
  INDEX `fk_COM_PRODUTO_PRODUTO1_idx` (`PRO_ID` ASC),
  INDEX `fk_COM_PRODUTO_COMPRAS1_idx` (`COM_ID` ASC),
  CONSTRAINT `fk_COM_PRODUTO_PRODUTO1`
    FOREIGN KEY (`PRO_ID`)
    REFERENCES `Loja-Online`.`PRODUTOS` (`PRO_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COM_PRODUTO_COMPRAS1`
    FOREIGN KEY (`COM_ID`)
    REFERENCES `Loja-Online`.`COMPRAS` (`COM_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Loja-Online`.`LOGIN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja-Online`.`LOGIN` (
  `LOG_ID` INT NOT NULL AUTO_INCREMENT,
  `LOG_EMAIL` VARCHAR(100) NOT NULL,
  `LOG_SENHA` VARCHAR(45) NOT NULL,
  `USUARIO_USU_ID` INT NOT NULL,
  PRIMARY KEY (`LOG_ID`),
  INDEX `fk_LOGIN_USUARIO1_idx` (`USUARIO_USU_ID` ASC),
  CONSTRAINT `fk_LOGIN_USUARIO1`
    FOREIGN KEY (`USUARIO_USU_ID`)
    REFERENCES `Loja-Online`.`USUARIO` (`USU_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
