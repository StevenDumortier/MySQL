-- Authentification/Connexion
>mysql -u root -- si l'utilisateur n'a pas de mot de passe
>mysql -u root -p -- si l'utilisateur possède un mdp

-- 1. Lister toutes les bases de donnés
SHOW DATABASE;

-- 2. Création de la base de données

CREATE DATABASE ventes;

-- 3. utiliser/selectionner une base de donnés
USE ventes;

-- 4 Lister les tables de la base de donnés
SHOW TABLES;

-- 5 . Création de la table clients
-- INTEGER c'est le type entier
-- NOT NULL : Cette colonne doit toujours contenir une information
-- AUTO_INCREMENT : Dire à MYSQL de fournir une valeurs en incrementant automatiquement les clés
-- PRIMARY KEY : Marquer la colonne comme étant la clé primaire
-- UNIQUE : Appliquer une contrainte d'unicité.
CREATE TABLE clients(
id INTERGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL,
email VARCHAR(70) NOT NULL,
telephone VARCHAR(20) NOT NULL
);

-- voir la description de la table
DESC nomtable;

-- modifier une table en ajoutant une nouvelle colonne
-- ajouté après la colonne en mettant AFTER prenom
ALTER TABLE clients ADD COLUMN postnom VARCHAR(50);
ALTER TABLE clients ADD COLUMN postnom VARCHAR(50) AFTER prenom;

-- Pour changer la colonne de place
ALTER TABLE clients MODIFY COLUMN postnom VARCHAR(50) AFTER prenom;

-- LMD
-- Lister "SELECT" les informations de toutes"*" les colonnes de "FROM" la table client
SELECT * FROM clients; 

-- Insertion des donnés
INSERT INTO clients(nom,prenom,postnom,email,telephone) values ("Dumortier","Steven","toto","stevendumortier59@gmail.com","0776699550");

--AJouter plusisuers donnés en même temps
INSERT INTO clients(nom,prenom,postnom,email,telephone) values ("Dumortier","Steven","toto","stevendumortier59@gmail.com","0776699550"),
("Dumortier","Steven","toto","stevendumortier59@gmail.com","0776699550"),
("Dumortier","Steven","toto","stevendumortier59@gmail.com","0776699550");

ALTER TABLE clients ADD COLUMN age INTEGER(2);

-- Mise à jour des données
UPDATE clients SET telephone="0673460986" WHERE id=2;
UPDATE clients SET telephone="0673460986" ,age=17 WHERE id=2;

-- Supprime en enregistrement
DELETE FROM clients WHERE id=7;

-- Configurer en sql en mode stricte (si contrainte alors marque erreur)
-- Valeur pour le mode strict : STRICT_TRANS_TABLES;
-- verifier le mode de transaction
SHOW VARIABLES LIKE 'sql_mode'

-- Definir le mode stric pour les transactions
set sql_mode='STRICT_TRANS_TABLES';

-- Pour clear 
SYSTEM clear;

-- Filtrer 
SELECT * FROM clients where age>20 ;
SELECT * FROM clients where age>20 AND prenom=Steven;
SELECT * FROM clients where age>20 OR prenom=Steven;
