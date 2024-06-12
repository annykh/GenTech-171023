// https://skilldesk.starta.university/general-tech-final-test


// MongoDB

// Создание и использование бд
// use db_name;

// Создание коллекции
createCollection()

// Создание и заполнение коллекции
collection_name.insertOne()
collection_name.insertMany()

// Удаление документов
collection_name.deleteOne({Условие})
collection_name.deleteMany({Условие})

// Удаление коллекци
collection_name.drop()

// Удаление бд
db.dropDatabase()

// Выборка
collection_name.find({Условие}, {Проекция})

// Операторы сравнения:

// $eq - = equal
// $ne - != not equal
// $gt - > greater then
// $lt - < less then
// $lte - <= less than/equal
// $gte - >= greater than/equal 
// $in - проверка IN со списком


// Логические операторы

//  $and - and, и .., и...
//  $or - or, или..., или..
//  $not - not, не..
//  $nor - nor, не (и.. , и...) 


// Пагинация и сортировка
// .limit(N) //Ограничение кол/во записей 
// .skip(N) //Кол/во записей которое нужно пропустить
// .sort(-1/1) //Сортировка (1 - по возр. -1 - по убыв.)
// slice: limit, slice: [skip, limit] //Пагинация массива

// Обновление данных 

// .replaceOne - Заменяет весь документ другим 
// .updateOne - Обновляем записи документа
// .updateMany - Обновляем записи документов
// $set - обновляем поле/создаем
// $inc - увеличивает/уменьшает значение числового поля
// $unset - удаляет поле

// $push - добавить значение в массив
// $each - добавить несколько значений в массив
// $addToSet - добавить значение в массив(если их нет)
// $pull - удаляет элемент из массива
// $pullAll - удаляет несколько элементов из массива
// $pop - удаляет первое или последнее значение массива

// Агрегации

// find().count() - кол/во документов

// aggregate()

// $sum - найти сумму поля
// $avg - найти среднее значение поля
// $min - найти минимальное значение поля
// $max - найти максимальное значение поля

// $project - выбырает указанные поля из коллекции
// $match - выполняет фильтрацию
// $group - группировка, агрегирование
// $sort - сортирует документ
// $skip - пропустить документы
// $limit - ограничить кол/во дукументов

// ПРАКТИКА

// 1. Создать пустую коллекцию orders

db.createCollection('orders')

// 2. Заполнить коллекцию
// https://github.com/annykh/GenTech-220823/blob/main/orders.txt

// 3. Найти все заказы, где общая сумма больше 1000.
db.orders.find({totalAmount: {$gt: 1000}})

// 4. Найти заказы, сделанные клиентом по имени "Mia".
db.orders.find({customerFirstName: 'Mia'})

// 5. Найти первые 5 заказов, отсортированные по дате заказа по убыванию.
db.orders.find().sort({orderDate: -1}).limit(5)

// 6. Найти заказы, где сумма заказа находится в диапазоне от 100 до 500, отсортировать их по возрастанию суммы и пропустить первую запись.
db.orders.find({totalAmount: {$gt: 100,  $lt: 500}}).sort({totalAmount: 1}).skip(1)

// 7. Изменить статус заказа с orderId 2 на "shipped".
db.orders.updateOne({orderId: 2}, {$set: {status: 'shipped'}})

// 8. Найдите общее количество заказов.
db.orders.countDocuments()
db.orders.find().count()

// 9. Используя агрегацию, найдите среднee значение общей суммы заказов.
db.orders.aggregate([
    {$group: {_id: null, avgTotal: {$avg: '$totalAmount'}}}
])



// MYSQL

// CRUD

// Create - create database, create table
// Read - select.. from (where(>, <, >=, <=, =, !=, in, between, like, and, or), limit, order by, joins, group, having)
// Update - alter table(add, drop, change, rename, modify), update ... set
// Delete - drop database, drop table, delete from..


// use gt171023;

// -- Вывести имена, фамилии и зарплаты сотр. с зарплатой выше 10000
// select first_name, last_name, salary
// from employees
// where salary > 10000;

// -- Вывести кол/во сотрудников в каждом департаменте
// select department_id, count(*) as emp_count
// from employees
// where department_id is not null
// group by department_id;

// -- Вывести департаменты в которых работают больше 10 сотр.
// select department_id, count(*) as emp_count
// from employees
// where department_id is not null
// group by department_id
// having emp_count > 10;

// select * from goods1;

// -- Изменить тип quantity на numeric(4, 2)
// alter table goods1
// modify quantity numeric(4, 2);

// select distinct department_id
// from employees;
