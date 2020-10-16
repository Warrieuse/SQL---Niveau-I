/*1.Afficher la liste des étudiants triés par ordre croissant de date de naissance.*/
SELECT *
FROM etudiant
ORDER BY date_naissance ASC
 /**************************************************************************************************/
/*2.Affichertous les étudiants inscrits à M1 et tous les étudiants inscrits à M2.*/
SELECT *
FROM etudiant
WHERE niveau ='m1' OR niveau ='M2'

 /**************************************************************************************************/
/*3.Afficher les matricules des étudiants qui ont passé l'examen du cours 002.*/
SELECT DISTINCT matricule
FROM examen
WHERE code LIKE '%002%' 
 /**************************************************************************************************/
/*4.Afficher les matricules de tous les étudiants qui ont passé l'examen du cours
 001 et de tous les étudiants qui ont passé l'examen du cours 002.*/
SELECT DISTINCT matricule
FROM examen
WHERE code = '001' OR code = '002'
  /**************************************************************************************************/
 /*5.Afficher le matricule, code, note /20 et note /40 de tous les examens classés 
 par ordre croissant de matricule et de code.*/
select Matricule,Code,Note as "note /20",Note*2 as "note /40"
from Examen
order by Matricule,Code ASC
/*Je selectionne le champs matricule et code nate se transforme en note/20 et note multiplié
par 2 se nomme maintenant note /40 depuis la table examen je les trie par matricule et code 
en ordre croissant*/
  /**************************************************************************************************/
 /*6.Trouver la moyenne de notes de cours 002.*/
SELECT AVG(note)
FROM examen
WHERE CODE LIKE '%002%'
  /**************************************************************************************************/
 /*7.Compter les examens passés par un étudiant (exemple avec matricule 'e001')*/
SELECT COUNT(code)
FROM examen
WHERE matricule ='e001'
  /**************************************************************************************************/
 /*8.Compter le nombre d'étudiants qui ont passé l'examen du cours 002.*/
SELECT COUNT(matricule) 
FROM examen
WHERE CODE ='002'
  /**************************************************************************************************/
 /*9.Calculer la moyenne des notes d'un étudiant (exemple avec matricule 'e001')*/
SELECT AVG(note) 
FROM examen
WHERE matricule ='e001'
  /**************************************************************************************************/
 /*.10.Compter les examens passés par chaque étudiant.*/
SELECT matricule,COUNT(code) 
FROM examen
GROUP BY matricule 
  /**************************************************************************************************/
 /*11.Calculer la moyenne des notes pour chaque étudiant.*/
SELECT matricule,AVG(note)
FROM examen
GROUP BY matricule 
  /**************************************************************************************************/
 /*12.Même question, mais afficher seulement les étudiants (et leurs moyennes) 
 dont la moyenne est >= 15.*/
 SELECT matricule,AVG(note) AS moyenne
FROM examen
GROUP BY matricule 
HAVING moyenne >= 15
  /**************************************************************************************************/
 /*13.Trouver la moyenne de notes de chaque cours.*/
SELECT CODE, AVG(note) AS moyenne
FROM examen
GROUP BY code
 /**************************************************************************************************/