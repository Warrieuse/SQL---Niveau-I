/*1. La liste des stagiaires ;*/
SELECT * FROM stagiaires
/*2. La liste des examens ;*/
SELECT * FROM examens
/*3. Les numéros de tous les stagiaires ;*/
SELECT nomS FROM stagiaires
/*4. Les numéros des examens munis de la date de réalisation ;*/
SELECT numE,Date FROM examens
/*5. La liste des stagiaires triée par nom dans un ordre décroissant ;*/
SELECT * FROM stagiaires ORDER BY nomS DESC 
/*6. La liste des examens réalisés dans les salles 'A2' ou 'A3';*/
SELECT * FROM examens WHERE salle = 'A2' OR salle ='A3'
/*7. La liste des examens pratiques ;*/
SELECT * FROM examens WHERE typeE = 'P'
/*8. La liste précédente triée par date de passation de l'examen ;*/
SELECT * FROM examens WHERE typeE = 'P' ORDER BY DATE 
/*9. La liste des examens triée par salle dans un ordre croissant et par date dans un ordre décroissant ;*/
SELECT * FROM examens WHERE typeE = 'P' ORDER BY salle ASC , DATE desc 
/*10. Les numéros et les notes des examens passé par le stagiaire 'S01';*/
SELECT numE,note FROM passerexamen WHERE numS='S01' 
/*11. Les numéros et les notes des examens passé parle stagiaire 'S01' et dont la note est supérieure ou égale à 12;*/
SELECT numE,note FROM passerexamen WHERE numS='S01' AND note >= 12 
/*12. Les stagiaires dont le nom contient la lettre 'e' ;*/
SELECT nomS FROM stagiaires WHERE nomS LIKE '%e%' 
/*13. Les prénoms des stagiaires dont le prénom se termine par la lettre 's' ;*/
SELECT nomS FROM stagiaires WHERE nomS LIKE '%s' 
/*14. Les prénoms des stagiaires dont le prénom se termine par la lettre 's' ou 'd' ;*/
SELECT prenomS FROM stagiaires WHERE prenomS LIKE '%e' OR prenomS LIKE '%d'
/*15. Les noms et prénoms des stagiaires dont le nom se termine par la lettre 'e' et le prénom par 's' ;*/
SELECT nomS,prenomS FROM stagiaires WHERE nomS LIKE '%e' OR nomS LIKE '%s'
/*16. Les noms des stagiaires dont la deuxième lettre est 'a' ;*/
SELECT nomS FROM stagiaires WHERE nomS LIKE '_a%' 
/*17. Les noms des stagiaires dont la deuxième lettre n'est pas 'a' ;*/
SELECT nomS FROM stagiaires WHERE nomS NOT LIKE '_a%' 
/*18. La liste des examens pratiques réalisés dans une salle commençant par la lettre 'A';*/
SELECT typeE,Salle FROM examens WHERE typeE ='P' AND Salle LIKE 'A%' 
/*19. Toutes les salles dont on a réalisé au moins un examen ;*/
SELECT salle FROM examens
/*Elles ont toutes eut au moins 1 examen*/
/*20. La liste précédente mais sans doublons ;*/
SELECT distinct salle FROM examens 
/*21. Pour chaque examen, la meilleure et la plus mauvaise note ;*/
SELECT numE, MAX(note) AS  'La meilleur note', MIN(note) AS 'la plus mauvaise note' FROM passerexamen GROUP BY numE
/*22. Pour l'examen 'E05', la meilleure et la plus mauvaise note ;*/
SELECT numE, MAX(note) AS  'La meilleur note', MIN(note) AS 'la plus mauvaise note' FROM passerexamen WHERE numE ='E05'
/*23. Pour chaque examen, l'écart entre la meilleure et la plus mauvaise note ;*/
SELECT MAX(note) - MIN(note) AS 'l\'ecart entre la plus mauvaise et la meilleure' FROM passerexamen ORDER BY note
/*24. Le nombre d'examens pratiques (typeE = «P»);*/
SELECT COUNT(*) FROM examens WHERE TYPEE ='P'
/*25. La date du premier examen effectué ;*/
SELECT MIN(DATE) FROM examens 
/*26. Le nombre de stagiaires dont le nom contient 'r' ou 's' ;*/
SELECT COUNT(nomS) 
FROM stagiaires
WHERE nomS LIKE '%r%' OR nomS LIKE '%s%';
/*27. Pour chaque stagiaires la meilleure note dans tous les examens ;*/
SELECT numS, MAX(Note) AS 'La meilleure note' 
FROM passerexamen
GROUP BY numS
/*28. Pour chaque date enregistrée dans la base de données le nombre d'examens ;*/
SELECT DATE, COUNT(*) AS 'nbr_exam'
FROM examens
GROUP BY DATE
/*29. Pour chaque salle le nombre d'examens réalisés ;*/
SELECT salle, COUNT(*) AS 'nbr_exam'
FROM examens
GROUP BY salle
/*30. Le nombre d'examens réalisés dans la salle ‘A1’;*/
SELECT salle, COUNT(*) AS 'nbr_exam'
FROM examens
WHERE salle='A1'
/*31. Toutes les salles dans lesquelles on a effectué au moins deux examens ;*/
SELECT salle, COUNT(numE) AS 'nbr_exam'
FROM examens
GROUP BY salle
HAVING nbr_exam >= 2;
/*32. Toutes les salles dans lesquelles on a effectué exactement 3 examens ;*/
SELECT salle, COUNT(numE) AS 'nbr_exam'
FROM examens
GROUP BY salle
HAVING nbr_exam = 3;
/*33. Le nombre d'examens réalisés dans les salles commençant par la lettre 'A' ;*/
SELECT salle, COUNT(*) AS 'nbr_exam'
FROM examens
WHERE salle LIKE 'A%'
/*34. Pour chaque salle commençant par la lettre 'A', le nombre d'examens ;*/
SELECT salle, COUNT(*) AS 'nbr_exam'
FROM examens
WHERE salle LIKE 'A%'
GROUP BY salle
/*35. Les salles qui commencent par 'A' et dans lesquelles on a effectué deux examens.*/
SELECT salle, COUNT(*) AS 'nbr_exam'
FROM examens
WHERE salle LIKE 'A%'
GROUP BY salle
HAVING COUNT(*)=2;
