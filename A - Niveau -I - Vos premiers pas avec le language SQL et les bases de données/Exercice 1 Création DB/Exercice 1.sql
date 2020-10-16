CREATE TABLE `fournisseurs` (
	`num_F` INT(8) NOT NULL,
	`nom` VARCHAR(40) NULL DEFAULT NULL,
	`ville` VARCHAR(40) NULL DEFAULT NULL,
	PRIMARY KEY (`num_F`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

CREATE TABLE `fournitures` (
	`num_F` INT(8) NOT NULL,
	`code_p` INT(8) NOT NULL,
	`quantité` INT(8) UNSIGNED NOT NULL,
	PRIMARY KEY (`num_F`, `code_p`),
	INDEX `FK_fournitures_produits` (`code_p`),
	CONSTRAINT `FK_fournitures_fournisseurs` FOREIGN KEY (`num_F`) REFERENCES `fournisseurs` (`num_F`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `FK_fournitures_produits` FOREIGN KEY (`code_p`) REFERENCES `produits` (`code_p`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

CREATE TABLE `produits` (
	`code_p` INT(8) NOT NULL,
	`libelle` VARCHAR(40) NULL DEFAULT NULL,
	`origine` VARCHAR(40) NULL DEFAULT NULL,
	`couleur` VARCHAR(40) NULL DEFAULT NULL,
	PRIMARY KEY (`code_p`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;
