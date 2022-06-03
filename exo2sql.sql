
create TABLE clients (
id integer AUTO_INCREMENT not null PRIMARY key,
companyName VARCHAR(50) not null,
   firstName varchar(50) not null,
lastname varchar(50) not null,
email varchar(50) not null,
phone varchar(10) not null,
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
FOREIGN KEY (clientid)REFERENCES clients(id) on delete set null
nbDays integer(3),
unitPrice integer(10),
state varchar(1) not null
    );


INSERT into clients (companyName, firstName, lastName, email , phone, adress,zipCode , city, country, state) 
values ("Capgemini", "Fabrice", "Martin" , "martin@mail.com", "06 56 85 84 33", "abc" , "xyz" , "Nantes" , "France",  "0"),("M2I Formation", "Julien" , "Lamard", "lamard@mail.com", "06 11 22 33 44", "abc" , "xyz" , "Paris" , "France",  "1"),
("ATOS", "Homer" , "Simpsons", "simpsons@mail.com", "06 51 52 33 44", "abc" , "xyz" , "Springfield" , "USA",  "1")
("Sopra Steria", "jean" , "bon", "bon@mail.com", "06 11 23 53 99", "abc" , "xyz" , "Lille" , "France",  "1");

INSERT into orders(typePresta,designation,clientid,nbDays,unitPrice,state) values ("Formation","Angular init", 2 ,3 ,1200, "0"),("Formation", "React avancé", 2, 3, 1000, "2"),("Coaching", "React Techlead",1 ,20 ,900,"2"),("Coaching", "Nest.js Techlead", 1 ,50 ,800,"1"),("Coaching", "React Teachead" , 3, null, null, null),("Coaching", "Angular Techlead" ,4 , null, null ,null),("Coaching", "Jakarta EE" ,3 , null, null ,null),("Coaching", "Angular" , 3 , 15, 200 ,0),("Coaching", "bAngular" , 3 , 15, 200 ,0),("Coaching", "gular" , 3 , 15, 200 ,0),("Coaching","lar", 3 , 15, 200 ,0);

Create VIEW v_total as SELECT (orders.nbDays*orders.unitPrice) as "total taxe excluded",(orders.nbDays*orders.unitPrice + orders.nbDays*orders.unitPrice*0.2) as totalwithTaxe FROM orders;

SELECT CONCAT(clients.prenom," ",clients.nom) AS nom, clients.email,telephones.numero FROM clients JOIN telephones ON clients.id=telephones.id_client WHERE clientid = 2;

SELECT * FROM `orders` WHERE clientid=2

SELECT distinct (concat (clients.firstName," ",clients.lastName)) as nom where typePresta = Coaching;

SELECT DISTINCT CONCAT(clients.firstName," ",clients.lastName) AS nom FROM clients JOIN orders ON clients.id=orders.clientid WHERE typePresta="Coaching";

SELECT DISTINCT CONCAT(clients.firstName," ",clients.lastName) AS nom FROM clients JOIN orders ON clients.id=orders.clientid WHERE typePresta="Coaching" and designation = "Nest.js Techlead";
-- SELECT DISTINCT CONCAT(clients.firstName," ",clients.lastName) AS nom, designation, typePresta FROM clients JOIN orders ON clients.id=orders.clientid WHERE typePresta="Coaching" and designation = "Nest.js Techlead";


