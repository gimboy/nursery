#7. В подключенном MySQL репозитории создать базу данных “Друзья человека”.

CREATE DATABASE Mans_friends;

#8. Создать таблицы с иерархией из диаграммы в БД.

USE Mans_friends;

CREATE TABLE Animal
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
kind_animal VARCHAR(20)
);

CREATE TABLE Home_animal
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
kind_animal VARCHAR(20),
animal_id INT,
FOREIGN KEY (animal_id) REFERENCES Animal(id)
);

CREATE TABLE Pack_animal
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
kind_animal VARCHAR(20),
animal_id INT,
FOREIGN KEY (animal_id) REFERENCES Animal(id)
);

CREATE TABLE Dog
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
home_animal_id INT,
`name` VARCHAR(20),
date_birth DATE,
skills VARCHAR(20),
FOREIGN KEY (home_animal_id) REFERENCES Home_animal(id)
 );
 
 CREATE TABLE Cat
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
home_animal_id INT,
`name` VARCHAR(20),
date_birth DATE,
skills VARCHAR(20),
FOREIGN KEY (home_animal_id) REFERENCES Home_animal(id)
 );
 
 CREATE TABLE Hamster
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
home_animal_id INT,
`name` VARCHAR(20),
date_birth DATE,
skills VARCHAR(20),
FOREIGN KEY (home_animal_id) REFERENCES Home_animal(id)
 );
 
 CREATE TABLE Horse
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
pack_animal_id INT,
`name` VARCHAR(20),
date_birth DATE,
skills VARCHAR(20),
FOREIGN KEY (pack_animal_id) REFERENCES Pack_animal(id)
 );
 
CREATE TABLE Camel
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
pack_animal_id INT,
`name` VARCHAR(20),
date_birth DATE,
skills VARCHAR(20),
FOREIGN KEY (pack_animal_id) REFERENCES Pack_animal(id)
 );
 
 CREATE TABLE Donkey
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
pack_animal_id INT,
`name` VARCHAR(20),
date_birth DATE,
skills VARCHAR(20),
FOREIGN KEY (pack_animal_id) REFERENCES Pack_animal(id)
 );
