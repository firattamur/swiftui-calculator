//
//  Utils.swift
//  CalculatorSwiftUI
//
//  Created by Firat Tamur on 11/24/21.
//

import Foundation

class Utils {
    
    let numLimit  : Float32 = 1000000000
    
    // calculation value and operations
    var value     : String = "0"
    var lastValue : String = "0"
    var operation : CalculatorButton = .zero
    var lastButton: CalculatorButton = .zero
    
    func handleTap(button: CalculatorButton) -> String {
        
        var result = ""
        
        switch button {
            
        case .clear:
            
            if operation == .zero {
                self.value = "0"
            }else {
                self.value = "0"
                self.operation = .zero
            }

            result = "0"
        
        case .negative:
            
            guard (self.strNumtoFloatNum(value: self.value) != nil) else {
                return "Not a Number"
            }
            
            self.value = self.floatNumToStrNum(value: self.strNumtoFloatNum(value: self.value)! * -1)

            result = self.value
            
        case .percent:
            
            guard (self.strNumtoFloatNum(value: self.value) != nil) else {
                return "Not a Number"
            }
            
            self.value = self.floatNumToStrNum(value: self.strNumtoFloatNum(value: self.value)! / 100)

            result = self.value
            
        case .divide, .multiply, .subtract, .add:
            
            self.operation = button
            
            if self.lastButton == .equal {
                self.value = lastValue
                result = self.lastValue
            }else {
                self.lastValue = self.value
                result = self.value
            }
            
        case .equal:
            
            guard (self.strNumtoFloatNum(value: self.value) != nil),
                  (self.strNumtoFloatNum(value: self.lastValue) != nil) else {
                return "Not a Number"
            }
            
            self.lastValue = self.floatNumToStrNum(value:
                                                self.calculate(
                                                    button: self.operation,
                                                    value: self.strNumtoFloatNum(value: self.value)!,
                                                    lastValue: self.strNumtoFloatNum(value: self.lastValue)!))
            
            result = self.lastValue
            
        default:
            
            if self.value == "0" ||
                (self.operation != .zero && self.value == self.lastValue) ||
                self.lastButton == .equal {
                self.value = button.rawValue
                
                result = self.value
            }else {
                self.value = "\(self.value)\(button.rawValue)"
                
                result = self.value
            }
      
        }
        
        self.lastButton = button
        return result
        
    }
    
    func calculate(button: CalculatorButton, value: Float, lastValue: Float) -> Float {
        
        switch button {
            
        case .divide:
            return lastValue / value
        
        case .multiply:
            return value * lastValue
            
        case .subtract:
            return lastValue - value
            
        case .add:
            return value + lastValue
            
        default:
            return 0.0
            
        }
        
    }
    
    func floatNumToStrNum(value: Float) -> String {
        
        if value >= self.numLimit {
            return self.floatNumToScientificStr(value: value)
        }else if Float(Int(value)) == value {
            return "\(Int(value))"
        }else {
            return "\(value)"
        }
        
    }
    
    func strNumtoFloatNum(value: String) -> Float? {
        
        guard Float(value) != nil else {
            return nil
        }
        
        return Float(value)
    }
    
    func floatNumToScientificStr(value: Float) -> String {
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle    = .scientific
        formatter.positiveFormat = "0.##E+0"
        formatter.exponentSymbol = "e"
        
        guard let scientificFormatted = formatter.string(for:value) else {
            return String(value)
        }
        
        return scientificFormatted
    }

    
}
