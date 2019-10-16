//
//  main.swift
//  4|_Нохрин Максим
//
//  Created by Maksim on 16/10/2019.
//  Copyright © 2019 Ololo. All rights reserved.
//

import Foundation

enum ComputerActions {
    case start
    case stop
    case typeText(text: String)
    case startGame(game: String)
    case none
}

enum NotebookActions {
    case charge
    case openCover
    case closeCover
}

enum DesktopActions {
    case changeMonitor(newSize: Int)
    case changeVideocard(newCard: String)
    case clean
}

class Computer {
    private var coreNumber: Int
    private var hardDriveValue: Int
    private var ramValue: Int
    private var processorFrequency: Int
    private var isStarted: Bool = false
    private var typedText: String = ""
    private var gameStarted: String = ""
    
    var coreNumberProperty: Int {
        get {
            return coreNumber
        }
        set {
            coreNumber = newValue
        }
    }
    var hardDriveValueProperty: Int {
           get {
               return hardDriveValue
           }
           set {
           hardDriveValue = newValue
           }
       }
    var ramValueProperty: Int {
           get {
               return ramValue
           }
           set {
               ramValue = newValue
           }
       }
    var processorFrequencyProperty: Int {
           get {
               return processorFrequency
           }
           set {
               processorFrequency = newValue
           }
       }
    var isStartedProperty: Bool {
           get {
               return isStarted
           }
           set {
               isStarted = newValue
           }
       }
    var typedTextProperty: String {
           get {
               return typedText
           }
           set {
               typedText = newValue
           }
       }
    var gameStartedProperty: String {
           get {
               return gameStarted
           }
           set {
               gameStarted = newValue
           }
       }
    
    func action (action: ComputerActions) {
        switch action {
        case .start:
            self.isStarted = true
        case .stop:
            self.isStarted = false
        case .typeText(let text):
            self.typedText = text
        case .startGame(let game):
            self.gameStarted = game
        case .none:
            break
        }
    }
    
    init (coreNumber: Int, hardDriveValue: Int, ramvalue: Int, processorFrequency: Int) {
        self.coreNumber = coreNumber
        self.hardDriveValue = hardDriveValue
        self.ramValue = ramvalue
        self.processorFrequency = processorFrequency
    }
}

class Notebook: Computer {
    var battery: Int
    let displaySize: Int
    let isUltrabook: Bool
    var isCharged: Bool = false
    var isCoverOpen: Bool = false
    
    init (coreNumber: Int, hardDriveValue: Int, ramvalue: Int, processorFrequency: Int,  battery: Int, displaySize: Int, isUltrabook: Bool) {
        self.battery = battery
        self.displaySize = displaySize
        self.isUltrabook = isUltrabook
        super.init(coreNumber: coreNumber, hardDriveValue: hardDriveValue, ramvalue: ramvalue, processorFrequency: processorFrequency)
        
    }
    
    func action(action: ComputerActions, actionNotebook: NotebookActions) {
        switch action {
        case .start:
            self.isStartedProperty = true
        case .stop:
            self.isStartedProperty = false
        case .typeText(let text):
            self.typedTextProperty = text
        case .startGame(let game):
            self.gameStartedProperty = game
        case .none:
            break
        }
        
        switch actionNotebook {
        case .charge:
            self.isCharged = true
        case .openCover:
            self.isCoverOpen = true
        case .closeCover:
            self.isCoverOpen = false
        }
    }
}

class Desktop: Computer {
    var monitorSize: Int
    var isMonoblock: Bool
    var isServer: Bool
    var videocard: String = "GTX 1050"
    
    func action(action: ComputerActions, actionDesktop: DesktopActions) {
        switch action {
        case .start:
            self.isStartedProperty = true
        case .stop:
            self.isStartedProperty = false
        case .typeText(let text):
            self.typedTextProperty = text
        case .startGame(let game):
            self.gameStartedProperty = game
        case .none:
            break
        }
        
        switch actionDesktop {
        case .changeMonitor(let newSize):
            self.monitorSize = newSize
        case .changeVideocard(let newCard):
            self.videocard = newCard
        case .clean:
            print("Компьютер очищен")
        }
    }
    
    init (coreNumber: Int, hardDriveValue: Int, ramvalue: Int, processorFrequency: Int, monitorSize: Int, isMonoblock: Bool, isServer: Bool) {
        self.monitorSize = monitorSize
        self.isMonoblock = isMonoblock
        self.isServer = isServer
        super.init(coreNumber: coreNumber, hardDriveValue: hardDriveValue, ramvalue: ramvalue, processorFrequency: processorFrequency)
    }
}

var dellNotebook = Notebook(coreNumber: 8, hardDriveValue: 100, ramvalue: 16, processorFrequency: 4, battery: 10000, displaySize: 15, isUltrabook: true)

var homeDesktop = Desktop(coreNumber: 8, hardDriveValue: 500, ramvalue: 16, processorFrequency: 4, monitorSize: 24, isMonoblock: false, isServer: false)

print(dellNotebook.gameStartedProperty)
dellNotebook.action(action: .startGame(game: "Косынка"), actionNotebook: .charge)
print(dellNotebook.gameStartedProperty)

homeDesktop.action(action: .typeText(text: "Яблоко"), actionDesktop: .clean)
print(homeDesktop.typedTextProperty)
print(homeDesktop.monitorSize)
homeDesktop.action(action: .none, actionDesktop: .changeMonitor(newSize: 27))
print(homeDesktop.monitorSize)
