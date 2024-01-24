-- Select, это команда, формирующая выборку, * обозначает перечень полей, все поля, далее идет оператор from и название самой таблицы.

-- select first_name
-- from table_name
-- where salary>2000;

-- > < >= <= = != 

-- and or

-- between min and max

-- like '____' '%'

-- in ('Anna', 'Tom', 'Eric')


-- Особенности значения Null

-- В SQL существует значение Null, которое обозначает отсутствие значения в поле. Не стоит путать значение Null со значением 0 и пустой строкой (""). Также, их нельзя сравнивать ранее изученными операторами.

-- Для сравнения используются только IS NULL или IS NOT NULL

-- is not null, is null

-- create database staff;
-- use staff;

-- CREATE TABLE Staff (
--     id INTEGER PRIMARY KEY AUTO_INCREMENT,
--     firstname VARCHAR(64) NOT NULL,
--     lastname VARCHAR(64) NOT NULL,
--     position VARCHAR(128),
--     age INTEGER,
--     has_child CHAR(1),
--     username VARCHAR(128) unique
--   );

-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Anna'
--         , 'Khachaturyan'
--         , 'Senior Teacher'
--         , 22
--         , 'N'
--         , 'annakhach5'
--         );
--         
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Tom'
--         , 'Austin'
--         , 'Junior Blogger'
--         , 25
--         , 'Y'
--         , 'tom12345'
--         );
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Bill'
--         , 'Lorentz'
--         , 'Junior Web Developer'
--         , 40
--         , 'Y'
--         , 'billt1'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Lily'
--         , 'May'
--         , 'Junior Backend Developer'
--         , 25
--         , 'Y'
--         , 'lil12'
--         );
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Nona'
--         , 'Lucky'
--         , 'Junior Teacher'
--         , 20
--         , 'N'
--         , 'LuckyNona'
--         ); 
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ( 'Nancy'
--         , 'Greenberg'
--         , 'Middle UI Designer'
--         , 32
--         , 'Y'
--         , 'nancy1'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Daniel'
--         , 'Faviet'
--         , 'Senior UX Designer'
--         , 43
--         , 'Y'
--         , 'favietD'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Ally'
--         , 'Austin'
--         , 'Junior UI Designer'
--         , 28
--         , 'N'
--         , 'ally1'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Lily'
--         , 'Chen'
--         , 'Senior Teacher'
--         , 25
--         , 'Y'
--         , 'lilychen'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Anna'
--         , 'Austin'
--         , 'Middle Teacher'
--         , 34
--         , 'Y'
--         , 'anna28'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Alexander'
--         , 'Lorentz'
--         , 'Junior Backend Developer'
--         , 25
--         , 'N'
--         , 'alex12345'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Ashley'
--         , 'Lorentz'
--         , 'Junior UX Designer'
--         , 18
--         , 'N'
--         , 'lorentz99'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Tom'
--         , 'Lucky'
--         , 'Middle Blogger'
--         , 34
--         , 'Y'
--         , 'lucky78'
--         );        
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Ashley'
--         , 'Weiss'
--         , 'Junior Blogger'
--         , 18
--         , 'N'
--         , 'weiss11'
--         );
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Tom'
--         , 'Weiss'
--         , 'Junior UI Designer'
--         , 18
--         , 'N'
--         , 'tom222'
--         );   
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Anna'
--         , 'Bloom'
--         , 'Middle UX Designer'
--         , 20
--         , 'N'
--         , 'bloom5'
--         );   
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Tom'
--         , 'Berg'
--         , 'Middle Teacher'
--         , 34
--         , 'N'
--         , 'tommy1'
--         );   
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Ashley'
--         , 'Berg'
--         , 'Senior Teacher'
--         , 37
--         , 'N'
--         , 'ash89'
--         );
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Lily'
--         , 'Weiss'
--         , 'Middle Blogger'
--         , 45
--         , 'N'
--         , 'lilyW1'
--         );   
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Anna'
--         , 'Lorentz'
--         , 'Senior UX Designer'
--         , 31
--         , 'N'
--         , 'annlo1'
--         );   
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Ashley'
--         , 'Weiss'
--         , 'Middle UX Designer'
--         , 18
--         , 'N'
--         , 'weiss1'
--         );       
-- INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
--         ('Anna'
--         , 'Keren'
--         , 'Junior UX Designer'
--         , 34
--         , 'N'
--         , 'annaK1'
--         );       

