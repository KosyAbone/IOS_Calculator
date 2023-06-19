//
//  ViewController.swift
//  Kosiso_Abone_Red_Calculator
//
//  Created by KOSSY on 2023-05-24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var displayNumber: UITextField!

    //MARK:- Other Variables
    var calculatorModel = Kosiso_Calculator_Model();
    var startNewNumber = true;
    
    //MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBActions
    @IBAction func buttonPressed(_ sender: UIButton) {
        let pressedButton = sender.currentTitle!
        var currentValue: String = displayNumber.text!;
        
        switch(pressedButton){
            case "0", "1", "2","3","4","5","6","7","8","9", ".":
                if(startNewNumber){
                    if(pressedButton == "."){
                        currentValue = "0."
                    }
                    else{
                        currentValue = pressedButton;
                    }
                }
                else{
                    if(pressedButton == "."){
                        if(currentValue.contains(".")){
                            //
                        }
                        else{
                            currentValue += pressedButton;
                        }
                    }
                    else {
                        currentValue += pressedButton
                    }
                }
                    
                startNewNumber = false;
                calculatorModel.updateNumber(newNumber: Double(currentValue));
            
            case "+", "-", "x", "/":
            if(calculatorModel.operation != nil){
                currentValue = String(calculatorModel.getResult());
                calculatorModel.reset();
                calculatorModel.updateNumber(newNumber: Double(currentValue));
            }
                calculatorModel.operation = pressedButton;
                startNewNumber = true;
            
            case "%":
                calculatorModel.operation = pressedButton;
                currentValue = String(calculatorModel.getResult());
                startNewNumber = true;
            
            case "^2":
                calculatorModel.operation = pressedButton;
                currentValue = String(calculatorModel.getResult());
                startNewNumber = true;
            
            case "⇦":
            if(currentValue.count == 1) {
                currentValue = "0";
            }
            if(currentValue != "0"){
                currentValue = String(currentValue.dropLast());
            }
            
            case "=":
                if(calculatorModel.secondNumber == nil) {
                    calculatorModel.updateNumber(newNumber: Double(currentValue));
                }
                currentValue = String(calculatorModel.getResult());
                startNewNumber = true;
            
            case "C":
                currentValue = "0";
                calculatorModel.reset();
                startNewNumber = true;
                        
            default: print ("nothing");
        }
        
        displayNumber.text = currentValue;
    }
}
    

