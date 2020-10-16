/*1er partie
 les 10 villes les plus peuplées en 2012*/
SELECT *
FROM `villes_france_free` 
ORDER BY 'ville_population_2012' DESC /*ordre décroissant*/
LIMIT 10

/************************************************************************************************************************************/

/*2) Ecrivez la requête permettant 
d'obtenir la liste des 50 villes ayant la plus faible superficie*/
SELECT * 
FROM `villes_france_free` 
ORDER BY `ville_surface` ASC /*ordre croissant*/
LIMIT 50

/************************************************************************************************************************************/

/*3) Ecrivez la requête permettant d'obtenir 
la liste des départements d’outre-mer, c’est-à-dire ceux 
dont le numéro de département commence par “97”*/
SELECT * 
FROM `departement` 
WHERE `departement_code` LIKE '97%'/*le pourcentage après le nombres recherche ceux qui commence par*/

/************************************************************************************************************************************/

/*4) Ecrivez la requête permettant d'obtenir le nom des 
10 villes les plus peuplées en 2012, ainsi que le nom du 
département associé*/
SELECT * 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
ORDER BY `ville_population_2012` DESC 
LIMIT 10
/*selectionne dans la table "villes_france_free" dans lequel tu joint la table departement en récupérant
 les données departement_code et ville_departement et tu les classes  par rapport à au champs 
 ville_population_2012 en ordre décroissant dans la limite de 10*/

/************************************************************************************************************************************/

/*5) Ecrivez la requête permettant d'obtenir la liste du nom de 
chaque département, associé à son code et du nombre de commune 
au sein de ces départements, en triant afin d’obtenir en priorité
 les départements qui possèdent le plus de communes*/
SELECT departement_nom, ville_departement, COUNT(*) AS nbr_items 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement
ORDER BY `nbr_items` DESC
/*selectionne le departemant_nom et le ville_departement et tu retourne le nbr de ligne et tu les renomme nbr_items
  depuis la table villes_france_free
  joint la table departement en récupérant les données de departement _code et ville = departement
  et tu regroupe les ville_departement
  et tu trie les nbr items par ordre décroissant.*/

/************************************************************************************************************************************/

/*6)Ecrivez la requête permettant d'obtenir la liste des 10 plus grands départements, en terme de superficie*/
SELECT departement_nom, ville_departement, SUM(`ville_surface`) AS dpt_surface 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement  
ORDER BY dpt_surface  DESC
LIMIT 10
/*Selectionne departement_nom, ville_departement tu fait la somme totale de la surface des ville que tu change en dpt_surface
depuis la table villes_france_free
joint la table departement en récupérant les données de departement _code et ville = departement
et tu regroupe les ville_departement
tu trie dpt_surface en ordre décroissant
dans la limite de 10 donc les 10 qui possède la plus grande superficie */

/************************************************************************************************************************************/

/*7) Ecrivez la requête permettant de compter le nombre de villes dont le nom commence par “Saint”*/
SELECT COUNT(*) 
FROM `villes_france_free` 
WHERE `ville_nom` LIKE 'saint%'
/*selectionne en retourneant le nbr de ligne
depuis la table villes france free
le champs ville_nom qui commence par saint*/

/************************************************************************************************************************************/

/*8) Ecrivez la requête permettant d'obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir 
en premier celles dont le nom est le plus souvent utilisé par plusieurs communes*/
SELECT ville_nom, COUNT(*) AS nbt_item 
FROM `villes_france_free` 
GROUP BY `ville_nom` 
ORDER BY nbt_item DESC
/*selectionne ville_nom, tu retourne le nbr de ligne que tu nomme nbt_item
depuis la table ville france free 
regroupe le champs ville_nom
et tu trie nbt_item par ordre decroissant.
*/
/************************************************************************************************************************************/

/*9) Ecrivez la requête permettant d'obtenir en une seule requête SQL la liste des villes dont la superficie est supérieure
à la superficie moyenne*/
SELECT * 
FROM `villes_france_free` 
WHERE `ville_surface` > (SELECT AVG(`ville_surface`) FROM `villes_france_free`)
/*selectionne depuis la table ville france free dans le champs ville surface  prend le plus grand (>)(
    selectionne la moyenne du champs ville surface depuis la table villes france free) */

/************************************************************************************************************************************/

/*10) Ecrivez la requête permettant d'obtenir la liste des départements qui possèdent plus de 2 millions d’habitants*/
SELECT ville_departement, SUM(`ville_population_2012`) AS population_2012
FROM `villes_france_free` 
GROUP BY `ville_departement`
HAVING population_2012 > 2000000 /*having au lieu de where  car condition de selectionner ceux inferrieur à 2 millions*/
ORDER BY population_2012 DESC

/*selectionne le champs ville departement, tu fais la somme du champs ville population 2012 et tu renomme population 2012
depuis la table villes france free 
tu groupe le champ ville departement
tu recupère les ceux inf à 2 000 000 et tu les classe dans l'ordre decroissant.  */

/************************************************************************************************************************************/

/*11)Remplacez les tirets par un espace vide, pour toutes les villes commençant 
par “SAINT-” (dans la colonne qui contient les noms en majuscule)*/

UPDATE `villes_france_free` 
SET ville_nom = REPLACE(ville_nom, '-', ' ') 
WHERE `ville_nom` LIKE 'SAINT-%'

/*Modifie la table villes france free
set le champ ville nom et renplace ( dans le champs ville nom les - par de espaces*
dans le champs ville nom uniquement ceus qui commence par SAINT-. /

/************************************************************************************************************************************/

