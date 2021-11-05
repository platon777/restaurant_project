-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `resto_app` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`diplome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diplome` (
  `id_diplome` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_diplome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employe` (
  `id_employe` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `adresse` VARCHAR(45) NOT NULL,
  `code_postal` VARCHAR(20) NOT NULL,
  `ville` VARCHAR(45) NOT NULL,
  `telephone` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_employe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`diplome_possede_par`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diplome_possede_par` (
  `id_diplome` INT NOT NULL,
  `id_employe` INT NOT NULL,
  `date_obtention` DATETIME NOT NULL,
  PRIMARY KEY (`id_diplome`, `id_employe`),
  INDEX `fk_diplome_has_employe_employe1_idx` (`id_employe` ASC) VISIBLE,
  INDEX `fk_diplome_has_employe_diplome_idx` (`id_diplome` ASC) VISIBLE,
  CONSTRAINT `fk_diplome_has_employe_diplome`
    FOREIGN KEY (`id_diplome`)
    REFERENCES `mydb`.`diplome` (`id_diplome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diplome_has_employe_employe1`
    FOREIGN KEY (`id_employe`)
    REFERENCES `mydb`.`employe` (`id_employe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`date` (
  `id_date_commande` INT NOT NULL AUTO_INCREMENT,
  `date_commande` DATETIME NOT NULL,
  PRIMARY KEY (`id_date_commande`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`service` (
  `id_service` INT NOT NULL AUTO_INCREMENT,
  `type_service` VARCHAR(45) NOT NULL,
  `designation_service` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_service`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table` (
  `id_table` INT NOT NULL AUTO_INCREMENT,
  `num_table` INT NULL,
  `capacite` INT NOT NULL,
  PRIMARY KEY (`id_table`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`commande` (
  `id_commande` INT NOT NULL AUTO_INCREMENT,
  `id_date_commande` INT NOT NULL,
  `id_service` INT NOT NULL,
  `id_table` INT NOT NULL,
  PRIMARY KEY (`id_commande`, `id_date_commande`, `id_service`, `id_table`),
  INDEX `fk_commande_date1_idx` (`id_date_commande` ASC) VISIBLE,
  INDEX `fk_commande_service1_idx` (`id_service` ASC) VISIBLE,
  INDEX `fk_commande_table1_idx` (`id_table` ASC) VISIBLE,
  CONSTRAINT `fk_commande_date1`
    FOREIGN KEY (`id_date_commande`)
    REFERENCES `mydb`.`date` (`id_date_commande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commande_service1`
    FOREIGN KEY (`id_service`)
    REFERENCES `mydb`.`service` (`id_service`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commande_table1`
    FOREIGN KEY (`id_table`)
    REFERENCES `mydb`.`table` (`id_table`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`boissons_diverses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`boissons_diverses` (
  `id_boissons_diverses` INT NOT NULL AUTO_INCREMENT,
  `designation` VARCHAR(45) NOT NULL,
  `prix_de_vente` FLOAT NOT NULL,
  PRIMARY KEY (`id_boissons_diverses`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`boissons_commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`boissons_commande` (
  `id_boissons_diverses` INT NOT NULL,
  `id_commande` INT NOT NULL,
  `quantite` INT NOT NULL,
  PRIMARY KEY (`id_boissons_diverses`, `id_commande`),
  INDEX `fk_boissons_diverses_has_commande_commande1_idx` (`id_commande` ASC) VISIBLE,
  INDEX `fk_boissons_diverses_has_commande_boissons_diverses1_idx` (`id_boissons_diverses` ASC) VISIBLE,
  CONSTRAINT `fk_boissons_diverses_has_commande_boissons_diverses1`
    FOREIGN KEY (`id_boissons_diverses`)
    REFERENCES `mydb`.`boissons_diverses` (`id_boissons_diverses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boissons_diverses_has_commande_commande1`
    FOREIGN KEY (`id_commande`)
    REFERENCES `mydb`.`commande` (`id_commande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vin` (
  `id_vin` INT NOT NULL AUTO_INCREMENT,
  `num_vin` INT NULL,
  `millesime` INT NOT NULL,
  `prix_de_vente` FLOAT NOT NULL,
  PRIMARY KEY (`id_vin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vins_commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vins_commande` (
  `id_vin` INT NOT NULL AUTO_INCREMENT,
  `id_commande` INT NOT NULL,
  PRIMARY KEY (`id_vin`, `id_commande`),
  INDEX `fk_carte_des_vins_has_commande_commande1_idx` (`id_commande` ASC) VISIBLE,
  INDEX `fk_carte_des_vins_has_commande_carte_des_vins1_idx` (`id_vin` ASC) VISIBLE,
  CONSTRAINT `fk_carte_des_vins_has_commande_carte_des_vins1`
    FOREIGN KEY (`id_vin`)
    REFERENCES `mydb`.`vin` (`id_vin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carte_des_vins_has_commande_commande1`
    FOREIGN KEY (`id_commande`)
    REFERENCES `mydb`.`commande` (`id_commande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`menu` (
  `id_menu` INT NOT NULL AUTO_INCREMENT,
  `num_menu` INT NULL,
  `libelle` VARCHAR(45) NOT NULL,
  `prix_de_vente_menu` FLOAT NOT NULL,
  PRIMARY KEY (`id_menu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type_plat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type_plat` (
  `id_type_plat` INT NOT NULL AUTO_INCREMENT,
  `designation_type_plat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_type_plat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`plat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`plat` (
  `id_plat` INT NOT NULL AUTO_INCREMENT,
  `num_plat` INT NULL,
  `libelle_plat` VARCHAR(45) NOT NULL,
  `prix_de_vente_plat` FLOAT NOT NULL,
  `type_plat_id_type_plat` INT NOT NULL,
  PRIMARY KEY (`id_plat`, `type_plat_id_type_plat`),
  INDEX `fk_plat_type_plat1_idx` (`type_plat_id_type_plat` ASC) VISIBLE,
  CONSTRAINT `fk_plat_type_plat1`
    FOREIGN KEY (`type_plat_id_type_plat`)
    REFERENCES `mydb`.`type_plat` (`id_type_plat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`plat_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`plat_menu` (
  `id_plat` INT NOT NULL,
  `id_menu` INT NOT NULL,
  PRIMARY KEY (`id_plat`, `id_menu`),
  INDEX `fk_carte_des_plats_has_menu_menu1_idx` (`id_menu` ASC) VISIBLE,
  INDEX `fk_carte_des_plats_has_menu_carte_des_plats1_idx` (`id_plat` ASC) VISIBLE,
  CONSTRAINT `fk_carte_des_plats_has_menu_carte_des_plats1`
    FOREIGN KEY (`id_plat`)
    REFERENCES `mydb`.`plat` (`id_plat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carte_des_plats_has_menu_menu1`
    FOREIGN KEY (`id_menu`)
    REFERENCES `mydb`.`menu` (`id_menu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Viticulteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Viticulteur` (
  `id_viticulteur` INT NOT NULL AUTO_INCREMENT,
  `nom_viticulteur` VARCHAR(45) NOT NULL,
  `prenom_viticulteur` VARCHAR(45) NOT NULL,
  `adresse_viticulteur` VARCHAR(45) NOT NULL,
  `code_postal` VARCHAR(45) NOT NULL,
  `ville` VARCHAR(45) NOT NULL,
  `telephone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_viticulteur`),
  UNIQUE INDEX `prenom_viticulteur_UNIQUE` (`prenom_viticulteur` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bouteilles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bouteilles` (
  `id_bouteille` INT NOT NULL AUTO_INCREMENT,
  `num_bouteille` INT NOT NULL,
  `date_achat` DATETIME NOT NULL,
  `prix_achat` FLOAT NOT NULL,
  `id_vin` INT NOT NULL,
  `id_viticulteur` INT NOT NULL,
  PRIMARY KEY (`id_bouteille`, `id_vin`, `id_viticulteur`),
  UNIQUE INDEX `num_bouteille_UNIQUE` (`num_bouteille` ASC) VISIBLE,
  INDEX `fk_bouteilles_vin1_idx` (`id_vin` ASC) VISIBLE,
  INDEX `fk_bouteilles_Viticulteur1_idx` (`id_viticulteur` ASC) VISIBLE,
  CONSTRAINT `fk_bouteilles_vin1`
    FOREIGN KEY (`id_vin`)
    REFERENCES `mydb`.`vin` (`id_vin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bouteilles_Viticulteur1`
    FOREIGN KEY (`id_viticulteur`)
    REFERENCES `mydb`.`Viticulteur` (`id_viticulteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
