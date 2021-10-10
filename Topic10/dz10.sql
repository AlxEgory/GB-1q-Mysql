/*
Предварительная версия курсового проекта 
Сайт https://www.list-org.com/
*/

/*DDL-команды*/

CREATE DATABASE listorg;

USE listorg;
DROP TABLE org;
DROP TABLE date_lic;
DROP TABLE listorg.UL_profile;

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
	inn_mn VARCHAR(12) NOT NULL COMMENT 'ИНН физического лица',
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


/*Дамп БД (наполнение таблиц данными), не больше 10 строк в каждой таблице (можно пользоваться генераторами данных).*/