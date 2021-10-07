mysql
CREATE DATABASE example;
USE example;
CREATE TABLE users (id SERIAL, name VARCHAR (40) NOT NULL UNIQUE);
quit
mysqldump example > dumpexample.sql -- пароли заданы в .my.cnf
mysql
CREATE DATABASE sample;
quit
mysql sample < dumpexample.sql
