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