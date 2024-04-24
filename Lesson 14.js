// MongoDB

// cls - Очищает скрипт/консоль
// use - команда для создания БД или для того чтоб переключиться между бд 
// show collections - Показывает все коллекции в БД
// show databases - Показывает все БД
// db.createCollection() - Создаем пустую коллекцию
// db.collection_name.insertOne() - Вставляет один объект в коллекцию
// db.collection_name.insertMany() - Вставляет несколько объектов в коллекцию. Добавляем через массив из обьектов.
// db.collection_name.find() - Select * from ... Выводим все данные из коллекции
// db.collection_name.deleteOne({Условие}) - удалит первую запись соответсувующий запросу
// db.collection_name.deleteMany({Условие}) - удалит все записи соответсувующие запросу
// db.collection_name.drop() - Удалит коллекцию
// db.dropDatabase() - Удалит бд


use GT171023

db.createCollection('user')


db.user.insertOne({
    name: 'John',
    lastName: 'Smith',
    age: 18,
    address: {
            building: 1,
            street: 'Burbank 12/34'
        }
    })

db.user.insertMany([
  {
			name: 'Bob',
			lastName: 'Brown',
			age: 20,
			address: {
					building: 2,
					street: 'Burbank 12/35'
				}
	},
  {
			name: 'Lily',
			lastName: 'Hardy',
			age: 34
	},
  {
			name: 'James',
			lastName: 'Smith',
			age: 20
	}
])


db.user.insertMany([
    {
              name: 'Bob',
              lastName: 'Brown',
              age: 20,
              address: {
                      building: 2,
                      street: 'Burbank 12/35'
                  }
      },
    {
              name: 'Lily',
              lastName: 'Hardy',
              age: 34
      },
    {
              name: 'James',
              lastName: 'Smith',
              age: 20
    }
  ])


  db.user.insertMany([
    {
              _id: 5,
              name: 'Tom',
              lastName: 'Jameson'
      },
    {
              _id: 6,
              name: 'Jack',
              lastName: 'Watson',
              age: 26
      }
  ])
  
// Создать коллекцию fruits и заполнить документами со следующими свойствами: 
// _id, title, price, count. Используйте следующие данные:
	
// 1 Apple 280 4
// 2 Lemon 300 8
// 3 Lime 500 3
// 4 Orange 200 8

db.fruits.insertMany([
    {
          _id: 1,
          title: 'Apple',
          price: 280,
          count: 4
      },
    {
          _id: 2,
          title: 'Lemon',
          price: 300,
          count: 8
  },
  {
          _id: 3,
          title: 'Lime',
          price: 500,
          count: 3
  },
  {
          _id: 4,
          title: 'Orange',
          price: 200,
          count: 8
  }
  ])


db.user.deleteOne({name: 'Bob'})
db.user.deleteMany({lastName: 'Smith'})

db.user.drop() //- Удаляет коллекцию
db.dropDatabase() //- Удаляет бд
