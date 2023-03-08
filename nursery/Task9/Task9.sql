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
 
 # 9. Заполнить низкоуровневые таблицы именами (животных), командами которые они выполняют и датами рождения. 
 
INSERT Animal (id, kind_animal)
VALUES
	(1, "Home_animal"),
    (2, "Pack_animal");
    
SELECT * FROM Animal;

INSERT Home_animal(kind_animal, animal_id)
VALUES
	("Dog",1),
    ("Cat",1),
    ("Hamster",1);
SELECT * FROM Home_animal;
    
INSERT Pack_animal(kind_animal, animal_id)
VALUES
	("Horse", 2),
    ("Camel", 2),
    ("Donkey", 2);
SELECT * FROM Pack_animal;

INSERT Dog (id, home_animal_id, `name`, date_birth, skills)
VALUES
		(1, 1, "Baron", '2020-02-02', "Voice"),
		(2, 1, "Archi", '2018-01-18', "Lie"),
		(3, 1, "Buch", '2015-06-08', "Voice");
SELECT * FROM Dog;

INSERT Cat (id, home_animal_id, `name`, date_birth, skills)
VALUES
		(1, 2, "Kuza", '2017-05-05', "Play"),
		(2, 2, "Bonny", '2014-01-02', "Play"),
		(3, 2, "Bart", '2014-01-02', "Sleep");
SELECT * FROM Cat;

INSERT Hamster (id, home_animal_id, `name`, date_birth, skills)
VALUES
		(1, 3, "Beny", '2012-02-04', "Run"),
		(2, 3, "Volt", '2021-10-05', "Gnaw"),
		(3, 3, "Grom", '2020-07-01', "Run");
SELECT * FROM Hamster;

INSERT Horse (id, pack_animal_id, `name`, date_birth, skills)
VALUES
		(1, 1, "Nemo", '2021-02-01', "Run"),
		(2, 1, "Elza", '2012-03-04', "Run"),
		(3, 1, "Artas", '2022-01-05', "Jump");
SELECT * FROM Horse;

INSERT Camel (id, pack_animal_id, `name`, date_birth, skills)
VALUES
		(1, 2, "Arto", '2021-02-01', "Walk"),
		(2, 2, "Bingo", '2012-03-04', "Stand"),
		(3, 2, "Bruno", '2022-01-05', "Walk");
SELECT * FROM Camel;

INSERT Donkey (id, pack_animal_id, `name`, date_birth, skills)
VALUES
		(1, 3, "Djeck", '2021-02-01', "Walk"),
		(2, 3, "Logan", '2012-03-04', "Walk"),
		(3, 3, "Fred", '2022-01-05', "Stand");
SELECT * FROM Donkey;
