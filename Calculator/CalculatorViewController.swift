//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by yauheni prakapenka on 12/02/2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var operand: String = "+"
    var summary: Double = 0
    var value: Double = 0
    var oldValue: Double = 0 // для нажатия двух и более раз подряд "равно"
    var result: Double = 0
    var oldResult: Double = 0 // для нажатия двух и более раз подряд "равно"
    var operationDidTap: Bool = false
    var firstEquel: Bool = true
    var firstValue = true
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var devideOnZeroImageView: UIImageView!
    
    @IBAction func digitButtonDidTap(_ sender: UIButton) {
        showDisplayLable()
        
        if displayLabel.text!.count > 8  {
            
            self.validationLabel.text = "Невозможно ввести больше 9 цифр"
            self.validationLabel.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            
            _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
                self.validationLabel.text = ""
            })
            
            return
        }
        
        if displayLabel.text!.contains("0") && displayLabel.text!.count == 1 {
            displayLabel.text = String(sender.tag) == "0" ? "0" : String(sender.tag)
        } else if operationDidTap == true {
            //Стирает число на экране и вводит новое, запомнив его
            displayLabel.text?.removeAll()
            displayLabel.text = displayLabel.text! + String(sender.tag)
            value = Double(displayLabel.text!)!
            oldValue = Double(displayLabel.text!)!
            operationDidTap = false
        } else {
            displayLabel.text = displayLabel.text! + String(sender.tag)
            value = Double(displayLabel.text!)!
        }
        hideDevideOnZeroImageView()
    }
    
    @IBAction func dotButtonDidTap(_ sender: UIButton) {
        if let text = displayLabel.text, !text.contains(".") {
            displayLabel.text = text + "."
        }
    }
    
    // FIXME: - Нажать 5, -, 1, плюс минус, =, неверный ответ "-1"
    @IBAction func plusMinusButtonDidTap(_ sender: UIButton) {
        hideAndShowDisplayLable()
        hideDevideOnZeroImageView()
        if Double(displayLabel.text!)! != 0 {
            if let text = displayLabel.text, !text.contains(String("-")) {
                displayLabel.text = "-" + displayLabel.text!
            } else {
                displayLabel.text?.removeFirst()
            }
        } else {
            displayLabel.text = displayLabel.text!
        }
    }
    
    @IBAction func clearButtonDidTap(_ sender: UIButton) {
        hideAndShowDisplayLable()
        hideDevideOnZeroImageView()
        displayLabel.text = "0"
        operand = "+"
        result = 0
        oldResult = 0
        value = 0
        oldValue = 0
        summary = 0
        firstEquel = true
        firstValue = true
        operationDidTap = false
    }
    
    @IBAction func removeButtonTapped(_ sender: UIButton) {
        guard displayLabel.text!.count > 1 else {
            displayLabel.text = "0"
            return
        }
        
        if displayLabel.text!.count < 10 {
            self.validationLabel.text = ""
        }
        
        displayLabel.text?.removeLast()
    }
    
    @IBAction func handleSwipeRecognizer(_ sender: UISwipeGestureRecognizer) {
        guard displayLabel.text!.count > 1 else {
            displayLabel.text = "0"
            return
        }
        displayLabel.text?.removeLast()
    }
    
    // tag 10 is "."   tag 13 is "-"   tag 16 is "C"
    // tag 11 is "="   tag 14 is "*"
    // tag 12 is "+"   tag 15 is "÷"
    
    @IBAction func equelButtonDidTap(_ sender: Any) {
        hideAndShowDisplayLable()
        if operand == "/" && value == 0 { // Анимация деления на ноль
            showDevideOnZeroImageView()
            hideDisplayLable()

        } else if firstEquel == true {
            calculate(result: result, value: value, operand: operand)
            oldResult = Double(displayLabel.text!)!
            firstEquel = false
        } else {
            calculate(result: oldResult, value: oldValue, operand: operand)
            oldResult = Double(displayLabel.text!)!
            firstEquel = false
        }
    }
    
    @IBAction func operationButtonDidTap(_ sender: UIButton) {
        hideAndShowDisplayLable()

        if sender.tag == 12 { //+
            if value == 0 && result == 0 { // Костыль, если "1 +" то, при нажатии плюса на экране отображался 0
                displayLabel.text = displayLabel.text!
            } else {
            calculate(result: result, value: value, operand: operand)
            }
            
            operand = "+"
            result = Double(displayLabel.text!)!
        
        } else if sender.tag == 13 { //-
            if value == 0 && result == 0 {
                displayLabel.text = displayLabel.text!
            } else if firstValue == true {
                displayLabel.text = displayLabel.text!
            } else {
            calculate(result: result, value: value, operand: operand)
            }
            
            operand = "-"
            result = Double(displayLabel.text!)!
            
        } else if sender.tag == 14 { //*
            calculate(result: result, value: value, operand: operand)
            if value == 0 && result == 0 {
                displayLabel.text = displayLabel.text!
            } else {
                calculate(result: result, value: value, operand: operand)
            }
            
            operand = "*"
            result = Double(displayLabel.text!)!
            
        } else if sender.tag == 15 { //÷
            calculate(result: result, value: value, operand: operand)
            if value == 0 && result == 0 {
                displayLabel.text = displayLabel.text!
            } else {
                calculate(result: result, value: value, operand: operand)
            }
            
            operand = "/"
            result = Double(displayLabel.text!)!
        }
        
        operationDidTap = true
    }
    
    func calculate(result: Double, value: Double, operand: String) {
        switch operand {
        case "+":
            summary = result + value
            let formattedNumber = String(format: "%.16g", summary)
            displayLabel.text = formattedNumber
            self.result = Double(displayLabel.text!)!
            self.value = 0
            firstEquel = true
        case "-":
            summary = result - value
            let formattedNumber = String(format: "%.16g", summary)
            displayLabel.text = formattedNumber
            self.result = Double(displayLabel.text!)!
            self.value = 0
            firstEquel = true
        case "*":
            if value == 0 {
                displayLabel.text = displayLabel.text!
            } else {
                summary = result * value
                let formattedNumber = String(format: "%.16g", summary)
                displayLabel.text = formattedNumber
                self.result = Double(displayLabel.text!)!
                self.value = 0
                firstEquel = true
            }
        case "/":
            if value == 0 {
                displayLabel.text = displayLabel.text!
            } else {
                summary = result / value
                let formattedNumber = String(format: "%.16g", summary)
                displayLabel.text = formattedNumber
                self.result = Double(displayLabel.text!)!
                self.value = 0
                firstEquel = true
            }
        default:
            displayLabel.text = "Совушкин калькулятор"
        }
    }
    
    // FIXME: - Перенести анимацию в AnimationController
    func hideAndShowDisplayLable() {
        // Число на экране исчезает и повляется. Позволяет зрительно понять, что кнопка нажата
        UILabel.animate(withDuration: 0.15) { [weak self] in
            self?.displayLabel.alpha = 0
        }
        UILabel.animate(withDuration: 0.15) { [weak self] in
            self?.displayLabel.alpha = 1
        }
    }
    
    func hideDisplayLable() {
        UILabel.animate(withDuration: 0.15) { [weak self] in
            self?.displayLabel.alpha = 0
        }
    }
    
    func showDisplayLable() {
        UILabel.animate(withDuration: 0.15) { [weak self] in
            self?.displayLabel.alpha = 1
        }
    }
    
    func hideDevideOnZeroImageView() {
        UIImageView.animate(withDuration: 0.5) { [weak self] in
            self?.devideOnZeroImageView.alpha = 0
        }
    }
    
    func showDevideOnZeroImageView() {
        UIImageView.animate(withDuration: 0.5) { [weak self] in
            self?.devideOnZeroImageView.alpha = 1
        }
    }
}
