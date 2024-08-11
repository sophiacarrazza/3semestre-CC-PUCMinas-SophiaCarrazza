
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `arte` DEFAULT CHARACTER SET utf8 ;
USE `arte` ;

CREATE TABLE IF NOT EXISTS `arte`.`workshop` (
  `workshopID` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descricao` VARCHAR(455) NULL,
  `data` DATE NULL,
  `hora` DATETIME NULL,
  `duracao` TIMESTAMP(2) NULL,
  PRIMARY KEY (`workshopID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `arte`.`usuario` (
  `usuarioID` INT NOT NULL,
  `nome` VARCHAR(255) NULL,
  `senha` VARCHAR(32) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo` VARCHAR(45) NULL,
  `participanteID` INT NOT NULL,
  PRIMARY KEY (`usuarioID`, `participanteID`),
  INDEX `fk_usuario_workshop1_idx` (`participanteID` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_workshop1`
    FOREIGN KEY (`participanteID`)
    REFERENCES `arte`.`workshop` (`workshopID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `arte`.`obra` (
  `obraID` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descricao` VARCHAR(455) NULL,
  `dataCriacao` DATETIME NULL,
  `caminhoImagem` VARCHAR(45) NULL,
  `artistaID` INT NOT NULL,
  PRIMARY KEY (`artistaID`, `obraID`),
  CONSTRAINT `fk_obra_usuario0`
    FOREIGN KEY (`artistaID`)
    REFERENCES `arte`.`usuario` (`usuarioID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `arte`.`obra` (
  `obraID` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descricao` VARCHAR(455) NULL,
  `dataCriacao` DATETIME NULL,
  `caminhoImagem` VARCHAR(45) NULL,
  `artistaID` INT NOT NULL,
  PRIMARY KEY (`artistaID`, `obraID`),
  CONSTRAINT `fk_obra_usuario0`
    FOREIGN KEY (`artistaID`)
    REFERENCES `arte`.`usuario` (`usuarioID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `arte`.`comentario` (
  `comentarioID` INT NOT NULL,
  `texto` VARCHAR(245) NULL,
  `dataComentario` DATETIME NULL,
  `usuarioID` INT NOT NULL,
  `obraID` INT NOT NULL,
  PRIMARY KEY (`comentarioID`, `usuarioID`, `obraID`),
  INDEX `fk_comentario_usuario1_idx` (`usuarioID` ASC) VISIBLE,
  INDEX `fk_comentario_obra1_idx` (`obraID` ASC) VISIBLE,
  CONSTRAINT `fk_comentario_usuario1`
    FOREIGN KEY (`usuarioID`)
    REFERENCES `arte`.`usuario` (`usuarioID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentario_obra1`
    FOREIGN KEY (`obraID`)
    REFERENCES `arte`.`obra` (`obraID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `arte`.`modelo_copy1` (
  `obraID` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descricao` VARCHAR(455) NULL,
  `dataCriacao` DATETIME NULL,
  `caminhoImagem` VARCHAR(45) NULL)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `arte`.`exposicao` (
  `exposicaoID` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descricao` VARCHAR(455) NULL,
  `dataInicio` DATETIME NULL,
  `datFim` DATETIME NULL,
  PRIMARY KEY (`exposicaoID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `arte`.`inscricaoWorkshop` (
  `inscricaoID` INT NOT NULL,
  `dataInscricao` DATETIME NULL,
  `participanteID` INT NOT NULL,
  `workshopID` INT NOT NULL,
  PRIMARY KEY (`inscricaoID`, `participanteID`),
  INDEX `fk_inscricaoWorkshop_usuario1_idx` (`participanteID` ASC) VISIBLE,
  INDEX `fk_inscricaoWorkshop_workshop1_idx` (`workshopID` ASC) VISIBLE,
  CONSTRAINT `fk_inscricaoWorkshop_usuario1`
    FOREIGN KEY (`participanteID`)
    REFERENCES `arte`.`usuario` (`participanteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscricaoWorkshop_workshop1`
    FOREIGN KEY (`workshopID`)
    REFERENCES `arte`.`workshop` (`workshopID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `arte`.`visualizacaoExposicao` (
  `exposicaoID` INT NOT NULL,
  `dataVisualizacao` DATETIME NULL,
  `usuarioID` INT NOT NULL,
  `exposicaoID` INT NOT NULL,
  PRIMARY KEY (`exposicaoID`, `usuarioID`),
  INDEX `fk_visualizacaoExposicao_usuario1_idx` (`usuarioID` ASC) VISIBLE,
  INDEX `fk_visualizacaoExposicao_exposicao1_idx` (`exposicaoID` ASC) VISIBLE,
  CONSTRAINT `fk_visualizacaoExposicao_usuario1`
    FOREIGN KEY (`usuarioID`)
    REFERENCES `arte`.`usuario` (`usuarioID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visualizacaoExposicao_exposicao1`
    FOREIGN KEY (`exposicaoID`)
    REFERENCES `arte`.`exposicao` (`exposicaoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `arte`.`avaliacaoWorkshop` (
  `avaliacaoID` INT NOT NULL,
  `dataAvaliacao` DATETIME NULL,
  `nota` INT NULL,
  `comentario` VARCHAR(45) NULL,
  `participanteID` INT NOT NULL,
  `workshopID` INT NOT NULL,
  PRIMARY KEY (`avaliacaoID`, `participanteID`),
  INDEX `fk_avaliacaoWorkshop_usuario1_idx` (`participanteID` ASC) VISIBLE,
  INDEX `fk_avaliacaoWorkshop_workshop1_idx` (`workshopID` ASC) VISIBLE,
  CONSTRAINT `fk_avaliacaoWorkshop_usuario1`
    FOREIGN KEY (`participanteID`)
    REFERENCES `arte`.`usuario` (`participanteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_avaliacaoWorkshop_workshop1`
    FOREIGN KEY (`workshopID`)
    REFERENCES `arte`.`workshop` (`workshopID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `arte`.`exposicao_has_obra` (
  `exposicaoID` INT NOT NULL,
  `artistaID` INT NOT NULL,
  `obraID` INT NOT NULL,
  PRIMARY KEY (`exposicaoID`, `artistaID`, `obraID`),
  INDEX `fk_exposicao_has_obra_obra1_idx` (`artistaID` ASC, `obraID` ASC) VISIBLE,
  INDEX `fk_exposicao_has_obra_exposicao1_idx` (`exposicaoID` ASC) VISIBLE,
  CONSTRAINT `fk_exposicao_has_obra_exposicao1`
    FOREIGN KEY (`exposicaoID`)
    REFERENCES `arte`.`exposicao` (`exposicaoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exposicao_has_obra_obra1`
    FOREIGN KEY (`artistaID` , `obraID`)
    REFERENCES `arte`.`obra` (`artistaID` , `obraID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
