//
//  main.swift
//  2|_Нохрин Максим
//
//  Created by Maksim on 10/10/2019.
//  Copyright © 2019 Ololo. All rights reserved.
//

import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.

func checkNumber (number: Int64) -> Bool {
    if number % 2 == 0 {
        //print("Число \(number) четное")
        return true
    } else {
        return false
    }
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func checkNumberThreeDivision (number: Int64) -> Bool {
    if number % 3 == 0 {
        //print("Число \(number) делится на 3")
        return true
    } else {
        return false
    }
}

// 3. Создать возрастающий массив из 100 чисел.

var myArray = [Int64] (1...100)

print("В массиве \(myArray.count) символов")
print(myArray)

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var indexsToDelete: [Int] = []

for i in 0...myArray.count - 1 {
    
    if checkNumber(number: myArray[i]) || checkNumberThreeDivision(number: myArray[i]) {
        indexsToDelete.insert(i, at: 0)
    }
}

for i in indexsToDelete {
    
    myArray.remove(at: i)
}

print("После удаления в массиве \(myArray.count) символа")
print(myArray)


//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

func addFibonachiNumber (array: [Int64]) -> Int64 {
    var fibonachiNumber: Int64 = 0
    for i in array.count - 2...array.count - 1 {
        fibonachiNumber += array[i]
    }
    return fibonachiNumber
    
}


for _ in 0...79{ // Максимум можно добавить 80 элементов, если больше xCode выдает ошибку
    myArray.append(addFibonachiNumber(array: myArray))
}


print("Добавили числа Фибоначчи, в массиве \(myArray.count) символов")
print(myArray)

// 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

var simpleNumbers = [2, 3]

func getSimpleNumber () {
    var newNumber = simpleNumbers[simpleNumbers.count - 1] + 1

    var i = 0
    
    while i < simpleNumbers.count {
        
        if newNumber % simpleNumbers[i] != 0 {
            i += 1
        } else if newNumber % simpleNumbers[i] == 0 {
            newNumber += 1
            i = 0
        }
    }
        simpleNumbers.append(newNumber)
}

for _ in 3...100 {
    getSimpleNumber()
}

print("Массив простых чисел \(simpleNumbers)\nКоличество элементов в массиве \(simpleNumbers.count)")
