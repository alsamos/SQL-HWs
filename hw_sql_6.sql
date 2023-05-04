-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

USE Homeworks;

DROP FUNCTION IF EXISTS sec_into_days;
DELIMITER $$
CREATE FUNCTION sec_into_days (seconds INT)
RETURNS VARCHAR (45)
DETERMINISTIC
BEGIN
DECLARE days, hours, minutes INT; 
DECLARE result VARCHAR (45);
SET days = cast((floor(seconds/86400)) as char(2));
SET hours = cast((floor((seconds-days*86400)/3600)) as char(2));
SET minutes = cast((floor((seconds-days*86400-hours*3600)/60)) as char(2));
SET seconds = cast((floor(seconds-days*86400-hours*3600-minutes*60)) as char(2));
SET result = CONCAT(days, " days ", hours, " hours ", minutes, " minutes ", seconds, " seconds ");
RETURN result; 
END $$
SELECT sec_into_days(123456) AS "Результат конвертации"; 

-- Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS print_numbers;
DELIMITER $$
CREATE PROCEDURE print_numbers
(
	IN inp_number INT 
)
BEGIN
	DECLARE n INT; 
    DECLARE result VARCHAR(45) DEFAULT "";
    SET n = 2;
    
    REPEAT
		SET result = CONCAT(result, n, " ");
        SET n = n + 2;
		UNTIL n > inp_number
	END REPEAT;
    SELECT result;
END $$
 
CALL print_numbers(10);