#1
CREATE DATABASE hw2;
USE hw2;
CREATE TABLE sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT NOT NULL
);

INSERT INTO sales (order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
SELECT * FROM sales;

#2
SELECT id AS 'id заказа',
CASE
	WHEN count_product < 100 THEN 'Маленький заказ'
    WHEN count_product >= 100 AND count_product < 300 THEN 'Средний заказ'
    ELSE 'Большой заказ'
END AS 'Тип заказа'
FROM sales;

#3
CREATE TABLE orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(3) NOT NULL,
amount DECIMAL(5,2) NOT NULL,
order_status VARCHAR(30)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
SELECT * FROM orders;

SELECT
id, employee_id, amount,
IF (order_status = 'OPEN', 'Order is in open state',
	IF (order_status = 'CLOSED', 'Order is closed',
		IF (order_status = 'CANCELLED', 'Order is cancelled', ' '))) AS 'full_order_status'
FROM orders;

#4
# 0 - это значение, а NULL - отсутствие значения