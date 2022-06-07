--Remplacer un or

Select * From telephone Where manufacturer = "Apple" Or manufacturer = "Samsung";

Select * From telephone where manufatrurer IN ("Apple","Samsung");

-- Utilisation d'un double intervalle avec between

SELECT name, manufacturer, price FROM telephones WHERE price >=150 AND price <=200;

SELECT name, manufacturer, price FROM telephones WHERE price BETWEEN 150 AND 200;

-- ranger les données par ordre croissant asc(pas obligé d'écrire par défaut) ou desc pour décroissant

SELECT id,name, manufacturer, price FROM telephones ORDER by price asc;
															-- DESC
SELECT id,name, manufacturer, price FROM telephones ORDER by price DESC, manufacturer DESC;

-- Afficher une colonne correspondant à un calcul

SELECT name, manufacturer,price, units_sold, price*units_sold FROM telephone;

-- Ajouter un alias(surnom) avec "as nomdelalias" à l'affichage du tableau mais ne change pas dans les commandes
SELECT name, manufacturer,price, units_sold, price*units_sold FROM telephone;

-- Ajouter plusieurs texte entre eux "concat"
SELECT concat (manufacturer," ",name) as Nom_de_telephone,CONCAT(price," $") as price FROM telephone;

-- Création d'une view pour éviter une longue requête car il le fait direct en caché create view v_nomdeview(v par convention) as select...
Create VIEW v_nom as SELECT concat (manufacturer," ",name) as Nom_de_telephone,CONCAT(price," $") as price FROM telephone from orders;

-- Voir la view
SELECT * FROM v_revenu_total;

-- Afficher sans répétition
SELECT Distinct(manufacturer) from telephone;

-- Compter le nombre d'enregistrement
SELECT COUNT(*) from telephone;

-- Compte le nombre précis d'une info
SELECT COUNT(*) from telephone where manifacturer = Apple;

-- Calculter la somme de la colonne avec sum
SELECT SUM(units_sold) from telephone;

-- Calculer la moyenne de la colonne avec AVG
SELECT AVG(units_sold) from telephone;

-- Selectionner la valeur la plus élevé de la colonne avec max/min
SELECT MAX(units_sold) from telephone;


