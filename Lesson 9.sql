create database test;
use test;

-- 1) Создать таблицу Students

-- с полями:
-- - id целое число первичный ключ автоинкремент
-- - name строка 128 не null
-- - age целое число

create table Students(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

-- 2) Создать таблицу Teachers
-- с полями:
-- id целое число первичный ключ автоинкремент
-- name строка 128 не null
-- age целое число

create table Teachers(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

-- 3) Создать таблицу Competencies
-- с полями:
-- id целое число первичный ключ автоинкремент
-- title строка 128 не null

create table Competencies(
	id int primary key auto_increment,
    title varchar(128) not null
);

-- 4) Создать таблицу Teachers2Competencies
-- с полями:
-- id целое число первичный ключ автоинкремент
-- teacher_id целое число
-- competencies_id целое число

create table Teachers2Competencies(
	id int primary key auto_increment,
    teacher_id int,
    competencies_id int
);

-- 5) Создать таблицу Courses
-- id целое число первичный ключ автоинкремент
-- teacher_id целое число
-- title строка 128 не null
-- headman_id целое число

create table Courses(
	id int primary key auto_increment,
    teacher_id int, 
    title varchar(128) not null,
    headman_id int
    );

-- 6)Создать таблицу Students2Courses
-- id целое число первичный ключ автоинкремент
-- student_id целое число
-- course_id целое число

create table Students2Courses(
	id int primary key auto_increment,
    student_id int,
    course_id int
);

-- 1) Добавить 6 записей в таблицу Students

-- Анатолий 29
-- Олег 25
-- Семен 27
-- Олеся 28
-- Ольга 31
-- Иван 22


-- 2) Добавить 6 записей в таблицу Teachers

-- Петр 39
-- Максим 35
-- Антон 37
-- Всеволод 38
-- Егор 41
-- Светлана 32

-- 3) Добавить 4 записей в таблицу Competencies

-- Математика 
-- Информатика
-- Программирование
-- Графика

-- 4) Добавьте 6 записей в таблицу Teachers2Competencies

-- 1 1
-- 2 1
-- 2 3
-- 3 2
-- 4 1
-- 5 3

-- 5) Добавьте 5 записей в таблицу Courses

-- 1 Алгебра логики 2
-- 2 Математическая статистика 3
-- 4 Высшая математика 5
-- 5 Javascript 1
-- 5 Базовый Python 1

-- 6) Добавьте 5 записей в таблицу Students2Courses

-- 1 1
-- 2 1
-- 3 2
-- 3 3
-- 4 5

insert into Students (name, age)
values ('Анатолий', 29),
	('Олег', 25),
    ('Семен', 27),
    ('Олеся', 28),
    ('Ольга', 31),
    ('Иван', 22);
    
insert into teachers (name, age) values ('Петр', 39);
insert into teachers (name, age) values ('Максим', 35);
insert into teachers (name, age) values ('Антон', 37);
insert into teachers (name, age) values ('Всеволод', 38);
insert into teachers (name, age) values ('Егор', 41);
insert into teachers (name, age) values ('Светлана', 32);

insert into Competencies (title) values ('Математика');
insert into Competencies (title) values ('Информатика');
insert into Competencies (title) values ('Программирование');
insert into Competencies (title) values ('Графика');

insert into Teachers2Competencies (teacher_id, competencies_id) values (1, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 3);
insert into Teachers2Competencies (teacher_id, competencies_id) values (3, 2);
insert into Teachers2Competencies (teacher_id, competencies_id) values (4, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (5, 3);

insert into courses (teacher_id, title, headman_id) values (1, 'Алгебра логики', 2);
insert into courses (teacher_id, title, headman_id) values (2, 'Математическая статистика', 3);
insert into courses (teacher_id, title, headman_id) values (4, 'Высшая математика', 5);
insert into courses (teacher_id, title, headman_id) values (5, 'Javascript', 1);
insert into courses (teacher_id, title, headman_id) values (5, 'Базовый Python', 1);

insert into students2courses (student_id, course_id) values (1, 1);
insert into students2courses (student_id, course_id) values (2, 1);
insert into students2courses (student_id, course_id) values (3, 2);
insert into students2courses (student_id, course_id) values (3, 3);
insert into students2courses (student_id, course_id) values (4, 5);


-- 1) Вывести имена студентов и курсы, которые они проходят

select t1.name, t3.title
from students t1
join students2courses t2
on t1.id = t2.student_id
join courses t3
on t2.course_id = t3.id;

select t1.name, t2.course_id
from students t1
left join students2courses t2
on t1.id = t2.student_id;

select t1.name, t2.course_id
from students t1
right join students2courses t2
on t1.id = t2.student_id;


-- 2) Вывести имена всех преподавателей с их компетенциями

select t1.name, t3.title
from teachers t1
join Teachers2Competencies t2
on t1.id = t2.teacher_id
join Competencies t3
on t2.competencies_id = t3.id;

-- 3) Найти преподавателя(name), у которого нет компетенций

select t1.name
from teachers t1
left join Teachers2Competencies t2
on t1.id = t2.teacher_id
where t2.competencies_id is null;

-- 4) Найти имена студентов, которые не проходят ни один курс

select t1.name
from students t1
left join students2courses t2
on t1.id = t2.student_id
where t2.course_id is null;

-- 5) Найти курсы, которые не посещает ни один студент

select t1.title
from courses t1
left join students2courses t2
on t1.id = t2.course_id
where t2.student_id is null;

select t1.title
from courses t1
left join students2courses t2
on t1.id = t2.course_id
where t2.course_id is null;

select t2.title
from students2courses t1
right join courses t2
on t1.course_id = t2.id
where t1.student_id is null;

-- 6) Найти компетенции, которых нет ни у одного преподавателя(right join)

select t2.title
from Teachers2Competencies t1
right join Competencies t2
on t1.competencies_id = t2.id
where t1.teacher_id is null;

-- Для домашнего задания

create database homework;

-- Правой кнопкой нажать на новую базу данных, выбрать Table data import wizard -> browse -> выбрать таблицу -> open -> все время next... -> finish
