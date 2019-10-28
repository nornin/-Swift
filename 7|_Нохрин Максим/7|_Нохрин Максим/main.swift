//
//  main.swift
//  7|_Нохрин Максим
//
//  Created by Maksim on 27/10/2019.
//  Copyright © 2019 Ololo. All rights reserved.
//

import Foundation

enum PrinterError: Error {
    case tooHot
    case noPaper
    case noPaint
    case unknownError
}

class Printer {
    var paperCount = 3
    
    var temperature = 0
    
    var maxTemperature = 3
    
    var paintValue = 3
    
    var isPowerOn: Bool = false
    
    func printPicture (count: Int) throws {
        if paperCount == 0 {
            throw PrinterError.noPaper
        }
        
        if temperature == maxTemperature {
            throw PrinterError.tooHot
        }
        
        if paintValue == 0 {
            throw PrinterError.noPaint
        }
        
        if temperature + count <= maxTemperature && paperCount >= count && paintValue >= count {
            paintValue -= count
            paperCount -= count
            temperature += count
            
            print("Распечатано листов: \(count)")
        } else {
            throw PrinterError.unknownError
        }
    }
    
}

var canonPrinter = Printer()

do {
    try canonPrinter.printPicture(count: 2)
} catch PrinterError.noPaint {
    print("Закончилась краска")
} catch PrinterError.noPaper {
    print("Закончилась бумага")
} catch PrinterError.tooHot {
    print("Принтер перегрелся")
} catch {
    print("Неизвестная ошибка printPicture()")
}

do {
    try canonPrinter.printPicture(count: 2)
} catch PrinterError.noPaint {
    print("Закончилась краска")
} catch PrinterError.noPaper {
    print("Закончилась бумага")
} catch PrinterError.tooHot {
    print("Принтер перегрелся")
} catch {
    print("Неизвестная ошибка printPicture()")
}
