//
//  CalcNewTests.swift
//  CalcNewTests
//
//  Created by yauheni prakapenka on 08/04/2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//


// Тестирует не используемый CalculatorBrain


import XCTest
@testable import Calculator

class CalcNewTests: XCTestCase {
    var brain: CalculatorBrain!
    
    override func setUp() {
        brain = CalculatorBrain()
    }
    
    func testPlusPositive() {
        var result = 0.0
        result = brain.calculate(result: 4.1, value: 3.2, operation: "+")
        XCTAssertEqual(result, 7.3)
    }
    
    func testPlusNegative() {
        var result = 0.0
        result = brain.calculate(result: 5, value: 3, operation: "+")
        XCTAssertNotEqual(result, 7)
    }
    
    func testMinusPositive() {
        var result = 0.0
        result = brain.calculate(result: 4.0, value: 3.0, operation: "-")
        XCTAssertEqual(result, 1)
    }
    
    func testMinusNegative() {
        var result = 0.0
        result = brain.calculate(result: 5, value: 3, operation: "-")
        XCTAssertNotEqual(result, 4)
    }
    
    func testMultiPositive() {
        var result = 0.0
        result = brain.calculate(result: 4, value: 2, operation: "*")
        XCTAssertEqual(result, 8)
    }
    
    func testMultiNegative() {
        var result = 0.0
        result = brain.calculate(result: 2, value: 3, operation: "*")
        XCTAssertNotEqual(result, 5)
    }
    
    func testDividePositive() {
        var result = 0.0
        result = brain.calculate(result: 6, value: 2, operation: "/")
        XCTAssertEqual(result, 3)
    }
    
    func testDivideNegative() {
        var result = 0.0
        result = brain.calculate(result: 9, value: 3, operation: "/")
        XCTAssertNotEqual(result, 4)
    }
    
    func testPlusMinusMultiplyDivide() {
        var result = 0.0
        result = brain.calculate(result: 2, value: 3, operation: "+")
        XCTAssertEqual(result, 5)
        
        result = brain.calculate(result: result, value: 1, operation: "-")
        XCTAssertEqual(result, 4)
        
        result = brain.calculate(result: result, value: 2, operation: "*")
        XCTAssertEqual(result, 8)
        
        result = brain.calculate(result: result, value: 2, operation: "/")
        XCTAssertEqual(result, 4)
    }
    
    func testDivideOnZero() {
        var result = 0.0
        result = brain.calculate(result: 5, value: 0, operation: "/")
        XCTAssertEqual(result, 6789)
    }
    
//    func testEqual() {
//        var result = 0.0
//        var oldValue = 0.0
//        // первое равно
//        result = brain.calculate(result: 7, value: 5, operation: "+")
//        oldValue = brain.value
//        XCTAssertEqual(result, 12)
//
//        // второе равно
//        result = brain.calculate(operation: "=")
//        oldValue = brain.value
//        XCTAssertEqual(result, 16)
//
//    }
    
}
