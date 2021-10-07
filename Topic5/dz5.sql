USE shop;
DESC users;
SELECT * FROM users;
/*
1.	Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем.
*/
-- Применяем функцию NOW()
UPDATE users SET created_at = NOW(),updated_at = NOW()
    WHERE id <10;

/*
2.	Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR 
и в них долгое время помещались значения в формате 20.10.2017 8:10. 
Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/

-- Изменим тип поля created_at и updated_at на VARCHAR
ALTER TABLE users MODIFY COLUMN  created_at VARCHAR (20);
ALTER TABLE users MODIFY COLUMN  updated_at VARCHAR (20);

-- Изменим значения 
UPDATE users SET created_at = '20.10.2017 8:10' ,updated_at = '20.10.2017 8:10'
    WHERE id <10;
    
-- Вариант 1. Функции в лекции
UPDATE users SET 
	created_at = CONCAT(SUBSTRING(created_at,9,2),'.',SUBSTRING(created_at,4,2),'.',SUBSTRING(created_at,1,2),SUBSTRING(created_at,11,5)), 
    updated_at = CONCAT(SUBSTRING(updated_at,9,2),'.',SUBSTRING(updated_at,4,2),'.',SUBSTRING(updated_at,1,2),SUBSTRING(updated_at,11,5))
    WHERE id <10;
-- Изменим тип полей created_at и updated_at на DATETIME
ALTER TABLE users MODIFY COLUMN  created_at DATETIME;
ALTER TABLE users MODIFY COLUMN  updated_at DATETIME;

-- Вариант 2. Функция STR_TO_DATE()
UPDATE users SET 
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'), 
    updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i')
    WHERE id <10;
 -- Изменим тип полей created_at и updated_at на DATETIME
ALTER TABLE users MODIFY COLUMN  created_at DATETIME;
ALTER TABLE users MODIFY COLUMN  updated_at DATETIME;

/*
3.	В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
Однако нулевые запасы должны выводиться в конце, после всех записей.
*/

SELECT * FROM storehouses_products ORDER BY  value = 0, value;

/*
1.	Подсчитайте средний возраст пользователей в таблице users.
*/
SELECT * FROM users;
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR,birthday_at,NOW()))) av_age FROM users;

/*
2.	Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/

SELECT 
	CASE 
		WHEN DAYOFWEEK(CONCAT('2021',SUBSTRING(birthday_at,5,6))) = 1 THEN 'sunday'
        WHEN DAYOFWEEK(CONCAT('2021',SUBSTRING(birthday_at,5,6))) = 2 THEN 'monday'
        WHEN DAYOFWEEK(CONCAT('2021',SUBSTRING(birthday_at,5,6))) = 3 THEN 'tuesday'
        WHEN DAYOFWEEK(CONCAT('2021',SUBSTRING(birthday_at,5,6))) = 4 THEN 'wednesday'
        WHEN DAYOFWEEK(CONCAT('2021',SUBSTRING(birthday_at,5,6))) = 5 THEN 'thursday'
        WHEN DAYOFWEEK(CONCAT('2021',SUBSTRING(birthday_at,5,6))) = 6 THEN 'friday'
		WHEN DAYOFWEEK(CONCAT('2021',SUBSTRING(birthday_at,5,6))) = 7 THEN 'saturday'
	END day_of_week, 
    COUNT(1) birthday_dates
FROM users GROUP BY day_of_week;