/* 





*/

select * 
from Staff;

-- Найти список работников, которым больше 30 лет и у них нет детей

select *
from Staff
where age > 30 and has_child = 'N';

-- Найти список работников, у которых имя начинается с буквы А и у них нет детей

select *
from Staff
where firstname like 'A%' and has_child = 'N';


-- Найти сотрудников с id 4, 12, 19 

select *
from Staff
where id in (4, 12, 19);
-- where id = 4 or id = 12 or id = 19;

-- Найти список работников, у которых средний уровень должности(middle) и им больше 20 лет

select *
from staff
where position like 'middle%' and age > 20;

-- Оператор LIMIT позволяет извлечь определенное количество строк и имеет следующий синтаксис:

-- LIMIT [offset,] rowcount
-- Если оператору LIMIT передается один параметр, то он указывает на количество извлекаемых строк. Если передается два параметра, то первый параметр устанавливает смещение относительно начала, то есть сколько строк нужно пропустить, а второй параметр также указывает на количество извлекаемых строк.

select *
from staff
where position like 'middle%' and age > 20
limit 1;

select *
from staff
where position like 'middle%' and age > 20
limit 2, 3;


-- Оператор ORDER BY сортируют значения по одному или нескольких столбцам.
-- по возрастанию 
select *
from staff
where position like 'middle%' and age > 20
order by age asc
limit 3;

-- по убыванию
select *
from staff
where position like 'middle%' and age > 20
order by age desc
limit 3;

-- Найти самого молодого работника 

select *
from staff
order by age, username;

-- Найти первых трех сотрудников, чьи имена начинаются на A

select * 
from staff
where firstname like 'a%'
limit 3;

-- Найти список работников, у который юзернейм состоит из 5 символов

select *
from staff
where username like '_____';


-- CRUD

-- Create
-- Read
-- Update
-- Delete

-- Простые типы данных

-- char - фиксирванная длина char(10) - max 255 symbol
-- varchar - varchar(100) максимальное кол/во символов - max 255 symbol
-- int/integer - целое число
-- number/numeric/decimal  - числовые данные

-- Создание таблиц

-- create table new_table(
-- 	поле_1 тип_данных,
--     поле_2 тип_данных,
--     поле_3 тип_данных
-- );

create table users(
	id int,
	fullname varchar(255),
	age int
); 

-- удаление таблицы 
drop table users;

create table users(
	id int,
	fullname varchar(255),
	age int
); 

select *
from users;

-- Добавление данных 

-- insert into имя_таблицы (поле_таблицы, ...)
-- values (значиение_поля_таблицы, ...);

insert into users (id, fullname, age)
values (1, 'John Smith', 30);

-- создать таблицу Employees с полями 
-- 	employee_id Целое число,
--  , first_name текст
--  , last_name текст
--  , email текст
--  , phone текст
--  , job_id текст
--  , salary числовое значение decimal
--  , commission_pct числовое значение
--  , manager_id целое число
--  , department_id целое число
--  
 drop table Employees;
 create table Employees(
	employee_id int,
    first_name varchar(20),
    last_name varchar(40),
    email varchar(40),
    phone varchar(20),
    job_id varchar(10),
    salary decimal,
    commission_pct decimal,
    manager_id int,
    department_id int
 );
 
 INSERT INTO employees 
 VALUES 
        ( 100
        , 'Steven'
        , 'King'
        , 'SKING'
        , '515.123.4567'
        , 'AD_PRES'
        , 24000
        , NULL
        , NULL
        , 90
        );
        
INSERT INTO employees VALUES 
	 ( 101
	 , 'Neena'
	 , 'Kochhar'
	 , 'NKOCHHAR'
	 , '515.123.4568'
	 , 'AD_VP'
	 , 17000
	 , NULL
	 , 100
	 , 90
	 );


select * 
from employees;


