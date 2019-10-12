//
//  main.swift
//  3|_Нохрин Максим
//
//  Created by Maksim on 12/10/2019.
//  Copyright © 2019 Ololo. All rights reserved.
//

import Foundation

// 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

struct passengerCar {
    private var brand: String
    private var year: Int
    private var trunkCapacity: Int
    private var theEngineStarted: Bool
    private var theWindowsAreOpen: Bool
    private var filledTrunkVolume: Int
    
    var brandProperty: String {
        get {
            return brand
        }
        set {
            brand = newValue
        }
    }
    var yearProperty: Int {
           get {
               return year
           }
           set {
               year = newValue
           }
       }
    var trunkCapacityProperty: Int {
           get {
               return trunkCapacity
           }
           set {
               trunkCapacity = newValue
           }
       }
    var theEngineStartedProperty: Bool {
           get {
               return theEngineStarted
           }
           set {
               theEngineStarted = newValue
           }
       }
    var theWindowsAreOpenProperty: Bool {
           get {
               return theWindowsAreOpen
           }
           set {
               theWindowsAreOpen = newValue
           }
       }
    var filledTrunkVolumeProperty: Int {
           get {
               return filledTrunkVolume
           }
           set {
               filledTrunkVolume = newValue
           }
       }
    
    // 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    
    mutating func chanceValues (action: carActions){
        switch action {
        case .startEngine:
            if theEngineStarted == true {
                print("Двигатель \(brand) уже запущен")
            } else {
                theEngineStarted = true
                print("Двигатель \(brand) запущен")
            }
        case .stopEngine:
            if theEngineStarted == false {
                print("Двигатель \(brand) уже заглушен")
            } else {
                theEngineStarted = false
                print("Двигатель \(brand) заглушен")
            }
        case .openWinddows:
            if theWindowsAreOpen == true {
                print("Окна \(brand) уже открыты")
            } else {
                theWindowsAreOpen = true
                print("Окна \(brand) открыты")
            }
        case .closeWindows:
            if theWindowsAreOpen == false {
                print("Окна \(brand) уже закрыты")
            } else {
                theWindowsAreOpen = false
                print("Окна \(brand) закрыты")
            }
        case .loadTheCargoInTheTrunk(let value):
            if filledTrunkVolume + value > trunkCapacity {
                let restVolume = trunkCapacity - filledTrunkVolume
                print("Вы пытаетесь загрузить \(value) груза в багажник \(brand), но он переполнен, осталось \(restVolume)")
                filledTrunkVolume = trunkCapacity
                print("\(value - restVolume) не поместилось")
            } else if filledTrunkVolume + value == trunkCapacity {
                filledTrunkVolume = trunkCapacity
                print("Груз помещен в багажник \(brand). Багажник полностью заполнен")
            } else {
                filledTrunkVolume += value
                print("Груз помещен в багажник \(brand). Осталось объема \(trunkCapacity - filledTrunkVolume)")

            }
        case .unloadTheCargoInTheTrunk(let value):
            if filledTrunkVolume == 0 {
                print("В багажнике \(brand) нет груза")
            } else if filledTrunkVolume - value < 0 {
                filledTrunkVolume = 0
                print("Вы пытаетесь выгрузить больше груза, чем его существует в багажнике \(brand). Выгружено \(filledTrunkVolume). Багажник пуст")
            } else if filledTrunkVolume - value == 0 {
                print("Груз выгружен. Багажник \(brand) пуст")
            } else {
                filledTrunkVolume -= value
                print("Груз выгружен из багажника \(brand). Осталось груза \(filledTrunkVolume)")
            }
        }
    }
    
    init (brand: String, year: Int, trunkCapacity: Int) {
        self.brand = brand
        self.year = year
        self.trunkCapacity = trunkCapacity
        theEngineStarted = false
        theWindowsAreOpen = false
        filledTrunkVolume = 0
    }
}

struct cargoCar {
    private var brand: String
    private var year: Int
    private var trunkCapacity: Int
    private var theEngineStarted: Bool
    private var theWindowsAreOpen: Bool
    private var filledTrunkVolume: Int
    
