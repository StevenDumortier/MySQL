
create TABLE clients (
id integer AUTO_INCREMENT not null PRIMARY key,
companyName VARCHAR(50) not null,
   firstName varchar(50) not null,
lastname varchar(50) not null,
email varchar(50) not null,
phone varchar(20) not null,
adress varchar(50) not null,
    city varchar(50) not null,
    country varchar(50) not null,
    state varchar(1) not null
    );

   
    create TABLE orders (
id integer AUTO_INCREMENT not null PRIMARY key,
typePresta VARCHAR(30) not null,
   designation varchar(30) not null,
clientid integer,
FOREIGN KEY (clientid)REFERENCES clients(id) on delete restrict,
nbDays integer(3),
unitPrice integer(10),
state varchar(1) not null
    );


INSERT into clients (companyName, firstName, lastName, email , phone, adress,zipCode , city, country, state) 
values ("Capgemini", "Fabrice", "Martin" , "martin@mail.com", "06 56 85 84 33", "abc" , "xyz" , "Nantes" , "France",  "0"),
("M2I Formation", "Julien" , "Lamard", "lamard@mail.com", "06 11 22 33 44", "abc" , "xyz" , "Paris" , "France",  "1"),
("ATOS", "Homer" , "Simpsons", "simpsons@mail.com", "06 51 52 33 44", "abc" , "xyz" , "Springfield" , "USA",  "1"),
("Sopra Steria", "jean" , "bon", "bon@mail.com", "06 11 23 53 99", "abc" , "xyz" , "Lille" , "France",  "1");

INSERT into orders(typePresta,designation,clientid,nbDays,unitPrice,state) 
values ("Formation","Angular init", 2 ,3 ,1200, "0"),
("Formation", "React avancé", 2, 3, 1000, "2"),
("Coaching", "React Techlead",1 ,20 ,900,"2"),
("Coaching", "Nest.js Techlead", 1 ,50 ,800,"1"),
("Coaching", "React Teachead" , 3, null, null, null),
("Coaching", "Angular Techlead" ,4 , null, null ,null),
("Coaching", "Jakarta EE" ,3 , null, null ,null),
("Coaching", "Angular" , 3 , 15, 200 ,0),
("Coaching", "bAngular" , 3 , 15, 200 ,0),
("Coaching", "gular" , 3 , 15, 200 ,0),
("Coaching","lar", 3 , 15, 200 ,0);


-- => Afficher toutes les formations sollicités par le client M2i formation
SELECT clients.companyName, concat(clients.firstName, " ",clients.lastname)as nom,orders.designation as Formation FROM `orders` JOIN clients on clients.id=orders.clientid WHERE clientid=2;

-- Afficher les noms des clients qui ont sollicité un coaching 

SELECT DISTINCT CONCAT(clients.firstName," ",clients.lastName) AS nom, clients.email,clients.phone,clients.adress,clients.zipCode,clients.city,clients.country,orders.typePresta FROM clients JOIN orders ON clients.id=orders.clientid WHERE typePresta="Coaching";


-- Afficher les noms et contacts des clients qui ont sollicité un coaching pour les accompagnements React.js
SELECT DISTINCT CONCAT(clients.firstName," ",clients.lastName) AS nom,clients.email,clients.phone,clients.adress,clients.zipCode,clients.city,clients.country, orders.typePresta, orders.designation FROM clients JOIN orders ON clients.id=orders.clientid WHERE typePresta="Coaching" and designation = "Nest.js Techlead";


-- correct

Create VIEW v_total5 as SELECT (orders.nbDays*orders.unitPrice) as "totaltaxeexcluded",(orders.nbDays*orders.unitPrice + orders.nbDays*orders.unitPrice*0.2) as totalwithTaxe, orders.id from orders;


-- Pour chacune des demandes de formation, afficher les prix 

SELECT orders.designation, orders.typePresta, v_total5.totaltaxeexcluded, v_total5.totalwithTaxe FROM v_total5 JOIN orders ON v_total5.id=orders.id WHERE orders.typePresta = "formation";

-- Lister toutes les prestations qui sont confirmés et qui vont rapporter plus 30.000€
SELECT orders.designation, orders.typePresta, v_total5.totaltaxeexcluded, v_total5.totalwithTaxe, state FROM v_total5 JOIN orders ON v_total5.id=orders.id WHERE orders.state = "2" and v_total5.totaltaxeexcluded >=30000;





--Create VIEW v_total2 as SELECT (orders.nbDays*orders.unitPrice) as "total taxe excluded",(orders.nbDays*orders.unitPrice + orders.nbDays*orders.unitPrice*0.2) as totalwithTaxe, concat(typePresta," ",designation) FROM orders;
--Create VIEW v_total3 as SELECT (orders.nbDays*orders.unitPrice) as "total taxe excluded",(orders.nbDays*orders.unitPrice + orders.nbDays*orders.unitPrice*0.2) as totalwithTaxe,typePresta,designation FROM orders;

--SELECT * FROM `v_total3` WHERE `typePresta`= "formation";

--Create VIEW v_total4 as SELECT (orders.nbDays*orders.unitPrice) as "total taxe excluded",(orders.nbDays*orders.unitPrice + orders.nbDays*orders.unitPrice*0.2) as totalwithTaxe,typePresta,designation FROM orders;

