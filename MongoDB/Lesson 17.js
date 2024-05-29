// Обновление данных

// replaceOne(filter, update, options)
// Если нам нужно полностью заменить один документ другим, используем replaceOne.

// options - upsert: true/false(по умолч.)
// Если true: то mongodb будет обновлять документ, если он найден, и созвадавть новый, если такого докумнета нет.
// Если false: не будет созвадавть новый документ, если запрос на выборку не найдет ни одного документа

db.workers.replaceOne({firstname: 'Inga'}, {firstname: 'Irina', lastname: 'Petrova', age: 30, position: 'Developer'})

db.workers.replaceOne({firstname: 'Inga'}, {firstname: 'Elena', lastname: 'Petrova', age: 25, position: 'Developer'})

db.workers.replaceOne({firstname: 'Inga'}, {firstname: 'Elena', lastname: 'Petrova', age: 25, position: 'Developer'}, {upsert: true})

// Полностью заменить документ, где имя ՛Ivan՛ на
// имя: ՛Den՛
// фамилия: ՛Jameson՛,
// возраст: 35,
// должность: 'HR'
// зарплата: 3000

db.workers.replaceOne({firstname: 'Ivan'}, {firstname: 'Den', lastname: 'Jameson', age: 35, position: 'HR', salary: 3000})


// updateOne/updateMany

// Чтобы не обновлять весь документ, а только значение одного или нескольких свойств используем updateOne/updateMany. Если нужно обновить только один документ(первый по выборке) используем updateOne, если несколько документов(все по выборке), то используем updateMany

// $set - если нужно обновить отдельное поле, или если обновляемого поля нет, то оно создается
// $inc - для увеличения значения числового поля на определенное кол/во единиц, если обновляемого поля нет, то оно создается
// $unset  - для удаления поля

db.workers.updateOne({filter}, {updated})

// Изменить должность на 'Sales manager' для сотрудника с именем Den и фамилией Jameson
db.workers.updateOne({firstname: 'Den', lastname: 'Jameson'}, {$set: {position: 'Sales manager'}})

// Добавить свойство department со значением Sales для сотрудника с именем Den и фамилией Jameson
db.workers.updateOne({firstname: 'Den', lastname: 'Jameson'}, {$set: {department: 'Sales'}})

// Увеличить зарплату сотрудника с именем Boris на 2000.
db.workers.updateOne({firstname: 'Boris'}, {$inc: {salary: 2000}})

// Уменьшить зарплату сотрудника с именем Marina на 500
db.workers.updateOne({firstname: 'Marina'}, {$inc: {salary: -500}})

// Удалить поле position для сотрудника с именем Olga
db.workers.updateOne({firstname: 'Olga'}, {$unset: {position: 1}})

// Удалить поля salary, skills для сотрудника Marina
db.workers.updateOne({firstname: 'Marina'}, {$unset: {salary: 1, skills: 1}})

// Удалить поле salaryдля сотрудника Marina
db.workers.updateOne({firstname: 'Marina'}, {$unset: {salary: 1}})

// Добавить новое поле commission со значением 0 для всех сотрудников.
db.workers.updateMany({}, {$set: {commission: 0}})

// Изменить значение commission на 10 для сотрудников с зарплатой выше 3000.
db.workers.updateMany({salary: {$gt: 3000}}, {$set: {commission: 10}})

// Увеличить зарплату на 1000 для сотрудников старше 30.
db.workers.updateMany({age: {$gt: 30}}, {$inc: {salary: 1000}})

// Удалить поле commission для всех сотрудников, кроме Ivan
db.workers.updateMany({firstname: {$ne: 'Ivan'}}, {$unset: {commission: 1}})



// Обновление массивов

// $push - добавить значение в массив 

// Добавить новый навык сотруднику Boris со значением team working
db.workers.updateOne({firstname: 'Boris'}, {$push: {skills: 'team working'}})

// db.workers.updateOne({firstname: 'Boris'}, {$push: {salary: 2000}})
// The field 'salary' must be an array but is of type int in document {_id: 2}

// $push + $each - можно добавить сразу несколько значений в массив

// Добавить новые навыки сотруднику Boris со значениями creativity, JavaScript
db.workers.updateOne({firstname: 'Boris'}, {$push: {skills: {$each: ['creativity', 'JavaScript']}}})

// Добавить новые навыки сотруднику Boris со значениями creativity, time managment
db.workers.updateOne({firstname: 'Boris'}, {$push: {skills: {$each: ['creativity', 'time managment']}}})

// $addToSet - Отличие от push в том, что addToSet добавляет данные, если их еще нет в массиве(через push данные дублируются)

// Добавить новые навыки сотруднику Boris со значениями creativity, time managment
db.workers.updateOne({firstname: 'Boris'}, {$addToSet: {skills: {$each: ['creativity', 'time managment']}}})


// $pop - позволяет удалить один эл. из массива либо первый, либо последний
// если значение 1 то удалет последний эл., если -1, то первый

// Удалить последний навык у Бориса
db.workers.updateOne({firstname: 'Boris'}, {$pop: {skills: 1}})

// Удалить первый навык у Бориса
db.workers.updateOne({firstname: 'Boris'}, {$pop: {skills: -1}})

// $pull - удаляет каждое вхождение эл. в массив (можно удалить только одно значение)

// Удалить навык JavaScript у Бориса
db.workers.updateOne({firstname: 'Boris'}, {$pull: {skills: 'JavaScript'}})

// $pullAll - удаляет несколько значений из массива

// Удалить навыки teamworking и creativity у Бориса
db.workers.updateOne({firstname: 'Boris'}, {$pullAll: {skills: ['team working', 'creativity']}})

// Создать коллекцию employees:
// https://github.com/annykh/GenTech-171023/blob/main/MongoDB/employees.txt

// Увеличить возраст сотрудника "Alice" на 1 год
db.employees.updateOne({name: 'Alice'}, {$inc: {age: 1}})

// Установить новый отдел(department) для сотрудника "Bob" на "Marketing"
db.employees.updateOne({name: 'Bob'}, {$set: {department: 'Marketing'}})

// Удалить навык(skills) "financial analysis" у сотрудника "Charlie":
db.employees.updateOne({name: 'Charlie'}, { $pull: {skills: 'financial analysis'}})

// Добавить новый проект "Project F" для всех сотрудников
db.employees.updateMany({}, {$addToSet: {projects: 'Project F'}})

// Добавить новый навык "leadership" для сотрудников из отдела "HR"
db.employees.updateMany({department: 'HR'}, {$addToSet: {skills: 'leadership'}})
