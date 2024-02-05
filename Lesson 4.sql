-- not null
-- unique
-- primary key = unique + not null
-- default 
-- check 

-- auto_increment


-- 1. Создать таблицу products
	-- id первичный ключ автоинкремент
	-- title строка 128
	-- quantity integer от 0 до 10
    
-- use gt171023;
    
-- create table products(
-- 	id int primary key auto_increment,
--     title varchar(128) not null,
--     quantity int check(quantity between 0 and 10)
-- );

-- select * from products;

-- insert into products(title, quantity)
-- values ('Apple', 4),
-- 		('Banana', 3),
--         ('Kiwi', 10),
--         ('Pineapple', 2),
--         ('Avocado', 0);



-- Изменение таблиц и столбцов

-- CRUD

-- Create
-- create database database_name;
-- create table table_name(...);
--  
-- Read
-- select * from table_name;

-- Update
-- alter table - таблица, столбец
-- update - значение, строки

-- Delete
-- drop database database_name;
-- drop table table_name;
-- drop column column_name - столбец
-- delete - значение, строки

-- alter table table_name
-- add название столбца тип_данных огр. - добавление нового столбца 
-- drop column название столбца  - удаление столбца
-- modify column название столбца тип_данных
-- change название_столбца новое_название_столбца тип_данных - изменение название столбца
-- add constraint - добавление ограничения
-- drop constraint - удаление ограничения

-- Добавить поле price тип integer по умолчанию 0

alter table products
add price int default 0;

select * from products;

-- Изменить тип price на decimal(8, 2)
-- Максимум 8 символов, после точки 2 символа 
-- 999999.99 

alter table products
modify column price decimal(8, 2);

-- Изменить тип price обратно на integer

alter table products
modify column price int;

-- Переименовать поле price на item_price

alter table products
change price item_price int;

-- Удалить поле item_price

alter table products
drop column item_price;


-- 1. Добавить поле quality типа decimal(4, 2) со значение по умолчанию 0

alter table products
add quality decimal(4, 2) default 0;

-- 2. Изменить тип quality на integer

alter table products
modify column quality integer;

-- Создать таблицу students с полями
-- name строка (не null)
-- lastname строка (не null)
-- avg_mark целое число (от 0 до 5)
-- gender строка(128) (или “M” или “F”)

create table students(
name varchar(128) not null,
lastname varchar(128) not null,
avg_mark int check(avg_mark between 0 and 5),
gender varchar(128) check(gender in ('M', 'F')));

select * from students;

--  Добавить поле id integer primary key auto_increment 

alter table students
add id int primary key auto_increment;

alter table students
drop column id;

-- Добавление столбца в начало таблицы 
alter table students
add id int primary key auto_increment first;

-- Добавить поле age (тип целое число) после lastname
alter table students
add age int after lastname;

 -- Поменять тип у gender на char(1)
 alter table students
 modify column gender char(1);

 -- Поменять тип у avg_mark на decimal(2, 1)
 alter table students
 modify column avg_mark decimal(2, 1);

-- Переименовать поле name на firstname
alter table students
change name firstname varchar(128);

-- Заполнить таблицу (5 строк)
insert into students(firstname, lastname, age, avg_mark, gender)
values ('Oleg', 'Petrov', 18, 4.3, 'M'),
		('Sona', 'Ivanova', 20, 5.0, 'F');
        
select * from students;

-- С помощью оператора AS можно изменить название выходного столбца или определить его псевдоним:
select firstname as name 
from students;

-- Функции для работы с числами

select 5 as number;

-- ABS: возвращает абсолютное значение числа.
select abs(-23) as abs;

-- POW(m, n): возвращает m, возведенную в степень n.
select pow(4, 2) as pow;

select age, pow(age, 2) as pow
from students;

-- SQRT: получает квадратный корень числа.
select sqrt(225) as sqrt;

-- CEILING: возвращает наименьшее целое число, которое больше или равно текущему значению.
select ceiling(123.009) as ceiling_1; 
select ceiling(-123.45) as ceiling_2;

-- FLOOR: возвращает наибольшее целое число, которое меньше или равно текущему значению.
select floor(123.45) as floor_1;
select floor(-123.45) as floor_2;

-- ROUND: округляет число. В качестве первого параметра передается число. Второй параметр указывает на длину. 
-- Если длина представляет положительное число, то оно указывает, до какой цифры после запятой идет округление. 
-- Если длина представляет отрицательное число, то оно указывает, до какой цифры с конца числа до запятой идет округление

select round(1234.567, 2) as round_1;
select round(1234.567, -2) as round_2;
select round(1258.567, -2) as round_3;