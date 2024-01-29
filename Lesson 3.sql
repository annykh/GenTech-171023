-- order by asc
-- order by desc

-- limit 2

-- run code
-- ctrl+shift+enter

-- CRUD

-- create
-- read
-- update
-- delete

-- data type

-- char - fixed
-- varchar - max
-- int - round()
-- numeric/decimal - 12.3

-- Создание таблицы
-- Для создания таблицы используется оператор CREATE TABLE. Его базовый синтаксис имеет 
-- следующий вид:

-- CREATE TABLE имя_таблицы (
-- 	 колонка_1 тип_данных,
-- 	 колонка_2 тип_данных,
-- 	 ...
-- 	 колонка_n тип_данных,
-- );

-- Удаление таблицы
-- Удаление таблицы производится при помощи оператора DROP TABLE.

-- DROP TABLE имя_таблицы;


-- create table table_name(
-- 	id int,
--     first_name varchar(50),
--     age int
-- );

-- Ограничения при создании таблицы

-- Ограничения позволяют указать определенные правила для данных, которые будут вставляться в 
-- таблицу. В случае, если мы попытаемся вставить данные, которые этим правилам не соответствуют, 
-- произойдет ошибка.

-- NOT NULL - Значение в поле не может быть null
-- UNIQUE - Значение в поле должно быть уникальным
-- PRIMARY KEY - NOT NULL + UNIQUE
-- CHECK - Соответствует какому-либо условию
-- DEFAULT - по умолчанию


-- create database gt171023;
-- use gt171023;

-- drop table users;
-- create table users(
-- 	id int primary key,
-- 	first_name varchar(50) not null,
-- 	last_name varchar(50) not null,
-- 	age int check(age>18),
--     email varchar(70) unique,
--     user_password varchar(50) default "12345",
--     gender char(1) check (gender in ('f', 'm')),
--     has_child char(1) check(has_child in ('y', 'n'))
-- );

-- insert into users values (1, 'John', 'Smith', 20, 'john@gmail.com', 'john123', 'm', 'n');

-- insert into users(id, first_name, last_name, age, email, gender, has_child)
-- values (2, 'Bob', 'Brown', 20, 'bob@gmail.com', 'm', 'y');

-- -- insert into users
-- -- values ('Lily', 1, 20, 'Smith', 'lily@gmail.com', '123', 'm', 'y');

-- insert into users(id, first_name, last_name, age, email)
-- values (3, 'Tom', 'Hardy', 20, 'tom@gmail.com');

-- select * from users;


--  Автозаполнение

-- AUTO_INCREMENT/autoincrement позволяет создавать уникальный номер автоматически, когда новая 
-- запись вставляется в таблицу. Часто это поле основного ключа, которое мы хотели бы создать 
-- автоматически каждый раз, когда будет вставлена новая запись.

-- drop table users;
-- create table users(
-- 	id int primary key auto_increment,
-- 	first_name varchar(50) not null,
-- 	last_name varchar(50) not null,
-- 	age int check(age>18),
--     email varchar(70) unique,
--     user_password varchar(50) default "12345",
--     gender char(1) check (gender in ('f', 'm')),
--     has_child char(1) check(has_child in ('y', 'n'))
-- );

-- MySQL использует ключевое слово AUTO_INCREMENT для выполнения функции автоматического 
-- увеличения.
-- По умолчанию начальное значение для AUTO_INCREMENT равно 1, и оно будет увеличиваться на 1 
-- для каждой новой записи.
-- Чтобы вставить новую запись в таблицу «user», нам не нужно указывать значение для столбца 
-- «user_id», так как уникальное значение будет добавляться автоматически:

-- insert into users(first_name, last_name, age, email, user_password, gender, has_child)
-- values ('John', 'Smith', 20, 'john@gmail.com', 'john123', 'm', 'n');

-- insert into users(first_name, last_name, age, email, user_password, gender, has_child)
-- values ('Bob', 'Brown', 20, 'bob@gmail.com', 'bob123', 'm', 'n');

-- -- insert into users(first_name, last_name, age, email, user_password, gender, has_child)
-- -- values ('Bob', 'Brown', 20, 'bob@gmail.com', 'bob123', 'm', 'n');

-- insert into users(first_name, last_name, age, email, user_password, gender, has_child)
-- values ('Bob', 'Brown', 20, 'bob1@gmail.com', 'bob123', 'm', 'n'),
-- 		('Bob', 'Brown', 20, 'bob1@gmail.com', 'bob123', 'm', 'n');

