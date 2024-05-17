// use database_name
// db.createCollection()
// db.collection_name.insertOne({})
// db.collection_name.insertMany([{},{}])
// db.collection_name.deleteOne({Условие})
// db.collection_name.deleteMany({Условие})
// db.collection_name.drop()
// db.dropDatabase()

// Операторы сравнения

// $eq : значения равны - equal
// $ne : значения не равны - not equal
// $gt : значение больше другого значения - greater than
// $gte : значение больше или равно другому значению - greater than equal
// $lt : значение меньше другого значения - less than
// $lte : значение меньше или равно другому значению - less than equal
// $in : значение соответствует одному из значений в массиве 

// Логические операторы

// $and : возвращает документы, в которых выполняются оба условия
// $or : возвращает документы, в которых выполняется хотя бы одно условие
// $nor : возвращает документы, в которых оба условия не выполняются
// $not : возвращает документы, в которых условие не выполняется


// 1. В бд GT171023 создать коллекцию students и заполнить информацией о студенте.

// firstName - "Alice",
// lastName - "Johnson",
// age - 20,
// course - "Computer Science",
// subjects - ["Math", "Physics", "Programming"],
// averageGrade - 85

db.students.insertOne({
    firstName: "Alice",
    lastName: "Johnson",
    age: 20,
    course: "Computer Science",
    subjects: ["Math", "Physics", "Programming"],
    averageGrade: 85
})


// 2. Изпользуя скрипт заполнить коллекцию данными об остальных студентах.
// https://github.com/annykh/GenTech-171023/blob/main/MongoDB/students.txt
db.students.insertMany([
    {
      firstName: "Bob",
      lastName: "Smith",
      age: 22,
      course: "Mathematics",
      subjects: ["Calculus", "Algebra", "Statistics"],
      averageGrade: 90
    },
    {
      firstName: "Charlie",
      lastName: "Brown",
      age: 21,
      course: "Physics",
      subjects: ["Quantum Mechanics", "Thermodynamics", "Optics"],
      averageGrade: 78
    },
    {
      firstName: "David",
      lastName: "Williams",
      age: 23,
      course: "Chemistry",
      subjects: ["Organic Chemistry", "Inorganic Chemistry", "Biochemistry"],
      averageGrade: 82
    },
    {
      firstName: "Eva",
      lastName: "Davis",
      age: 19,
      course: "Biology",
      subjects: ["Genetics", "Microbiology", "Ecology"],
      averageGrade: 88
    },
    {
      firstName: "Frank",
      lastName: "Miller",
      age: 24,
      course: "Engineering",
      subjects: ["Mechanics", "Electronics", "Material Science"],
      averageGrade: 92
    },
    {
      firstName: "Grace",
      lastName: "Wilson",
      age: 20,
      course: "Medicine",
      subjects: ["Anatomy", "Physiology", "Pathology"],
      averageGrade: 87
    },
    {
      firstName: "Henry",
      lastName: "Moore",
      age: 21,
      course: "Economics",
      subjects: ["Microeconomics", "Macroeconomics", "Econometrics"],
      averageGrade: 80
    },
    {
      firstName: "Isabella",
      lastName: "Taylor",
      age: 22,
      course: "Law",
      subjects: ["Criminal Law", "Civil Law", "International Law"],
      averageGrade: 86
    },
    {
      firstName: "Jack",
      lastName: "Anderson",
      age: 23,
      course: "Philosophy",
      subjects: ["Ethics", "Metaphysics", "Logic"],
      averageGrade: 89
    }
  ])



// 3. Найти всех студентов, чей курс равен "Mathematics".
db.students.find({course: 'Mathematics'})

// 4. Найти всех студентов, чей курс не равен "Physics".
db.students.find({course: {$ne: 'Physics'}})
db.students.find({course: {$not: {$eq: 'Physics'}}})

// 5. Найти всех студентов, чья средняя оценка больше 85.
db.students.find({averageGrade: {$gt: 85}})

// 6. Найти всех студентов, чья средняя оценка больше или равна 90.
db.students.find({averageGrade: {$gte: 90}})

// 7.Найти всех студентов, чей возраст меньше 21 года.
db.students.find({age: {$lt: 21}})


// 8. Найти всех студентов, чей возраст меньше или равен 22 годам.
db.students.find({age: {$lte: 22}})

// 9. Найти всех студентов, чей курс соответствует одному из значений в массиве ["Engineering", "Law"].
db.students.find({course: {$in: ['Engineering', 'Law']}})

// 10. Найти всех студентов, чья средняя оценка больше 80 и возраст меньше 23.
db.students.find({averageGrade: {$gt: 80}, age: {$lt: 23}})

// 11. Найти всех студентов, чей возраст меньше 20 или средняя оценка больше 90.
db.students.find({
	$or: [
    		{age: {$lt: 20}},
    		{averageGrade: {$gt: 90}}
		]
})
// 12. Найти всех студентов, у которых нет курсов "Computer Science" и "Law".
db.students.find({course: { $nin: ["Computer Science", "Law"]}})
