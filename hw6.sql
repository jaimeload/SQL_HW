CREATE DATABASE hw6;
use hw6;

#1
DELIMITER //
CREATE PROCEDURE ttime(num INT)
BEGIN
DECLARE ss INT DEFAULT 0;
DECLARE mm INT DEFAULT 0;
DECLARE hh INT DEFAULT 0;
DECLARE dd INT DEFAULT 0;
DECLARE result VARCHAR(100) DEFAULT ' ';
SET ss = num % 60;
SET num = FLOOR(num / 60);
SET mm = num % 60;
SET num = FLOOR(num / 60);
SET hh = num % 24;
SET num = FLOOR(num / 24);
SET dd = FLOOR(num);
SET result = CONCAT(dd, ' days ', hh, ' hours ', mm, ' minutes ', ss, ' seconds ');
SELECT result;
END //
DELIMITER ;

CALL ttime(123456);

#2
DELIMITER //
CREATE FUNCTION even(a INT, b INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE result VARCHAR(100) DEFAULT '';
IF a % 2 = 1 OR a % 2 = -1 THEN
	SET a = a + 1;
END IF;
	WHILE a <= b DO
        SET result = concat(result, a, ', ');
        SET a = a + 2;
	END WHILE;
RETURN result;
END //
DELIMITER ;

SELECT even(1, 10);