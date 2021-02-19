SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `kohanaGSB` DEFAULT CHARACTER SET utf8 ;
USE `kohanaGSB` ;

-- -----------------------------------------------------
-- Table `kohanaGSB`.`cabinet`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`cabinet` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `local` VARCHAR(30) NULL DEFAULT NULL ,
  `tel` VARCHAR(13) NULL DEFAULT NULL ,
  `ville` VARCHAR(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
PACK_KEYS = DEFAULT;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`composant`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`composant` (
  `id` VARCHAR(8) NOT NULL ,
  `libelle` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`famille`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`famille` (
  `id` VARCHAR(6) NOT NULL ,
  `libelle` VARCHAR(160) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`medicament`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`medicament` (
  `id` VARCHAR(20) NOT NULL ,
  `nomCommercial` VARCHAR(50) NULL DEFAULT NULL ,
  `famille_id` VARCHAR(6) NULL DEFAULT NULL ,
  `composition` TEXT NULL DEFAULT NULL ,
  `effets` TEXT NULL DEFAULT NULL ,
  `contreIndications` TEXT NULL DEFAULT NULL ,
  `prixEchantillon` FLOAT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FAM_CODE` (`famille_id` ASC) ,
  CONSTRAINT `MEDICAMENT_ibfk_1`
    FOREIGN KEY (`famille_id` )
    REFERENCES `kohanaGSB`.`famille` (`id` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`constitution`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`constitution` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `medicament_id` VARCHAR(20) NOT NULL DEFAULT '' ,
  `composant_id` VARCHAR(8) NOT NULL DEFAULT '' ,
  `cstQte` FLOAT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `CMP_CODE` (`composant_id` ASC) ,
  CONSTRAINT `CONSTITUER_ibfk_1`
    FOREIGN KEY (`medicament_id` )
    REFERENCES `kohanaGSB`.`medicament` (`id` ),
  CONSTRAINT `CONSTITUER_ibfk_2`
    FOREIGN KEY (`composant_id` )
    REFERENCES `kohanaGSB`.`composant` (`id` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`departement`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`departement` (
  `id` VARCHAR(3) NOT NULL ,
  `nom` VARCHAR(30) NULL DEFAULT NULL ,
  `chefVente` VARCHAR(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `DEP_CHEFVENTE` (`chefVente` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`labo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`labo` (
  `id` VARCHAR(4) NOT NULL ,
  `nom` VARCHAR(20) NULL DEFAULT NULL ,
  `chefVente` VARCHAR(40) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`motifvisite`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`motifvisite` (
  `id` TINYINT(4) NOT NULL AUTO_INCREMENT ,
  `libelle` VARCHAR(30) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`secteur`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`secteur` (
  `id` VARCHAR(2) NOT NULL ,
  `libelle` VARCHAR(30) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`visiteur`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`visiteur` (
  `id` VARCHAR(20) NOT NULL ,
  `nom` VARCHAR(50) NULL DEFAULT NULL ,
  `prenom` VARCHAR(100) NULL DEFAULT NULL ,
  `adresse` VARCHAR(100) NULL DEFAULT NULL ,
  `cp` VARCHAR(10) NULL DEFAULT NULL ,
  `ville` VARCHAR(60) NULL DEFAULT NULL ,
  `dateEmbauche` DATE NULL DEFAULT NULL ,
  `secteur_id` VARCHAR(2) NULL DEFAULT NULL ,
  `labo_id` VARCHAR(4) NULL DEFAULT NULL ,
  `dep_id` VARCHAR(3) NULL DEFAULT NULL ,
  `delegue` TINYINT(4) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `VISITEUR_FK_SECTEUR` (`secteur_id` ASC) ,
  INDEX `VISITEUR_FK_LABO` (`labo_id` ASC) ,
  INDEX `VISITEUR_FK_DEPARTEMENT` (`dep_id` ASC) ,
  CONSTRAINT `VISITEUR_FK_DEPARTEMENT`
    FOREIGN KEY (`dep_id` )
    REFERENCES `kohanaGSB`.`departement` (`id` )
    ON DELETE CASCADE,
  CONSTRAINT `VISITEUR_FK_LABO`
    FOREIGN KEY (`labo_id` )
    REFERENCES `kohanaGSB`.`labo` (`id` )
    ON DELETE CASCADE,
  CONSTRAINT `VISITEUR_FK_SECTEUR`
    FOREIGN KEY (`secteur_id` )
    REFERENCES `kohanaGSB`.`secteur` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`typepraticien`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`typepraticien` (
  `id` VARCHAR(6) NOT NULL ,
  `libelle` VARCHAR(50) NULL DEFAULT NULL ,
  `lieu` VARCHAR(70) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`praticien`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`praticien` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(50) NULL DEFAULT NULL ,
  `prenom` VARCHAR(60) NULL DEFAULT NULL ,
  `adresse` VARCHAR(100) NULL DEFAULT NULL ,
  `cp` VARCHAR(10) NULL DEFAULT NULL ,
  `ville` VARCHAR(50) NULL DEFAULT NULL ,
  `coefNotoriete` FLOAT NULL DEFAULT NULL ,
  `typepraticien_id` VARCHAR(6) NULL DEFAULT NULL ,
  `coefPrescription` SMALLINT(6) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `TYP_CODE` (`typepraticien_id` ASC) ,
  CONSTRAINT `PRATICIEN_ibfk_1`
    FOREIGN KEY (`typepraticien_id` )
    REFERENCES `kohanaGSB`.`typepraticien` (`id` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`rapportvisite`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`rapportvisite` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `visiteur_id` VARCHAR(20) NOT NULL DEFAULT '' ,
  `praticien_id` INT(11) NOT NULL ,
  `motif_id` TINYINT(4) NULL DEFAULT NULL ,
  `dateVisite` DATE NULL DEFAULT NULL ,
  `bilan` TEXT NULL DEFAULT NULL ,
  `impact` VARCHAR(30) NULL DEFAULT NULL ,
  `concurrence` VARCHAR(50) NULL DEFAULT NULL ,
  `coefConfiance` SMALLINT(6) NULL DEFAULT NULL ,
  `dureeSaisie` TIME NULL DEFAULT NULL ,
  `dateSaisie` DATE NULL DEFAULT NULL ,
  `saisieFinie` TINYINT(1) NULL DEFAULT NULL ,
  `motifAutre` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `VIS_MATRICULE` (`visiteur_id` ASC) ,
  INDEX `PRA_CODE` (`praticien_id` ASC) ,
  INDEX `RAP_MOTIF` (`motif_id` ASC) ,
  CONSTRAINT `RAPPORT_VISITE_ibfk_1`
    FOREIGN KEY (`visiteur_id` )
    REFERENCES `kohanaGSB`.`visiteur` (`id` ),
  CONSTRAINT `RAPPORT_VISITE_ibfk_2`
    FOREIGN KEY (`praticien_id` )
    REFERENCES `kohanaGSB`.`praticien` (`id` ),
  CONSTRAINT `RAPPORT_VISITE_ibfk_3`
    FOREIGN KEY (`motif_id` )
    REFERENCES `kohanaGSB`.`motifvisite` (`id` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`offrir`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`offrir` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `visiteur_id` VARCHAR(20) NOT NULL DEFAULT '' ,
  `rapport_id` INT(11) NOT NULL DEFAULT '0' ,
  `medicament_id` VARCHAR(20) NOT NULL DEFAULT '' ,
  `offQte` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `VIS_MATRICULE` (`visiteur_id` ASC, `rapport_id` ASC) ,
  CONSTRAINT `OFFRIR_ibfk_1`
    FOREIGN KEY (`visiteur_id` , `rapport_id` )
    REFERENCES `kohanaGSB`.`rapportvisite` (`visiteur_id` , `id` ),
  CONSTRAINT `OFFRIR_ibfk_2`
    FOREIGN KEY (`medicament_id` )
    REFERENCES `kohanaGSB`.`medicament` (`id` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`presente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`presente` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `rapport_id` INT(11) NOT NULL ,
  `medicament_id` VARCHAR(20) NOT NULL ,
  `note` TINYINT(4) NULL DEFAULT NULL ,
  `docOfferte` TINYINT(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `MED_DEPOTLEGAL` (`medicament_id` ASC) ,
  CONSTRAINT `PRESENTE_ibfk_1`
    FOREIGN KEY (`rapport_id` )
    REFERENCES `kohanaGSB`.`rapportvisite` (`id` ),
  CONSTRAINT `PRESENTE_ibfk_2`
    FOREIGN KEY (`medicament_id` )
    REFERENCES `kohanaGSB`.`medicament` (`id` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kohanaGSB`.`travaille`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kohanaGSB`.`travaille` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `cabinet_id` INT(11) NOT NULL ,
  `praticien_id` INT(11) NOT NULL ,
  `remplacant` TINYINT(4) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `PRA_CODE` (`praticien_id` ASC) ,
  CONSTRAINT `TRAVAILLE_ibfk_1`
    FOREIGN KEY (`cabinet_id` )
    REFERENCES `kohanaGSB`.`cabinet` (`id` ),
  CONSTRAINT `TRAVAILLE_ibfk_2`
    FOREIGN KEY (`praticien_id` )
    REFERENCES `kohanaGSB`.`praticien` (`id` ))
ENGINE = InnoDB;

USE `kohanaGSB` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
