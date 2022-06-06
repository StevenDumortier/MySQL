mysql -u root;
Create database sales;
use sales;
CREATE TABLE clients(
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
manufacturer VARCHAR(50) NOT NULL,
price float (4,2) NOT NULL,
units-soli integer(10) NOT NULL
);
insert into telephone(name,manufacturer,price,units_sold) values("Iphone 4","Apple",399,9436),("Galaxy S 5","Samsung",299,2359) ;
select manufacturer, name from telephone where price>=200;
select manufacturer, name  from telephone where price<=200 AND price>=150;
select * from telephone where manufacturer ="Samsung" or manufacturer = "Apple";
