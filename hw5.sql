DROP DATABASE IF EXISTS hw5;
CREATE DATABASE IF NOT EXISTS hw5;
USE hw5;
DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars`
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT * FROM cars;

#1
CREATE VIEW cheap_cars AS
SELECT name
FROM cars
WHERE cost < 25000;

SELECT * FROM cheap_cars;

#2
ALTER VIEW cheap_cars AS
SELECT name FROM cars
WHERE cost < 30000;

SELECT * FROM cheap_cars;

#3
CREATE VIEW skoda_audi AS
SELECT name
FROM cars
WHERE name IN ("Skoda", "Audi");

SELECT * FROM skoda_audi;

#1*
SELECT
ROW_NUMBER() OVER (ORDER BY cost) as `#`,
name, cost
FROM (SELECT name, cost FROM cars) AS c;

#2*
SELECT
`#`, name, cost
FROM
(SELECT
ROW_NUMBER() OVER (ORDER BY cost DESC) as `#`,
name, cost
FROM cars) AS c
WHERE `#` <= 3;

SELECT SUM(cost) AS 'sum of top3'
FROM
(SELECT
ROW_NUMBER() OVER (ORDER BY cost DESC) as `#`,
name, cost
FROM cars) AS c
WHERE `#` <= 3;

#3*
SELECT id, name
FROM (
    SELECT id, name, cost, LAG(cost) OVER (ORDER BY id) AS prev_cost
    FROM cars
) AS c
WHERE cost > prev_cost;

#4*
SELECT id, name
FROM (
    SELECT id, name, cost, LEAD(cost) OVER (ORDER BY id) AS next_cost
    FROM cars
) AS c
WHERE cost < next_cost;

#5*
SELECT id, name, cost,
LEAD(cost) OVER (ORDER BY cost) - cost AS delta
FROM cars
ORDER BY cost;