    var brandProperty: String {
        get {
            return brand
        }
        set {
            brand = newValue
        }
    }
    var yearProperty: Int {
           get {
               return year
           }
           set {
               year = newValue
           }
       }
    var trunkCapacityProperty: Int {
           get {
               return trunkCapacity
           }
           set {
               trunkCapacity = newValue
           }
       }
    var theEngineStartedProperty: Bool {
           get {
               return theEngineStarted
           }
           set {
               theEngineStarted = newValue
           }
       }
    var theWindowsAreOpenProperty: Bool {
           get {
               return theWindowsAreOpen
           }
           set {
               theWindowsAreOpen = newValue
           }
       }
    var filledTrunkVolumeProperty: Int {
           get {
               return filledTrunkVolume
           }
           set {
               filledTrunkVolume = newValue
           }
       }
    
    mutating func chanceValues (action: carActions){
        switch action {
        case .startEngine:
            if theEngineStarted == true {
                print("Двигатель \(brand) уже запущен")
            } else {
                theEngineStarted = true
                print("Двигатель \(brand) запущен")
            }
        case .stopEngine:
            if theEngineStarted == false {
                print("Двигатель \(brand) уже заглушен")
            } else {
                theEngineStarted = false
                print("Двигатель \(brand) заглушен")
            }
        case .openWinddows:
            if theWindowsAreOpen == true {
                print("Окна \(brand) уже открыты")
            } else {
                theWindowsAreOpen = true
                print("Окна \(brand) открыты")
            }
        case .closeWindows:
            if theWindowsAreOpen == false {
                print("Окна \(brand) уже закрыты")
            } else {
                theWindowsAreOpen = false
                print("Окна \(brand) закрыты")
            }
        case .loadTheCargoInTheTrunk(let value):
            if filledTrunkVolume + value > trunkCapacity {
                let restVolume = trunkCapacity - filledTrunkVolume
                print("Вы пытаетесь загрузить \(value) груза в кузов \(brand), но он переполнен, осталось \(restVolume)")
                filledTrunkVolume = trunkCapacity
                print("\(value - restVolume) не поместилось")
            } else if filledTrunkVolume + value == trunkCapacity {
                filledTrunkVolume = trunkCapacity
                print("Груз помещен в кузов \(brand). Кузов полностью заполнен")
            } else {
                filledTrunkVolume += value
                print("Груз помещен в кузов \(brand). Осталось объема \(trunkCapacity - filledTrunkVolume)")

            }
        case .unloadTheCargoInTheTrunk(let value):
            if filledTrunkVolume == 0 {
                print("В кузове \(brand) нет груза")
            } else if filledTrunkVolume - value < 0 {
                filledTrunkVolume = 0
                print("Вы пытаетесь выгрузить больше груза, чем его существует в кузове \(brand). Выгружено \(filledTrunkVolume). Кузов пуст")
            } else if filledTrunkVolume - value == 0 {
                print("Груз выгружен. Кузов \(brand) пуст")
            } else {
                filledTrunkVolume -= value
                print("Груз выгружен из кузова \(brand). Осталось груза \(filledTrunkVolume)")
            }
        }
    }
    
    init (brand: String, year: Int, trunkCapacity: Int) {
        self.brand = brand
        self.year = year
        self.trunkCapacity = trunkCapacity
        theEngineStarted = false
        theWindowsAreOpen = false
        filledTrunkVolume = 0
    }
}

// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum carActions {
    case startEngine
    case stopEngine
    case openWinddows
    case closeWindows
    case loadTheCargoInTheTrunk(value: Int)
    case unloadTheCargoInTheTrunk(value: Int)
}

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

var fordCar = passengerCar(brand: "Ford", year: 2010, trunkCapacity: 50)
var uralCar = cargoCar(brand: "Ural", year: 2005, trunkCapacity: 200)

fordCar.chanceValues(action: .startEngine)
uralCar.chanceValues(action: .openWinddows)
uralCar.chanceValues(action: .loadTheCargoInTheTrunk(value: 500))
uralCar.chanceValues(action: .loadTheCargoInTheTrunk(value: 100))
uralCar.chanceValues(action: .unloadTheCargoInTheTrunk(value: 60))
fordCar.chanceValues(action: .stopEngine)
uralCar.chanceValues(action: .openWinddows)

// 6. Вывести значения свойств экземпляров в консоль.

print(fordCar.filledTrunkVolumeProperty)
print(uralCar.brandProperty)

