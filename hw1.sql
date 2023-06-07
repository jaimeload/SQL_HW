# 1
CREATE DATABASE hw1;
USE hw1;
CREATE TABLE phone
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
ProductName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(30) NOT NULL,
ProductCount INT,
Price INT
);

INSERT phone(ProductName, Manufacturer, ProductCount, Price)
 VALUES
 ('IPhone X', 'Apple', 3, 76000),
 ('IPhone 8', 'Apple', 2, 51000),
 ('Galaxy S9', 'Samsung', 2, 56000),
 ('Galaxy S8', 'Samsung', 1, 41000),
 ('P20 Pro', 'Huawei', 5, 36000);
 
 SELECT * FROM phone;
 
#2
SELECT Manufacturer, Price FROM phone
WHERE ProductCount > 2;


#3
SELECT * FROM phone
WHERE Manufacturer = 'Samsung';

#4
#4.1
SELECT ProductName FROM phone
WHERE ProductName LIKE '%IPhone%';

#4.2
SELECT ProductName FROM phone
WHERE Manufacturer LIKE '%Samsung%';

#4.3
SELECT ProductName FROM phone
WHERE ProductName LIKE '%8%';