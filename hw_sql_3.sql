-- Урок 3. SQL – выборка данных, сортировка, агрегатные функции
-- Таблица для работы на слайде.

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

CREATE DATABASE IF NOT EXISTS lesson4;
USE lesson4;
DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2),
    age INT
);

INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES

 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
SELECT *
FROM staff
ORDER BY salary DESC;

SELECT *
FROM staff
ORDER BY salary;

-- Выведите 5 максимальных заработных плат (saraly)

SELECT salary AS "Максимальные зарплаты"
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post AS "Специальность", SUM(salary) AS "Суммарная зарплата по каждой специальности"
FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT COUNT(id) AS "Рабочих в возрасте 24-49 лет"
FROM staff
WHERE post = "Рабочий" AND age >= 24 AND age <= 49;

-- Найдите количество специальностей

SELECT Count(DISTINCT post) AS "Количество специальностей"
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно

SELECT post AS "Специальности, где сотрудники < 30 лет"
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;