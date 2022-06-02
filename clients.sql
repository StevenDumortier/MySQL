-- Authentification/Connexion
>mysql -u root -- si l'utilisateur n'a pas de mot de passe
>mysql -u root -p -- si l'utilisateur possède un mdp

-- 1. Lister toutes les bases de donnés
SHOW DATABASE;

-- 2. Création de la base de données

CREATE DATABASE ventes;

-- 3. utiliser/selectionner une base de donnés
USE ventes;


-- 3 . Création de la table clients