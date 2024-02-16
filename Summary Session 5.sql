-- Создать бд new_tasks
-- create database new_tasks;

-- use new_tasks;

-- Создать таблицу employees;
--  	employee_id целое число первичный ключ автоинкремент;
--  	first_name строка не null,
--  	last_name строка не null,
--  	email строка не null,
--  	salary целое число 
 -- 	department строка не null 
 
--  create table employees(
--  	employee_id int primary key auto_increment,
--  	first_name varchar(128) not null,
--  	last_name varchar(128) not null,
--  	email varchar(128) not null,
--  	salary int, 
-- 	department varchar(128) not null
--  )
 
insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
 
select * from employees;

-- update обновить

-- update table_name
-- set column1 = new_value, column2 = new_value
-- where ...

-- Обновить зарплату сотрудника с именем "Steven" на 25000.
-- set sql_safe_updates = 0;

-- update employees
-- set salary = 25000
-- where first_name = 'Steven';

-- delete удалить

-- delete from table_name
-- where ... 

-- Удалить всех сотрудников из департамента "Marketing".
-- delete from employees
-- where department = 'Marketing';

-- alter table
-- add
-- drop
-- modify
-- change
-- rename

-- Изменить тип столбца salary на DECIMAL(10,2).
alter table employees
modify column salary decimal(10, 2);

-- Удалить столбец email.
alter table employees
drop column email;

-- Добавить столбец manager_id для хранения идентификатора менеджера с типом integer и со значением по умолчанию 1
-- default ..
alter table employees
add manager_id int default 1;

-- Обновить департамент сотрудника с именем "Adam" на "IT".
update employees
set department = 'IT'
where first_name = 'Adam';

-- Изменить имя столбца department на dept_name.
alter table employees
rename column department to dept_name;
-- change department dept_name varchar(128);

-- Удалить всех сотрудников с зарплатой менее 7000.
delete from employees
where salary < 7000;

-- Изменить длину столбца last_name на 50 символов.
alter table employees
modify column last_name varchar(50);

-- Увеличить зарплату всех сотрудников в департаменте "Sales" на 2000.
update employees
set salary = salary + 2000
where dept_name = 'Sales';

-- Удалить все строки из таблицы employees.
delete from employees;
truncate table employees;