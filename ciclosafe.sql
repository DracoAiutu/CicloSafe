SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ciclosafe`
-- -----------------------------------------------------

USE `ciclosafe` ;

-- -----------------------------------------------------
-- Table `cartao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cartao` ;

SHOW WARNINGS;
CREATE TABLE  `cartao` (
  `uid_card` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`uid_card`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `user_id_idx` ON `cartao` (`id_usuario` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `bike`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bike` ;

SHOW WARNINGS;
CREATE TABLE  `bike` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(60) NOT NULL,
  `id_dono` INT NOT NULL,
  `obs` VARCHAR(244) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `id_dono_idx` ON `bike` (`id_dono` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

SHOW WARNINGS;
CREATE TABLE  `usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `matricula` INT UNSIGNED NOT NULL,
  `uid_card` INT NOT NULL,
  `id_bike` INT NOT NULL,
  `historico` VARCHAR(45) NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `id_bike_idx` ON `usuario` (`id_bike` ASC);

SHOW WARNINGS;
CREATE INDEX `uid_card_idx` ON `usuario` (`id_usuario` ASC, `uid_card` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `historico`
-- -----------------------------------------------------
DROP TABLE `historico` ;

SHOW WARNINGS;
CREATE TABLE  `historico` (
  `id_usuario` INT NOT NULL,
  `data_hora_entrada` TIMESTAMP NOT NULL,
  `data_hora_saida` TIMESTAMP NOT NULL)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `usuario_id_idx` ON `historico` (`id_usuario` ASC);

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;