// use database_name
// db.createCollection()
// db.collection_name.insertOne({})
// db.collection_name.insertMany([{},{}])
// db.collection_name.deleteOne({Условие})
// db.collection_name.deleteMany({Условие})
// db.collection_name.drop()
// db.dropDatabase()


// use GT171023

// 1. Создать коллекцию workers.

// 2. Заполнить коллекцию workers 5 документами со свойствами _id, firstname, lastname, age, position, salary, skills. Используйте следующие данные:

    // 1. Inga Petrova, 27, Barista, 1500, [’preparing drinks’, ‘cleaning equipment’] 
    // 2. Boris Orlov, 36, Server, 2400, [’taking orders’, ‘suggesting meals’, ‘taking payments’]
    // 3. Ivan Demidov, 32, Chef, 3200, [’preparing food’, ‘baking bread’]
    // 4. Marina Sidorova, 22, Hostess, 1700, [’greeting guests’, ‘seating guests’, ‘answering phone calls’]
    // 5. Olga Ivanova, 43, Sommelier, 2500, [’curating a wine list’, ‘creating wine pairings’]

    db.workers.insertMany([
        {
          _id: 1,
          firstname: 'Inga',
          lastname: 'Petrova',
          age: 27,
          position: 'Barista',
          salary: 1500,
          skills: ['preparing drinks', 'cleaning equipment']
        },
        {
          _id: 2,
          firstname: 'Boris',
          lastname: 'Orlov',
          age: 36,
          position: 'Server',
          salary: 2400,
          skills: ['taking orders', 'suggesting meals', 'taking payments']
        },
        {
          _id: 3,
          firstname: 'Ivan',
          lastname: 'Demidov',
          age: 32,
          position: 'Chef',
          salary: 3200,
          skills: ['preparing food', 'baking bread']
        },
        {
          _id: 4,
          firstname: 'Marina',
          lastname: 'Sidorov',
          age: 22,
          position: 'Hostess',
          salary: 1700,
          skills: ['greeting guests', 'seating guests', 'answering phone calls']
        },
        {
          _id: 5,
          firstname: 'Olga',
          lastname: 'Ivanova',
          age: 43,
          position: 'Sommelier',
          salary: 2500,
          skills: ['curating a wine list', 'creating wine pairings']
        }
      ])

// select * from table_name;
db.workers.find() //чтобы извлечь все документы из коллекции

// db.workers.find({Условие})
db.workers.find({firstname: 'Olga'}) // вывести сотрудника с именем Ольга


// Операторы сравнения

// $eq : значения равны - equal
// $ne : значения не равны - not equal
// $gt : значение больше другого значения - greater than
// $gte : значение больше или равно другому значению - greater than equal
// $lt : значение меньше другого значения - less than
// $lte : значение меньше или равно другому значению - les than equal
// $in : значение соответствует одному из значений в массиве 

// Логические операторы

// $and : возвращает документы, в которых выполняются оба условия
// $or : возвращает документы, в которых выполняется хотя бы одно условие
// $nor : возвращает документы, в которых оба условия не выполняются
// $not : возвращает документы, в которых условие не выполняется

// Найти работников, чьи зарпалты больше 2000.
db.workers.find({salary: {$gt: 2000}})

// Найти работников младше 30 лет.
db.workers.find({age: {$lt: 30}})

// Найти работников, чьи возрасты находятся в диапазоне от 30 до 45(вкл. концы).

db.workers.find(
    {
        $and: [
            {age: {$gte: 30}},
            {age: {$lte: 45}}
        ]
    }
)

db.workers.find({age: {$gte: 30, $lte: 45}})

// Найти работников, чьи зарплаты находятся в диапазоне от 2000(не вкл.) до 3000(вкл.).

db.workers.find({salary: {$gt: 2000, $lte: 3000}})

// Найти работников, чьи зарплаты либо меньше 2000, либо больше 3000(концы не вкл.).

db.workers.find(
    {
        $or: [
            {salary: {$lt: 2000}},
            {salary: {$gt: 3000}}
        ]
    }
)

// Не находится в диапазоне 2000-3000.

db.workers.find(
    {
        salary: {$not: {$gte: 2000, $lte: 3000}}
    }
)

// Найти работников, которым либо больше 35, либо меньше 25.
db.workers.find(
    {
        $or: [
            {age: {$gt: 35}},
            {age: {$lt: 25}}
        ]
    }
)

// not 25-35

db.workers.find({age: {$not: {$gte: 25, $lte: 35}}})

// select * from table
// where position in [...]

// Найти всех работников, у которых должность "Server" или "Chef"

db.workers.find({
    $or: [
        {position: 'Server'},
        {position: 'Chef'}
    ]
})

db.workers.find({position: {$in: ['Server', 'Chef']}})


// Найти всех работников, чьи навыки включают 'baking bread' 
db.workers.find({skills: 'baking bread'})
db.workers.find({skills: {$eq: 'baking bread'}})
db.workers.find({skills: {$in: ['baking bread']}})

// Найти всех работников, чьи навыки равняются(строго) ['preparing food', 'baking bread'] 
db.workers.find({skills: ['preparing food', 'baking bread']})

db.workers.find({skills: ['baking bread', 'preparing food']})
// пустая выборка

// Найти всех работников, чьи навыки не включают "baking bread".
db.workers.find({skills: {$not: {$eq: 'baking bread'}}})
db.workers.find({skills: {$ne: 'baking bread'}})

// Найти всех работников, чья зарплата меньше 2000 и чьи навыки включают "greeting guests".
db.workers.find({
    $and: [
        {salary: {$lt: 2000}},
        {skills: 'greeting guests'}
    ]
})

db.workers.find({salary: {$lt: 2000}, skills: 'greeting guests'})

// find({условие1, условие2})

// Найти всех работников, чья зарплата меньше 3000 или возраст больше 40.

db.workers.find({
    $or: [
        {salary: {$lt: 3000}},
        {age: {$gt: 40}}
    ]
})

// Создать коллекцию users  и заполнить документами со следующими свойствами: _id, firstname, lastname, age, gender. Используйте следующие данные:

// 1 Анатолий Ушанов 28 m
// 2 Светлана Демидова 25 f
// 3 Никита Иванов 33 m
// 4 Ольга Петрова 22 f

db.users.insertMany([
    {
        _id: 1,
        firstname: 'Анатолий',
        lastname: 'Ушанов',
        age: 28,
        gender: 'm'
    },
    {
        _id: 2,
        firstname: 'Светлана',
        lastname: 'Демидова',
        age: 25,
        gender: 'f'
    },
    {
        _id: 3,
        firstname: 'Никита',
        lastname: 'Иванов',
        age: 3,
        gender: 'm'
    },
    {
        _id: 4,
        firstname: 'Ольга',
        lastname: 'Петрова',
        age: 22,
        gender: 'f'
    }
])

db.users.find()

// Вывести данные о всех представительницах женского пола
db.users.find({gender: 'f'})

// Вывести всех пользователей, у которых имя входит в список (Анатолий, Дмитрий, Ольга, Семен)
db.users.find({firstname: {$in: ['Анатолий', 'Дмитрий', 'Ольга', 'Семен']}})

// Найти пользователей, которым больше 20, либо у которых имя в списке ['Анатолий', 'Семен']
db.users.find({
    $or: [
        {age: {$gt: 20}},
        {firstname: {$in: ['Анатолий', 'Семен']}}
    ]
})

// Вывести данные о всех представительницах женского пола и людях старше 30 лет(или..или)
db.users.find({
    $or: [
        {gender: 'f'},
        {age: {$gt: 30}}
    ]
})
