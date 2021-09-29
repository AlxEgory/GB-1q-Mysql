USE shop;

-- 1.	Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT
	u.id, 
	u.name 
FROM
	users u
INNER JOIN
	(SELECT user_id FROM orders o GROUP BY user_id) o
ON 
	o.user_id = u.id;


-- 2.	Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT 
	p.id,
	c.name, 
	p.name,
	p.description,
	p.price	
FROM 
	products p
LEFT JOIN
	catalogs c 
ON
 p.catalog_id = c.id;

/* 3.	(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов.
*/
CREATE TABLE flights (
id SERIAL PRIMARY KEY,
from_city VARCHAR(15),
to_city VARCHAR(15)
);

CREATE TABLE cities (
label VARCHAR(15) UNIQUE PRIMARY KEY,
name VARCHAR(15));

INSERT 
	flights(from_city, to_city)
VALUES 
	('moscow', 'omsc'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsc', 'irkutsk'),
	('moscow', 'kazan');

INSERT 
	cities
VALUES 
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsc', 'Омск');


SELECT 
	c_from.name,
	c_to.name
FROM 
	flights f 
INNER JOIN 
	cities c_from 
ON
	f.from_city = c_from.label
INNER JOIN 
	cities c_to 
ON
	f.to_city = c_to.label;





