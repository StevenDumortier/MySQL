CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `typePresta` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `nbDays` int(11) NOT NULL,
  `unitPrice` float NOT NULL,
  `state` tinyint(1) NOT NULL,
  `totalExcludeTaxe` float GENERATED ALWAYS AS (`nbDays` * `unitPrice`) STORED,
  `totalWithTaxe` float GENERATED ALWAYS AS (`nbDays` * `unitPrice` * 1.2) STORED


-- Chaine qui commencent par M2
SELECT * FROM clients WHERE companyName LIKE "M2%";

-- Chaine qui se terminent par formation
SELECT * FROM clients WHERE companyName LIKE "%formation";

-- Rechercher au milieu d'une chaine
-- chris@sopra.com => ok
-- jean@m2i.com
-- sarah@sopra.fr => ok
-- luc@sopra.edu => ok

SELECT * FROM clients WHERE  companyName LIKE "%sopra%";

SELECT * FROM telephones WHERE numero LIKE "+33%";

-- grouper le tabeau général en plusieurs petit tableau puis faire la 
-- somme des chiffres d'affaires de units_sold par manufacturer, ranger dans . 

SELECT manufacturer, SUM(units_sold*price)as chiffre_affaire from telephones GROUP BY manufacturer order by chiffre_affaire;

-- Toutes les ventes des marques qui ont réalisé un CA de plus de 200 000 euro
-- having à la place de where quand on fait un groupé.
SELECT manufacturer, SUM(units_sold*price)as chiffre_affaire from telephones group by manufacturer HAVING chiffre_affaire > 200000;

-- donner les telephones qui ont un prix superieur a la moyenne.
-- Utiliser une query dans une condition
SELECT name, price FROM telephones where price>(SELECT AVG (price)) from telephone order by price asc;

-- Relation plusieurs à plusieurs
-- IF NOT EXISTS pour créer une table qui est déja dans mysql
CREATE TABLE IF NOT EXISTS clients(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL,
    prenom VARCHAR(20) NOT NULL,
    adresse_email VARCHAR(50) NOT NULL UNIQUE
);



CREATE TABLE IF NOT EXISTS produits(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    designation VARCHAR(50) NOT NULL,
    prixUHT FLOAT NOT NULL,
    prixTTC FLOAT GENERATED ALWAYS AS (prixUHT*1.2) STORED,
    quantite_stock INT
);

-- on delete set null car on veut supprimer les infos des clients. On delete restrict pour les produits on souhaite garder
CREATE TABLE IF NOT EXISTS achats(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_client INT,
  id_produit INT NOT NULL,
  FOREIGN KEY(id_client) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY(id_produit) REFERENCES produits(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- On peut ajouter un deuxième join on. Après le id=id du premier join

SELECT * FROM clients JOIN achats ON clients.id=achats.id_client JOIN produits ON achats.id_produit=produits.id;

SELECT CONCAT(clients.prenom," ",clients.nom) as client, produits.designation FROM clients JOIN achats ON clients.id=achats.id_client JOIN produits ON achats.id_produit=produits.id;