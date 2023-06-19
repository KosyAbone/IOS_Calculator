//
//  Kosiso_Calculator_Model.swift
//  Kosiso_Abone_Red_Calculator
//
//  Created by KOSSY on 2023-05-31.
//

import Foundation


class Kosiso_Calculator_Model {
    var firstNumber: Double?
    var secondNumber: Double?
    var operation: String?
    
    func updateNumber (newNumber: Double?){
        if(firstNumber == nil){
            firstNumber = newNumber;
        }
        else if(operation == nil){
            firstNumber = newNumber;
        }
        else {
            secondNumber = newNumber;
        }
    }
    
    func getResult() -> Double {
        var result: Double = 0;
        switch(operation){
        case "+":
            result = firstNumber! + secondNumber!;
        case "-":
            result = firstNumber! - secondNumber!;
        case "x":
            result = firstNumber! * secondNumber!;
        case "/":
            result = firstNumber! / secondNumber!;
        case "^2":
            result = firstNumber! * firstNumber!;
        case "%":
            result = firstNumber! / 100
        default:
            print("def case of getresult")
        }
        return result
    }
    
    func reset () {
        firstNumber = nil;
        secondNumber = nil;
        operation = nil;
    }
}
