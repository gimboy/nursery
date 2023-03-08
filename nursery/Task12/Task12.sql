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

INSERT Home_animal(kind_animal, animal_id)
VALUES
	("Dog",1),
    ("Cat",1),
    ("Hamster",1);
    
INSERT Pack_animal(kind_animal, animal_id)
VALUES
	("Horse", 2),
    ("Camel", 2),
    ("Donkey", 2);

INSERT Dog (id, home_animal_id, `name`, date_birth, skills)
VALUES
		(1, 1, "Baron", '2020-02-02', "Voice"),
		(2, 1, "Archi", '2018-01-18', "Lie"),
		(3, 1, "Buch", '2015-06-08', "Voice");

INSERT Cat (id, home_animal_id, `name`, date_birth, skills)
VALUES
		(1, 2, "Kuza", '2017-05-05', "Play"),
		(2, 2, "Bonny", '2014-01-02', "Play"),
		(3, 2, "Bart", '2014-01-02', "Sleep");

INSERT Hamster (id, home_animal_id, `name`, date_birth, skills)
VALUES
		(1, 3, "Beny", '2012-02-04', "Run"),
		(2, 3, "Volt", '2021-10-05', "Gnaw"),
		(3, 3, "Grom", '2020-07-01', "Run");

INSERT Horse (id, pack_animal_id, `name`, date_birth, skills)
VALUES
		(1, 1, "Nemo", '2021-02-01', "Run"),
		(2, 1, "Elza", '2012-03-04', "Run"),
		(3, 1, "Artas", '2022-01-05', "Jump");

INSERT Camel (id, pack_animal_id, `name`, date_birth, skills)
VALUES
		(1, 2, "Arto", '2021-02-01', "Walk"),
		(2, 2, "Bingo", '2012-03-04', "Stand"),
		(3, 2, "Bruno", '2022-01-05', "Walk");

INSERT Donkey (id, pack_animal_id, `name`, date_birth, skills)
VALUES
		(1, 3, "Djeck", '2021-02-01', "Walk"),
		(2, 3, "Logan", '2012-03-04', "Walk"),
		(3, 3, "Fred", '2022-01-05', "Stand");

# 10. Удалить из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.

DROP TABLE Camel;
 
DELETE FROM Pack_animal WHERE kind_animal = "Camel";
SELECT * FROM Pack_animal;

CREATE TABLE Horse_Donkey
SELECT * FROM Horse UNION SELECT * FROM Donkey;

ALTER TABLE Horse_Donkey
DROP COLUMN id,
ADD id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ADD FOREIGN KEY (pack_animal_id) REFERENCES pack_animal(id);

# 11. Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, 
# но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице.

CREATE TABLE Animal_young
SELECT `name`, skills, date_birth 
FROM Dog
WHERE DATEDIFF(CURDATE(), date_birth) > 365 AND DATEDIFF(CURDATE(), date_birth) < 1095
UNION 
SELECT `name`, skills, date_birth
FROM Cat
WHERE DATEDIFF(CURDATE(), date_birth) > 365 AND DATEDIFF(CURDATE(), date_birth) < 1095
UNION
SELECT `name`, skills, date_birth
FROM Hamster
WHERE DATEDIFF(CURDATE(), date_birth) > 365 AND DATEDIFF(CURDATE(), date_birth) < 1095
UNION
SELECT `name`, skills, date_birth
FROM Horse_Donkey
WHERE DATEDIFF(CURDATE(), date_birth) > 365 AND DATEDIFF(CURDATE(), date_birth) < 1095;

ALTER TABLE Animal_young
ADD id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ADD age_months INT;

UPDATE Animal_young
SET age_months = TIMESTAMPDIFF(MONTH, date_birth, CURDATE());
SELECT * FROM Animal_young;

# 12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.

CREATE TABLE Base_table
SELECT s.*, a.kind_animal AS type
FROM Animal a JOIN
(SELECT d.name, d.skills, d.date_birth, p.kind_animal, p.animal_id
FROM Dog d JOIN Home_animal p ON d.home_animal_id = p.id) s ON s.animal_id = a.id
UNION
SELECT s1.*, a.kind_animal AS type
FROM Animal a JOIN
(SELECT c.name, c.skills, c.date_birth, p.kind_animal, p.animal_id
FROM Cat c JOIN Home_animal p ON c.home_animal_id = p.id) s1 ON s1.animal_id = a.id
UNION
SELECT s2.*, a.kind_animal AS type
FROM Animal a JOIN
(SELECT h.name, h.skills, h.date_birth, p.kind_animal, p.animal_id
FROM Hamster h JOIN Home_animal p ON h.home_animal_id = p.id) s2 ON s2.animal_id = a.id
UNION
SELECT s3.*, a.kind_animal AS type
FROM Animal a JOIN
(SELECT hd.name, hd.skills, hd.date_birth, su.kind_animal, su.animal_id
FROM Horse_Donkey hd JOIN Pack_animal su ON hd.pack_animal_id = su.id) s3 ON s3.animal_id = a.id;

ALTER TABLE Base_table
DROP COLUMN animal_id;
SELECT * FROM Base_table;