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
