/*1) Obtenir l’utilisateur ayant le prénom "Muriel" et le mot de passe (en clair) "test11",
 sachant que l’encodage du mot de passe est effectué avec l’algorithme Sha1.*/

SELECT *
FROM `client`
WHERE `prenom` = "Muriel"
AND `password` = SHA1("test11")

/*2) Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes.*/

SELECT nom, COUNT(*) AS nbr_items 
FROM `commande_ligne` 
GROUP BY `nom`
HAVING nbr_items > 1
ORDER BY nbr_items DESC

/*3) Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes et y ajouter une colonne qui liste les identifiants des commandes associées.*/

SELECT nom, COUNT(*) AS nbr_items, GROUP_CONCAT(commande_id)
FROM `commande_ligne` 
GROUP BY `nom`
HAVING nbr_items > 1

/*4) Enregistrer le prix total à l’intérieur de chaque ligne des commandes, en fonction du prix unitaire et de la quantité */

UPDATE commande_ligne
SET prix_total = prix_unitaire * quantite

/*5) Obtenir le montant total pour chaque commande et y voir facilement la date associée à cette commande ainsi que le prénom et nom du client associé */

SELECT `client`.nom, `client`.prenom, DATE_FORMAT (commande.date_achat, "%d %M %Y") AS `date`, ROUND(SUM(commande_ligne.prix_total),2) AS montant_total
/*SELECTIONNE le champ nom et le champ prénom de la table client , puis FORMATE (depuis la table commande le champ date, en "num jour à 2 décimales nom du mois
année en 4 digits et tu le renomme en `date` , puis tu ARRONDIS(LE TOTAL(du champ commande_ligne"*/ 
FROM commande
/*depuis la table commade*/
INNER JOIN commande_ligne ON commande.id=commande_ligne.commande_id
/*et la table command_ligne daprès les commandes internes id de la table commande et le champ commande_id de la table commande_ligne*/
INNER JOIN CLIENT ON commande.client_id = client.id
/*tu joint egalement la table client d'apres client_id de la table commande et id de la table client */
GROUP BY commande_id
/*tu les affiche par rapport au champ commande_id */

/*6) (Attention -question difficile) Enregistrer le montant total de chaque commande dans le champ intitulé “cache_prix_total” */
SELECT commande_ligne.prix_total, GROUP_CONCAT(`commande_id`) AS "Numéro de commande"
UPDATE commande
SET cache_prix_total = 
/*7) Obtenir le montant global de toutes les commandes, pour chaque mois*/
/*8) Obtenir la liste des 10 clients qui ont effectué 
le plus grand montant de commandes, et obtenir ce montant total pour chaque client. */
/*9) Obtenir le montant total des commandes pour chaque date */
/*10) Ajouter une colonne intitulée “category” à la table contenant les commandes. Cette colonne contiendra une valeur numérique*/
/*11) Enregistrer la valeur de la catégorie, en suivant les règles suivantes :“1” pour les commandes de moins 
de 200€“2” pour les commandes entre 200€ et 500€“3” pour les commandes entre 500€ et 1.000€“4” pour les commandes supérieures à 1.000€*/
/*12) Créer une table intitulée “commande_category” qui contiendra le descriptif de ces catégories*/
/*13) Insérer les 4 descriptifs de chaque catégorie au sein de la table précédemment créée*/
/*14) Supprimer toutes les commandes (et les lignes des commandes) inférieur au 1er février 2019. Cela doit être effectué en 2 requêtes maximum.*/
