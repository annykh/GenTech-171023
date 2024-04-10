-- Группиировка

use hr;

select * from employees;

select max(salary)
from employees;

-- group by

-- select столбцы
-- from таблцы 
-- [where условие]
-- group by столбец
-- [having условие]
-- [order by столбцы]

-- Найти максимальную зарплату по департаментам
select max(salary) as max_salary, department_id
from employees
group by department_id;

-- Найти среднее зарплат по департаментам
select avg(salary) as avg_salary, department_id
from employees
group by department_id;

-- Найти имена и фамилии сотрудников с максмальной зарплатой в каждом департаменте
select t1.first_name, t1.last_name, t1.salary, t1.department_id
from employees t1
join (select max(salary) as max_salary, department_id
	from employees
	group by department_id) t2
on t1.department_id = t2.department_id
where t1.salary = t2.max_salary;

-- Найти минимальную зарплату для каждой должности. Вывести min_salary, job_id
select min(salary) as min_salary, job_id
from employees
group by job_id;

-- Найти сотрудников с минимальной зарплатой для каждой должности. Вывести first_name, last_name, salary, job_id
select t1.first_name, t1.last_name, t1.salary, t1.job_id
from employees t1
join (select min(salary) as min_salary, job_id
	from employees
	group by job_id) t2
on t1.job_id = t2.job_id and t1.salary = t2.min_salary;

-- count с group_by

-- Кол/во строк в таблице employees
select count(*) as emp_count
from employees;

-- Посчитать кол/во людей в каждом департаменте
select department_id, count(*) as emp_count
from employees
group by department_id;

-- Посчитать кол/во городов в каждой стране из таблицы locations. Вывести city_count, country_id
select count(city) as city_count, country_id
from locations
group by country_id;

-- having

-- Посчитать кол/во людей в каждом департаменте и вывести только те значения где кол/во больше 5.
select department_id, count(*) as emp_count
from employees
group by department_id
having count(*)>5;

-- Вывести те депатраменты, в которых максимальная зарплата выше 10000
select department_id, max(salary) as max_salary
from employees
group by department_id
having max(salary) > 10000;

-- Вывести название департаментов с кол/во сотрудников больше 5. Вывести department_name.
select department_name
from departments t1
join (select department_id, count(*) as emp_count
	from employees
	group by department_id
	having count(*)>5) t2
on t1.department_id = t2.department_id;

-- Вывести название должности(job_title) и маскимальную зарплату этой должности.
select t1.job_title, t2.max_salary
from jobs t1
join (
	select job_id, max(salary) as max_salary
    from employees
    group by job_id
) t2
on t1.job_id = t2.job_id;

-- Вывести название должности и максимальную зарплату, если она больше 8000.
select t1.job_title, t2.max_salary
from jobs t1
join (
	select job_id, max(salary) as max_salary
    from employees
    group by job_id
    having max(salary) > 8000
) t2
on t1.job_id = t2.job_id;

-- Найти кол/во сотрудников у каждого менеджера. Вывести manager_id и emp_count. 
select manager_id, count(employee_id) as emp_count
from employees
where manager_id is not null
group by manager_id;

-- Найти департамент с наибольшим кол/вом сотрудников.

-- 1. Найти кол/во сотрудников в каждом департаменте
select department_id, count(*) as emp_conut
from employees
group by department_id;

-- 2. Найти максимальное кол/во сотрудников среди департаментов
select max(t1.emp_conut) as max_emp_count
from (select department_id, count(*) as emp_conut
	from employees
	group by department_id) t1;

-- 3. Найти ИД департманета с максимальным кол/вом сотрудников
select department_id, count(*)
from employees
group by department_id
having count(*) = (select max(emp_conut) as max_emp_count
from (select department_id, count(*) as emp_conut
	from employees
	group by department_id) t1);

