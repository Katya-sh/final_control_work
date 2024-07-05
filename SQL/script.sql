create database HumanFriends;
use HumanFriends;

-- Создать таблицы, соответствующие иерархии из вашей диаграммы классов.

CREATE TABLE cat (
	id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name CHAR(30),
    date_of_birth DATE,
    commands CHAR(100)
    
);

CREATE TABLE dog (
id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name CHAR(30),
    date_of_birth DATE,
    commands CHAR(100)
);

CREATE TABLE hamster (
	id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name CHAR(30),
    date_of_birth DATE,
    commands CHAR(100)
);

CREATE TABLE horse (
	id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name CHAR(30),
    date_of_birth DATE,
    commands CHAR(100)
);

CREATE TABLE camel (
	id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name CHAR(30),
    date_of_birth DATE,
    commands CHAR(100)
);

CREATE TABLE donkey (
	id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name CHAR(30),
    date_of_birth DATE,
    commands CHAR(100)
);

-- Заполнить таблицы данными о животных, их командах и датами рождения.

INSERT INTO cat (animal_name, date_of_birth,commands) VALUES 
	('Whiskers',  '2019-05-15', 'Sit, Pounce'),
	('Smudge',  '2020-02-20', 'Sit, Pounce, Scratch'),
    ('Oliver',  '2020-06-30', 'Meow, Scratch, Jump');
   
INSERT INTO dog (animal_name, date_of_birth,commands) VALUES 
	('Fido',  '2020-01-01', 'Sit, Stay, Fetch'),
    ('Buddy',  '2018-12-10', 'Sit, Paw, Bark'),
    ('Bella',  '2019-11-11', 'Sit, Stay, Roll');
    
INSERT INTO hamster (animal_name, date_of_birth,commands) VALUES 
	('Hammy',  '2021-03-10', 'Roll, Hide'),
    ('Peanut',  '2021-08-01', 'Roll, Spin');
    
INSERT INTO horse (animal_name, date_of_birth,commands) VALUES 
	('Thunder',  '2015-07-21', 'Trot, Canter, Gallop'),
	('Storm', '2014-05-05', 'Trot, Canter'),
    ('Blaze', '2016-02-29', 'Trot, Jump, Gallop');
    
INSERT INTO camel (animal_name, date_of_birth,commands) VALUES 
	('Sandy', '2016-11-03', 'Walk, Carry Load'),
	('Dune', '2018-12-12', 'Walk, Sit'),
    ('Sahara', '2015-08-14', 'Walk, Run');
    
INSERT INTO donkey (animal_name, date_of_birth,commands) VALUES 
	('Eeyore', '2017-09-18', 'Walk, Carry Load, Bray'),
	('Burro', '2019-01-23', 'Walk, Bray, Kick');
    
    -- Объединить все созданные таблицы в одну, сохраняя информацию о принадлежности к исходным таблицам.
    
   CREATE TABLE Pets (
	id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name CHAR(30),
    date_of_birth DATE,
    commands CHAR(100),
    type ENUM('cat','dog','hamster') NOT NULL
);

INSERT INTO Pets (animal_name, date_of_birth, commands, type)
SELECT animal_name,  date_of_birth, commands, 'cat'
FROM cat;

INSERT INTO Pets (animal_name, date_of_birth, commands, type)
SELECT animal_name,  date_of_birth, commands, 'dog'
FROM dog;

INSERT INTO Pets (animal_name, date_of_birth, commands, type)
SELECT animal_name,  date_of_birth, commands, 'hamster'
FROM hamster;

drop table cat,dog,hamster;

select * from pets;

CREATE TABLE PackAnimals (
	id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name CHAR(30),
    date_of_birth DATE,
    commands CHAR(100),
    type ENUM('horse','camel','donkey') NOT NULL
);

INSERT INTO PackAnimals (animal_name, date_of_birth, commands, type)
SELECT animal_name,  date_of_birth, commands, 'horse'
FROM horse;

INSERT INTO PackAnimals (animal_name, date_of_birth, commands, type)
SELECT animal_name,  date_of_birth, commands, 'camel'
FROM camel;

INSERT INTO PackAnimals (animal_name, date_of_birth, commands, type)
SELECT animal_name,  date_of_birth, commands, 'donkey'
FROM donkey;

drop table horse,camel,donkey;

-- Удалить записи о верблюдах и объединить таблицы лошадей и ослов.
select * from PackAnimals;
 
DELETE 
FROM PackAnimals
WHERE type = 'camel';

-- Создать новую таблицу для животных в возрасте от 1 до 3 лет и вычислить их возраст с точностью до месяца.
drop table young_animal;
CREATE TABLE young_animal (
	id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name CHAR(30),
    commands CHAR(100),
    date_of_birth DATE,
    age_year int,
    age_mounth int
);

INSERT INTO young_animal (animal_name, commands, date_of_birth, age_year, age_mounth)
SELECT animal_name,  commands, date_of_birth, TIMESTAMPDIFF(YEAR, date_of_birth, NOW()), 
TIMESTAMPDIFF(MONTH, date_of_birth, NOW()) % 12
FROM Pets
where TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 3
UNION 
	SELECT animal_name,  commands, date_of_birth, TIMESTAMPDIFF(YEAR, date_of_birth, NOW()), 
TIMESTAMPDIFF(MONTH, date_of_birth, NOW()) % 12
		FROM PackAnimals
        WHERE TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) BETWEEN 1 AND 3;
select * from young_animal;


-- Объединить все созданные таблицы в одну, сохраняя информацию о принадлежности к исходным таблицам.
SELECT * ,'pets' AS table_name  FROM pets
UNION SELECT * , 'pack_animals' AS table_name FROM PackAnimals;