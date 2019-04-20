//
//  ViewController.swift
//  CalcNew
//
//  Created by yauheni prakapenka on 08/04/2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

// Не используется. Попытка вынести логику

import UIKit

// мозги не должны наследоваться от UIViewController
class CalculatorBrain: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var result = 0.0
    var value = 0.0
    var operation = "+"
    
    func calculate(result: Double, value: Double, operation: String) -> Double {
        // запоминаем операнд как предыдущий
        self.result = value
        
        self.value = value
        // запоминаем операцию как предыдущую
        self.operation = operation
        
        // равно не должно запоминаться, поскольку не сможем выполнить предыдущую операцию и получим зацикливания программы
        
        self.operation = operation
        
        switch operation {
        case "+":
            self.result = result + value
        case "-":
            self.result = result - value
        case "*":
            self.result = result * value
        case "/":
            guard value == 0 else {
                self.result = result / value
                return self.result
            }
            self.result = 6789
        case "=":
            // выполнить предыдущую операцию
            if operation == "+" {
                
            }
            
            // берем предыдущий операнд
            // берем предыдущую операцию
            // берем текущее значение result
            
            // принцип рекурсии
            self.result = calculate(result: result, value: value, operation: operation)
        default:
            self.result = 12345
        }
        return self.result
    }
    
    /// выполняем необходимую операцию
    /// используя сохраненные значения value, result
    func calculate(operation: String) -> Double {
        // необходимо запомнить операцию как предыдущую
        
        // выполняем необходимую операцию
        switch operation {
        case "+":
            self.result = result + value
        case "-":
            self.result = result - value
        case "*":
            self.result = result * value
        case "/":
            guard value == 0 else {
                self.result = result / value
                return self.result
            }
            self.result = 6789
        case "=":
            // выполнить предыдущую операцию
            // берем предыдущий операнд
            // берем предыдущую операцию
            // берем текущее значение result
            self.result = calculate(result: result, value: value, operation: operation)
        default:
            self.result = 12345
        }
        return self.result
    }
}

