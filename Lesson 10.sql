-- Агрегации 

-- count - кол/во not null строк
-- max - максимальное значение
-- min - минимальное значение
-- avg - среднее значение
-- sum - сумма значений

use hr;

select * from employees;

-- Найти максимальную зарплату  
select max(salary) from employees;

-- Найти минимальную зарплату
select min(salary) from employees;

-- Найти средне значение зарплат
select avg(salary) from employees;

-- Найти сумму всех зарплат 
select sum(salary) from employees;

-- Найти кол/во сотрудников
select count(employee_id) from employees;

select min(salary) as min_salary, max(salary) as max_salary, first_name from employees; -- error

-- Подзапросы 

-- select <column_name>,...
-- from (
-- 		select * from <table_name>
-- 	) t1

-- select <column_name>, ...
-- from <table_name>
-- where <column1_name> = (
-- 		select агрегация(<column_name>)
--         from <table_name>
--     )

-- Вывести имя и фамилию сотрудников с маскимальной зарплатой
-- 1. Вывести имена и фамилии сотрудников
select first_name, last_name
from employees;

-- 2. Найти максимальную зарплату
select max(salary) from employees;

-- 3.Вывести имя и фамилию сотрудников с маскимальной зарплатой
select first_name, last_name
from employees
where salary = (select max(salary) from employees);

-- Найти средную зарплату сотрудников из департамента 100
select avg(salary)
from employees
where department_id = 100;

select * from departments;

-- Найти средную зарплату сотрудников из департамента Finance

-- 1. Вывести зарплаты сотрудников из департамента Finance
select salary from employees t1
inner join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'Finance';

-- 2. Найти средную зарплату этого департамента
select avg(salary) from employees t1
inner join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'Finance';

-- Найти общее количество департаментов
select * from departments;

select count(department_id) as dep_count
from departments;

-- count(*) - кол/во строк в выборке
-- count(<column_name>) - кол/во строк в поле(not null)

select count(*) as dep_count
from departments;

-- Найти общее количество стран(countries)
select count(*) as countries_count 
from countries;

-- Найти сотрудников, у которых зарплата меньше средней зарплаты по компании
-- Вывести имя, фамилию и зарплату.

-- 1. Вывести имя, фамилию и зарплату всех сотрудников
select first_name, last_name, salary
from employees;

-- 2. Найти средную зарплату 
select avg(salary) from employees;

-- 3. Решение задачи
select first_name, last_name, salary
from employees
where salary < (select avg(salary) from employees);

-- Найти количество департаментов, в которых никто не работает
-- left join, right join, count(*)

-- 1. Найти и вывести департаменты, в которых никто не работает
select t1.department_name, t2.employee_id
from departments t1
left join employees t2
on t1.department_id = t2.department_id
where t2.employee_id is null;

-- 2. Найти кол/во строк первого запроса

select count(*)
from departments t1
left join employees t2
on t1.department_id = t2.department_id
where t2.employee_id is null;

-- Найти количество городов(city), где нет департаментов

-- 1. Вывести все города, где нет департаментов
select t2.city, t1.department_id
from departments t1
right join locations t2
on t1.location_id = t2.location_id
where t1.department_id is null;

select count(*)
from departments t1
right join locations t2
on t1.location_id = t2.location_id
where t1.department_id is null;

-- Найти количество сотрудников из департамента с айди 100, которые зарабатывают более 5000
select count(*) as emp_count
from employees
where department_id = 100 and salary > 5000;

-- Найти самую большую зарплату среди сотрудников, работающих в департаментах с id 70 и 80
select max(salary) as max_salary
from employees
where department_id in (70, 80);
-- where department_id = 70 or department_id = 80;

-- Найти самую низкую и самую высокую зарплату сотрудников из отделов(job_id) IT_PROG и ST_MAN
select min(salary) as min_salary, max(salary) as max_salary
from employees
where job_id in ('IT_PROG', 'ST_MAN');

-- Вывести имена и фамилии сотрудников из отделов(job_id) IT_PROG и ST_MAN, которые получают 
-- либо самую низкую либо самую высокую зарпалту
select first_name, last_name, salary
from employees
where job_id in ('IT_PROG', 'ST_MAN') and (salary = (select min(salary) from employees where job_id in ('IT_PROG', 'ST_MAN')) 
or salary = (select max(salary) from employees where job_id in ('IT_PROG', 'ST_MAN')));


-- Вывести сотрудников(first_name, last_name, salary) с дольжностью(job_title) Programmer,
-- которые получают больше средней зарплаты всех сотрудников.

select avg(salary) from employees;

select t1.first_name, t1.last_name, t1.salary
from employees t1
inner join jobs t2
on t1.job_id = t2.job_id
where t2.job_title = 'programmer' and salary > (select avg(salary) from employees);