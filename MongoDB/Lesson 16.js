// select column1, column2
// from table

// Проекция

// db.collection_name.find({Условие}, {проекция})

// Вывести только имена и фамилии работников, которым больше 30.
// Выводим _id, firstname, lastname
db.workers.find({age: {$gt: 30}}, {firstname: 1, lastname: 1})

// Выводим только firstname, lastname
db.workers.find({age: {$gt: 30}}, {firstname: 1, lastname: 1, _id: 0})

//Вывести только имена и фамилии работников
db.workers.find({}, {firstname: 1, lastname: 1, _id: 0})

// Вывести все поля кроме id и salary
db.workers.find({}, {_id: 0, salary: 0})

//Найти всех работников, чья зарплата меньше 3000 или возраст больше 40. Вывести все поля, кроме зарплаты

db.workers.find(
    {$or: [
        {salary: {$lt: 3000}},
        {age: {$gt: 40}}
    ]}, 
    {salary: 0})


//  Найти всех работников, чья зарплата больше 2000 и возраст больше 20. Вывести только имя, фамилию и зарплату, без _id.
db.workers.find({salary: {$gt: 2000}, age: {$gt: 20}}, {firstname: 1, lastname: 1, salary: 1, _id: 0})

// 1 и 0 можно заменить на true false

db.workers.find({salary: {$gt: 2000}, age: {$gt: 20}}, 
    {firstname: true, lastname: true, salary: true, _id: false})

// Пагинации

// limit(кол/во строк)
// skip(кол/во строк которое нужно пропустить)

// db.collection_name.find().limit()
// db.collection_name.find().skip()
// db.collection_name.find().skip().limit()
// db.collection_name.find().limit().skip()

// Вывести первого работника
db.workers.find().limit(1)

// Вывести всех работников пропуская первых двух
db.workers.find().skip(2)

// Вывести двух работников пропуская первого (2, 3)
db.workers.find().skip(1).limit(2)
db.workers.find().limit(2).skip(1)

// Найти сотрудников, которые зарабатывают больше 2000, вывести только первых двух.
db.workers.find({salary: {$gt: 2000}}).limit(2)

// Сортировка
// sort({column: 1(по возр.)/-1(по убыв.)})

// Вывести всех сотрудников и сортировать их по возрасту по убыванию
db.workers.find().sort({age: -1})

// Вывести самого молодого работника
db.workers.find().sort({age: 1}).limit(1)

// Вывести сотрудника с самой высокой зарплатой. Вывести только имя, фамилию и зарплату
db.workers.find({}, {firstname: 1, lastname: 1, salary: 1, _id: 0}).sort({salary: -1}).limit(1)

// Вывести трех сотрудников, которые зарабатывают меньше всего
db.workers.find().sort({salary: 1}).limit(3)


// Пагинация массива
// $slice: limit
// $slice: [skip, limit]

// Вывести только первый навык сотрудников
db.workers.find({}, {skills: {$slice: 1}})

// Вывести только второй навык сотрудников
db.workers.find({}, {skills: {$slice: [1, 1]}})

// Вывести только последний навык
db.workers.find({}, {skills: {$slice: -1}})

// Вывести первый навык у работника Boris
db.workers.find({firstname: 'Boris'}, {skills: {$slice: 1}})

// Вывести третий навык Марины
db.workers.find({firstname: 'Marina'}, {skills: {$slice: [2, 1]}})

// https://github.com/annykh/GenTech-171023/blob/main/MongoDB/restaurants.txt

db.restaurants.insertMany([
    {
      "name": "Restaurant 1",
      "cuisine": "Italian",
      "location": "New York",
      "menu": [
        { "name": "Pizza Margherita", "price": 12 },
        { "name": "Spaghetti Carbonara", "price": 15 },
        { "name": "Tiramisu", "price": 8 }
      ]
    },
    {
      "name": "Restaurant 2",
      "cuisine": "Mexican",
      "location": "Los Angeles",
      "menu": [
        { "name": "Tacos", "price": 10 },
        { "name": "Burritos", "price": 12 },
        { "name": "Guacamole", "price": 6 }
      ]
    },
    {
      "name": "Restaurant 3",
      "cuisine": "Japanese",
      "location": "Tokyo",
      "menu": [
        { "name": "Sushi", "price": 20 },
        { "name": "Ramen", "price": 15 },
        { "name": "Matcha Ice Cream", "price": 7 }
      ]
    }
  ])

//   location: 'Mexican'
//   'menu.price': 15

// Вывести рестораны, где цены меню выше 15.
db.restaurants.find({'menu.price': {$gt: 15}})

// Вывести рестораны, где цены меню не выше 6 долларов
db.restaurants.find({'menu.price': {$lte: 6}})

// Получить первые два ресторана.
db.restaurants.find().limit(2)

// Получить рестораны, пропустив первый, и орграничить выборку двумя ресторанами:
db.restaurants.find().skip(1).limit(2)

// Получить рестораны, где цены меню выше 10 долларов, и отсортировать их по названию в обратном порядке
db.restaurants.find({'menu.price': {$gt: 10}}).sort({name: -1})

// Получить рестораны с кухней "Italian" и вернуть первые два блюда из меню
db.restaurants.find({cuisine: 'Italian'}, {menu: {$slice: 2}})
