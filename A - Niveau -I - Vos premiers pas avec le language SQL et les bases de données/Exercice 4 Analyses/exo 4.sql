/*1.La base est vierge. Réalisez l'insertion d'un jeu de données dans les différentes tables.
Les données seront définies par vous-même à votre convenance.*/

INSERT INTO client (codeClient, nom, cpclient,villeclient,tel)
VALUES
('0001','MARLEY','06130','Grasse','0658759362'),
('0002','DUPONT','06620','cipières','0683659225'),
('0003','CANUEL','06620','gréolières','0184759632'),
('0004','LAPORTE','06750','seranon','8596326584'),
('0005','REBUFFEL','83840','Bargeme','0606060606');

INSERT INTO echantillon (codeEchantillon, dateentree, codeClient)
VALUES
(89980001,'2020-10-08','0001'),
(89980002,'2020-06-19','0002'),
(89980003,'2020-06-20','0001'),
(89980004,'2020-08-22','0001'),
(89980005,'2020-09-01','0004');

INSERT INTO realiser (codeEchantillon, refTypeAnalyse, dateRealisation)
VALUES
(89980001,55220001,'2020-10-15'),
(89980002,55220002,'2015-02-15'),
(89980003,55220003,'2016-10-26'),
(89980004,55220004,'1986-08-26'),
(89980005,55220005,'2016-10-15');

INSERT INTO typeanalyse (refTypeAnalyse,designation, prixTypeAnalyse)
VALUES
(55220001,'huiles essentielles de citron',4.99),
(55220002,'huile de ricin',3.99),
(55220003,'Glycerine',2.99),
(55220004,'huile d\'olive extra vierge',12.99),
(55220005,'gelée royale',6.99);

/************************************************************************************************************************************/
/*2.Augmentez de 10% tous les prix des analyses.*/
UPDATE typeanalyse
SET prixTypeAnalyse = prixtypeanalyse * 1.1

/************************************************************************************************************************************/
/*3.Il a été défini un prix plancher de 80 DHs pour toutes les analyses. 
Mettez à jourla table ANALYSE.*/
UPDATE typeanalyse
SET prixTypeanalyse = 80
WHERE prixTypeanalyse > 80
/************************************************************************************************************************************/
/*4.Aujourd'hui, toutes les analyses en cours ont été réalisées. 
Mettez à jour la base*/
UPDATE realiser
SET dateRealisation = DATE(NOW())
/*je change le champs date realisation en lui mettant la date du jour car toutes les analyses
ont été realisés aujourd'huis.*/
/************************************************************************************************************************************/
/*5.Le client dont le code est "c1"vient de fournir son numéro de téléphone 
(0611111111). Mettre à jourla table correspondante.*/
UPDATE client
SET tel = 0611111112
WHERE codeClient = 0001
/*dans ma base de données c1 correspont à 0001 modification du code car ma 1er erreur étais
de mettre en condition uniquement 0001 san précisé que c'est dans le champ codeClient.*/
/************************************************************************************************************************************/
/*6.Suite à un bug informatique, des entrées 
ont été saisies le 01 février 2007 au lieu du 1er février 2006. 
Mettez à jour la base.*/
UPDATE echantillon
SET dateEntree = '2019-10-08'
WHERE dateEntree = '2020-10-08'
/*changement de date ne correspont à ce que demandais l'exo mais vu que j'ai entrée ma base de données
seule du coup je fais à ma sauce*/
/************************************************************************************************************************************/
/*7.Afin de préparer la nouvelle campagne, de nouvelles analyses ont été définies.
Ces nouvelles analyses sont disponibles dans une table ANALYSECOLYSTEROL dont 
la structure (champs, types de donnée) est identique à TYPEANALYSE. Mettez à jour
la tableTYPEANALYSE à partir dela tableANALYSECOLYSTEROL.*/
CREATE TABLE ANALYSECOLYSTEROL AS
SELECT * FROM typeanalyse

/*faux pas vriament ce qui est demandé*/

CREATE TABLE `analysecolysterol` (
	`refTypeAnalyse` INT(8) NOT NULL AUTO_INCREMENT,
	`designation` VARCHAR(50) NULL DEFAULT NULL,
	`prixTypeAnalyse` FLOAT NULL DEFAULT NULL,
	PRIMARY KEY (`refTypeAnalyse`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=55220006
;

INSERT INTO analysecolysterol (refTypeAnalyse,designation, prixTypeAnalyse)
VALUES
(55220201,'huiles essentielles de citron',4.99),
(55220012,'huile de ricin',3.99),
(55220543,'Glycerine',2.99),
(55220954,'huile d\'olive extra vierge',12.99),
(55220875,'gelée royale',6.99);

INSERT INTO typeanalyse(refTypeAnalyse,designation,prixTypeAnalyse)
SELECT refTypeAnalyse,designation,prixTypeAnalyse
FROM analysecolysterol