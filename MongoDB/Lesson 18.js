// Обновление данных 

// replaceOne
// updateOne
// udpateMany

// set
// unset
// inc

// push
// each
// addToSet
// pop
// pull
// pullAll


// Удалить навык "organization" у всех сотрудников в отделе "HR"
db.employees.updateMany({department: 'HR'}, {$pull: {skills: 'organization'}})

// Удалить проекты "Project D" и "Project G" у всех сотрудников
db.employees.updateMany({}, {$pullAll: {projects: ['Project D', 'Project G']}})

// Добавить новый проект "Project H" для всех сотрудников
db.employees.updateMany({}, {$addToSet: {projects: 'Project H'}})

// Увеличить возраст сотрудника "Van" на 3 года
db.employees.updateOne({name: 'Van'}, {$inc: {age: 3}})

// Добавить новые навыки "creativity" и 'UI design' для сотрудника "Maria"
db.employees.updateOne({name: 'Maria'}, {$addToSet: {skills: {$each: ['creativity', 'UI design']}}})

// Удалить навык "problem-solving" у всех сотрудников в отделе "IT"
db.employees.updateMany({department: 'IT'}, {$pull: {skills: 'problem-solving'}})

// Удалить все проекты у сотрудников в отделе "Finance"
db.employees.updateMany({department: 'Finance'}, {$set: {projects: []}})

// Удалить все навыки Maria
db.employees.updateOne({name: 'Maria'}, {$set: {skills: []}})


// Агрегации

// Количество элементов/документов в коллекции

// Общее кол/во документов в коллекции
db.employees.countDocuments()
db.employees.find().count()

// Кол/во работников из отдела Finance
db.employees.find({department: 'Finance'}).count()

// Кол/во работников из отдела Finance пропуская первого
db.employees.find({department: 'Finance'}).skip(1).count()

// true - 1
// false - 0

// Вывод уникальных значений

// Вывести список всех департаментов
db.employees.distinct('department')

// Вывести только имена и навыки всех сотрудников
db.employees.find({}, {_id: 0, name: 1, skills: 1})

// Вывести только имена сотрудников из отдела "HR"
db.employees.find({department: 'HR'}, {name: 1, _id: 0})

// Агрегация и группировка

// aggregate()

// $sum
// $avg
// $min
// $max

// $match - фильтрация
// $project - проекция, вывод конкретных полей
// $group - группировка
// $skip - пропустить документы
// $limit - ограничить кол/во кокументов
// $sort -  сортировка

// Вывести имя и зарплату сотрудников, где зарплата выше 2000 и сортировать по возр. зарплаты.
db.workers1.aggregate([
    {$match: {salary: {$gt: 2000}}},
    {$project: {_id: 0, firstname: 1, salary: 1}},
    {$sort: {salary: 1}}
])


// Найти сотрудника с макс. зарплатой, вывести имя и зарплату.
db.workers1.aggregate([
    {$project: {_id: 0, firstname: 1, salary: 1}},
    {$sort: {salary: -1}},
    {$limit: 1}
])

// Найти сумму зарплаты всех сотрудников.
db.workers1.aggregate([
    {$group: {_id: null, total_sum: {$sum: '$salary'}}}
])

// Найти сумму зарплат сотрудников и сгруппировать по position
db.workers1.aggregate([
    {$group: {_id: '$position', total_salary: {$sum: '$salary'}}}
])

// Вывести сумму зарплат сотрудников с должностью Server
db.workers1.aggregate([
    {$match: {position: 'Server'}},
    {$group: {_id: '$position', total_salary: {$sum: '$salary'}}}
])

// Найти сумму зарплат сотрудников, сгруппировать по position и сортировать по убыв. суммы.
db.workers1.aggregate([
    {$group: {_id: '$position', total_salary: {$sum: '$salary'}}},
    {$sort: {total_salary: -1}}
])

// Найти среднее значение поля salary
db.workers1.aggregate([
    {$group: {_id: null, avg_salary: {$avg: '$salary'}}}
])

// Найти среднее значение поля salary, если среднее значение больше 0.
db.workers1.aggregate([
    {$group: {_id: null, avg_salary: {$avg: '$salary'}}},
    {$match: {avg_salary: {$gt: 0}}}
])

// https://github.com/annykh/GenTech-171023/blob/main/MongoDB/employees1.txt

// Найти среднюю зарплату среди среди сотрудников из отдела IT.
db.employees1.aggregate([
    {$match: {department: 'IT'}},
    {$group: {_id: '$department', avg_salary: {$avg: '$salary'}}}
])

db.employees1.aggregate([
    {$match: {department: 'IT'}},
    {$group: {_id: null, avg_salary: {$avg: '$salary'}}}
])

// Найти среднее значение salary по департаментам для сотрудников старше 40
db.employees1.aggregate([
    {$match: {age: {$gt: 40}}},
    {$group: {_id: '$department', avg_salary: {$avg: '$salary'}}}
])


