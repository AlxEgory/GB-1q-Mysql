/*	Задачи:
 * 1.	Составить общее текстовое описание БД и решаемых ею задач;
 * Для проекта выбран сайт https://www.list-org.com, на котором размещены регистрационные данные о юридических лицах
 * и индифидуальных предпринимателях.
 * 2.	минимальное количество таблиц - 10;
 * 3.	скрипты создания структуры БД:
*/

CREATE DATABASE listorg;

USE listorg;


CREATE TABLE org (
	id SERIAL PRIMARY KEY,
	inn VARCHAR(12) UNIQUE NOT NULL COMMENT 'ИНН компании',
	type_org ENUM ('UL','FL') NOT NULL COMMENT 'Вид субъекта: Юридическое или Физическое лицо ',
	date_reg DATE NOT NULL COMMENT 'Дата регистрации субьекта',
	status ENUM ('OPER','LIC') COMMENT 'Статус субъекта: действующее или ликвидированное ',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Таблица организаций';

CREATE TABLE date_lic(
	id SERIAL PRIMARY KEY,
	org_id BIGINT UNSIGNED NOT NULL COMMENT 'Ссылка на организацию',
	date_lic DATE NOT NULL COMMENT 'Дата ликвидации субьекта',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Даты ликвидации субъекта';

ALTER TABLE date_lic ADD CONSTRAINT date_lic_org FOREIGN KEY (org_id) REFERENCES org(id);

CREATE TABLE ul_profile (
	id SERIAL PRIMARY KEY,
	org_id BIGINT UNSIGNED NOT NULL COMMENT 'Ссылка на организацию',
	name VARCHAR(255) NOT NULL COMMENT 'Наименование компании',
	forma  VARCHAR(7) NOT NULL COMMENT 'Организационно-правовая форма компании',
	ogrn  VARCHAR(13) UNIQUE NOT NULL COMMENT 'ОГРН компании',
	kpp VARCHAR(9) NOT NULL COMMENT 'КПП компании',
	oktmo_ul VARCHAR(11) NOT NULL COMMENT 'ОКТМО компании',
	okved_ul VARCHAR(11) NOT NULL COMMENT 'Основной ЭКВЭД компании',
	address VARCHAR(255) NOT NULL COMMENT 'Адрес компании',
	phone CHAR(11) NOT NULL COMMENT 'Телефон',
	email VARCHAR(100) NOT NULL COMMENT 'Электронная почта',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Профиль юридического лица';

ALTER TABLE ul_profile ADD CONSTRAINT ul_profile_org FOREIGN KEY (org_id) REFERENCES org(id);


CREATE TABLE fl_profile (
	id SERIAL PRIMARY KEY,
	org_id BIGINT UNSIGNED NOT NULL COMMENT 'Ссылка на организацию',
	first_name VARCHAR(100) NOT NULL COMMENT 'Имя физического лица',
	second_name VARCHAR(100) NOT NULL COMMENT 'Отчество физического лица',
	last_name VARCHAR(100) NOT NULL COMMENT 'Фамилия физического лица',
	ogrn  VARCHAR(13) UNIQUE NOT NULL COMMENT 'ОГРН физического лица',
	okved_fl VARCHAR(11) NOT NULL COMMENT 'Основной ЭКВЭД компании',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Профиль физического лица лица';

ALTER TABLE fl_profile ADD CONSTRAINT fl_profile_org FOREIGN KEY (org_id) REFERENCES org(id);

CREATE TABLE ul_shareholders (
	id SERIAL PRIMARY KEY,
	org_id BIGINT UNSIGNED NOT NULL COMMENT 'Ссылка на организацию',
	first_name VARCHAR(100) NOT NULL COMMENT 'Имя влательца',
	second_name VARCHAR(100) NOT NULL COMMENT 'Отчество владельца',
	last_name VARCHAR(100) NOT NULL COMMENT 'Фамилия владельца',
	inn_sh VARCHAR(12) NOT NULL COMMENT 'ИНН владельца',
	proc_share DECIMAL (3,2) UNSIGNED NOT NULL COMMENT 'Процент доли в организации',
	sum_share DECIMAL (11,2) UNSIGNED NOT NULL COMMENT 'Сумма доли в организации в рублях',
	date_sh DATE NOT NULL COMMENT 'Дата регистрации вланиия доли',
	status ENUM ('ACT','HIS') COMMENT 'Статус владельца: текущий или бывший ',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
)COMMENT 'Учредители юридического лица';

ALTER TABLE ul_shareholders ADD CONSTRAINT ul_shareholders_org FOREIGN KEY (org_id) REFERENCES org(id);

CREATE TABLE ul_managment (
	id SERIAL PRIMARY KEY,
	org_id BIGINT UNSIGNED NOT NULL COMMENT 'Ссылка на организацию',
	first_name VARCHAR(100) NOT NULL COMMENT 'Имя руководителя',
	second_name VARCHAR(100) NOT NULL COMMENT 'Отчество руководителя',
	last_name VARCHAR(100) NOT NULL COMMENT 'Фамилия руководителя',
	inn_mn VARCHAR(12) NOT NULL COMMENT 'ИНН руководителя',
	managment_name VARCHAR(100) NOT NULL COMMENT 'Должность руководителя',
	date_mn DATE NOT NULL COMMENT 'Дата назначения на должность',
	status ENUM ('ACT','HIS') COMMENT 'Статус руководителя: текущий или бывший ',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
)COMMENT 'Руководители юридического лица';

ALTER TABLE ul_managment ADD CONSTRAINT ul_managment_org FOREIGN KEY (org_id) REFERENCES org(id);

CREATE TABLE oktmo_tab (
	id SERIAL PRIMARY KEY,
	oktmo VARCHAR(11) NOT NULL UNIQUE COMMENT 'Номер ОКТМО',
	oktmo_desc VARCHAR(255) NOT NULL  COMMENT 'Описание ОКТМО',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Перечень ОКТМО';

ALTER TABLE ul_profile ADD CONSTRAINT ul_profile_oktmo_tab FOREIGN KEY (oktmo_ul) REFERENCES oktmo_tab(oktmo);

CREATE TABLE okved_tab (
	id SERIAL PRIMARY KEY,
	okved VARCHAR(11) NOT NULL UNIQUE COMMENT 'Номер ОКВЭД',
	okved_desc VARCHAR(255) NOT NULL  COMMENT 'Описание ОКВЭД',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Перечень ОКВЭД';

ALTER TABLE ul_profile ADD CONSTRAINT ul_profile_okved_tab FOREIGN KEY (okved_ul) REFERENCES okved_tab(okved);
ALTER TABLE fl_profile ADD CONSTRAINT fl_profile_okved_tab FOREIGN KEY (okved_fl) REFERENCES okved_tab(okved);

CREATE TABLE reg_pfr_ul (
	id SERIAL PRIMARY KEY,
	org_id BIGINT UNSIGNED NOT NULL COMMENT 'Ссылка на организацию',
	number_pfr  VARCHAR(12) UNIQUE NOT NULL COMMENT 'Регистрациооный номер в ПФР',
	name_pfr VARCHAR(255) NOT NULL COMMENT 'Наименование органа ПФР',
	date_pfr DATE NOT NULL COMMENT 'Дата регистрации в ПФР',
	number_egrul  VARCHAR(13) UNIQUE NOT NULL COMMENT 'Номер записи в ЕГРЮЛ',
	date_egrul DATE NOT NULL COMMENT 'Дата записи в ЕГРЮЛ',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Регистрационные данные компании в Пенсионном фонде РФ';

ALTER TABLE reg_pfr_ul ADD CONSTRAINT reg_pfr_ul_org FOREIGN KEY (org_id) REFERENCES org(id);

CREATE TABLE reg_fss_ul (
	id SERIAL PRIMARY KEY,
	org_id BIGINT UNSIGNED NOT NULL COMMENT 'Ссылка на организацию',
	number_fss  VARCHAR(15) UNIQUE NOT NULL COMMENT 'Регистрациооный номер в ФСС',
	name_fss VARCHAR(255) NOT NULL COMMENT 'Наименование органа ФСС',
	date_fss DATE NOT NULL COMMENT 'Дата регистрации в ФСС',
	number_egrul  VARCHAR(13) UNIQUE NOT NULL COMMENT 'Номер записи в ЕГРЮЛ',
	date_egrul DATE NOT NULL COMMENT 'Дата записи в ЕГРЮЛ',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Регистрационные данные компании в Фонде социального страхования';

ALTER TABLE reg_fss_ul ADD CONSTRAINT reg_fss_ul_org FOREIGN KEY (org_id) REFERENCES org(id);


/* 4.	создать ERDiagram для БД: в файле
 * 5.	скрипты наполнения БД данными: Дамп БД (наполнение таблиц данными)
 * 8.	хранимые процедуры / триггеры
 * */




DELIMITER //

-- Процедура поверки ИНН для тригеров. Проверяет соответсвие ИНН для юр.лица 10 цифрам, для физ. лица 12 цифрам.
-- При ошибке возвращает сообщение 

CREATE PROCEDURE check_inn (IN new_inn VARCHAR(12),IN new_type_org VARCHAR(12))
BEGIN
  	IF NOT (REGEXP_LIKE(new_inn, '^[0-9]{12}$') AND new_type_org = 'FL') 
  	AND NOT (REGEXP_LIKE(new_inn, '^[0-9]{10}$') AND new_type_org = 'UL')  		
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Не верный формат формат ИНН';
	END IF;
END//

-- Тригер для вставки новых значений в таблицу org с учетом проверки на ИНН через процедуру

CREATE TRIGGER check_inn_ins BEFORE INSERT ON org
FOR EACH ROW 
BEGIN 
	CALL check_inn (NEW.inn, NEW.type_org);
END//

-- Тригер для обновения новых значений в таблице org  с учетом проверки на ИНН через процедуру

CREATE TRIGGER check_inn_upd BEFORE UPDATE ON org
FOR EACH ROW 
BEGIN 
	CALL check_inn (NEW.inn, NEW.type_org);
END//

-- Процедура обновления признака ликвидации компании. 
-- При добавлении, удалении или обновлении даты ликвидации компании в таблице date_lic изменяется статус компании в таблице org.

DROP TRIGGER update_lic_upd;
DELIMITER //

CREATE TRIGGER update_lic_ins AFTER INSERT ON date_lic
FOR EACH ROW 
BEGIN 
	UPDATE org SET 
		status = 'LIC'
	WHERE id = NEW.org_id;
END
//

CREATE TRIGGER update_lic_upd AFTER UPDATE ON date_lic
FOR EACH ROW 
BEGIN 
	UPDATE org SET 
		status = 'OPER'
	WHERE id = OLD.org_id;
	UPDATE org SET 
		status = 'LIC'
	WHERE id = NEW.org_id;
END
//

CREATE TRIGGER update_lic_del AFTER DELETE ON date_lic
FOR EACH ROW 
BEGIN 
	UPDATE org SET 
		status = 'OPER'
	WHERE id = OLD.org_id;
END
//

-- 7.	представления (минимум 2); Создание представления с помощью JOIN, которое показывает всех юр. лиц
DROP VIEW ul; 

CREATE VIEW ul AS
SELECT 
	forma,
	name,
	inn,
	kpp,
	address,
	phone,
	email,
	date_reg,
	status,
	ogrn,
	oktmo_ul,
	okved_ul	
FROM 
	org o
LEFT JOIN
	ul_profile up 
ON
	o.id =up.org_id	
WHERE o.type_org = 'UL';

SELECT * FROM ul u ;
-- Создание представления с помощью JOIN, которое показывает всех фл. лиц

CREATE VIEW fl AS
SELECT 
	last_name,
	first_name,
	second_name,
	inn,
	status,
	ogrn,
	date_reg,
	okved_fl
FROM 
	org o
LEFT JOIN
	fl_profile fp
ON 
	o.id = fp.org_id 
WHERE 
	type_org = 'FL';

-- 6.	скрипты характерных выборок. Запрос с GROUP BY и вложенной таблицей. Вывести название компании, котороя зарегистирована раньше всех
-- с указанием общего количества зарегистрированных компаний

SELECT 
	name,
	(SELECT date_reg FROM org o WHERE o.id=up.org_id) reg_date,
	(SELECT COUNT(1) cnt FROM org o GROUP BY type_org HAVING type_org = 'UL') cnt_ul
FROM ul_profile up 
ORDER BY reg_date LIMIT 1;