-- select * from users;


-- Создать таблицу students
-- id уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10 (вкл)
-- subject varchar not null
-- mark integer от 0 до 5 (вкл)


-- create table students(
-- 	id int primary key auto_increment,
--     firstname varchar(50) not null,
--     lastname varchar(50) not null,
--     class int check(class between 1 and 10),
--     subject varchar(20) not null,
--     mark int check(mark>=0 and mark<=5)
-- );


-- Заполнить таблицу строками(2 строки)
--  insert into students(firstname, lastname, class, subject, mark)
--  values ('John', 'Smith', 6, 'math', 5),
-- 		('Ann', 'Thomas', 4, 'history', 4);
--         
-- select * from students;


--  Создать таблицу staff с полями:
-- • id – integer - уникальное значение, не null, с автозаполнением 
-- • firstname - varchar - не null
-- • lastname - varchar - не null
-- • position - varchar
-- • age - integer - от 0 до 110(вкл.)
-- • has_child – либо Y, либо N
-- • username - varchar - уникальный

drop table staff;
create table staff(
	id int primary key auto_increment,
    firstname varchar(50) not null,
	lastname varchar(50) not null,
    position varchar(50),
    age int check(age between 0 and 110),
    has_child char(1) check(has_child in ('Y', 'N')),
-- has_child char(1) check(has_child='Y' or has_child='N'),
    username varchar(50) unique
);


INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Khachaturyan'
        , 'Senior Teacher'
        , 22
        , 'N'
        , 'annakhach5'
        );
        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Austin'
        , 'Junior Blogger'
        , 25
        , 'Y'
        , 'tom12345'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Bill'
        , 'Lorentz'
        , 'Junior Web Developer'
        , 40
        , 'Y'
        , 'billt1'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Lily'
        , 'May'
        , 'Junior Backend Developer'
        , 25
        , 'Y'
        , 'lil12'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Nona'
        , 'Lucky'
        , 'Junior Teacher'
        , 20
        , 'N'
        , 'LuckyNona'
        ); 
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ( 'Nancy'
        , 'Greenberg'
        , 'Middle UI Designer'
        , 32
        , 'Y'
        , 'nancy1'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Daniel'
        , 'Faviet'
        , 'Senior UX Designer'
        , 43
        , 'Y'
        , 'favietD'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ally'
        , 'Austin'
        , 'Junior UI Designer'
        , 28
        , 'N'
        , 'ally1'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Lily'
        , 'Chen'
        , 'Senior Teacher'
        , 25
        , 'Y'
        , 'lilychen'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Austin'
        , 'Middle Teacher'
        , 34
        , 'Y'
        , 'anna28'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Alexander'
        , 'Lorentz'
        , 'Junior Backend Developer'
        , 25
        , 'N'
        , 'alex12345'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Lorentz'
        , 'Junior UX Designer'
        , 18
        , 'N'
        , 'lorentz99'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Lucky'
        , 'Middle Blogger'
        , 34
        , 'Y'
        , 'lucky78'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Weiss'
        , 'Junior Blogger'
        , 18
        , 'N'
        , 'weiss11'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Weiss'
        , 'Junior UI Designer'
        , 18
        , 'N'
        , 'tom222'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Bloom'
        , 'Middle UX Designer'
        , 20
        , 'N'
        , 'bloom5'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Berg'
        , 'Middle Teacher'
        , 34
        , 'N'
        , 'tommy1'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Berg'
        , 'Senior Teacher'
        , 37
        , 'N'
        , 'ash89'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Lily'
        , 'Weiss'
        , 'Middle Blogger'
        , 45
        , 'N'
        , 'lilyW1'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Lorentz'
        , 'Senior UX Designer'
        , 31
        , 'N'
        , 'annlo1'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Weiss'
        , 'Middle UX Designer'
        , 18
        , 'N'
        , 'weiss1'
        );       
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Keren'
        , 'Junior UX Designer'
        , 34
        , 'N'
        , 'annaK1'
        );       

select * from staff;

-- 1. Найти список работников, у который юзернейм заканчивается на ‘1’
select * from staff
where username like '%1';

-- 2. Найти список работников в возрасте от 20 до 30 лет, у которых младший(junior) уровень должности
select * from staff
where age between 20 and 30 and position like 'Junior%';
