//
//  main.swift
//  5|_Нохрин Максим
//
//  Created by Maksim on 18/10/2019.
//  Copyright © 2019 Ololo. All rights reserved.
//

import Foundation

enum LocatorModes {
    case active
    case passive
}

protocol RadioDevice {
    var brand: String { get }
    var powerStatus: Bool { get set }
    var frequency: Int { get set }
    
    func action ()
}

extension RadioDevice {
    mutating func powerOn () {
        self.powerStatus = true
    }
    
    mutating func powerOff () {
        self.powerStatus = false
    }
    
    mutating func changeFrequency (newFrequency: Int) {
        self.frequency = newFrequency
    }
}

class Receiver: RadioDevice, CustomStringConvertible {
    var brand: String
    
    var powerStatus: Bool = false
        
    var frequency: Int
    
    var volume: Int = 50
    
    var chanel: Int = 1
    
    func action() {
        
    }
    
    func changeVolume (newValue: Int) {
        self.volume = newValue
    }
    
    func changeChanel (newValue: Int) {
        self.chanel = newValue
    }
    
    var description: String {
        return "Радиоприемник " + String(brand) + " работает на частоте " + String(frequency) + ". Установлена громкость на " + String(volume) + ". Активный канал " + String(chanel)
        
    }
    
    init (brand: String, frequency: Int) {
        self.brand = brand
        self.frequency = frequency
    }
}

class Locator: RadioDevice, CustomStringConvertible {
    var brand: String
        
    var powerStatus: Bool = false
      
    var frequency: Int
    
    var mode: String = "Актив"
    
    var radiationPower: Int = 100
    
    func action() {
        
    }
    
    func changeMode (newMode: LocatorModes) {
        switch newMode {
        case .active:
            self.mode = "Актив"
        case .passive:
            self.mode = "Пассив"
        }
    }
    
    func changeRadiationPower (newPower: Int) {
        self.radiationPower = newPower
    }
    
    var description: String {
        return "Локатор " + String(brand) + " работает на частоте " + String(frequency) + ". Установлен режим " + String(mode) + ". Мощность излучения " + String(radiationPower)
    }
    
    init (brand: String, frequency: Int) {
        self.brand = brand
        self.frequency = frequency
    }
    
}

var azumitReceiver = Receiver(brand: "Азимут", frequency: 5390)
var sonarLocator = Locator(brand: "Сонар", frequency: 300000)

sonarLocator.changeRadiationPower(newPower: 1000)
azumitReceiver.changeChanel(newValue: 2)
print(sonarLocator)
print(azumitReceiver)
