//
//  Utils.swift
//  CalculatorSwiftUI
//
//  Created by Firat Tamur on 11/24/21.
//

import Foundation

class Utils {
    
    let numLimit  : Float = 1000000000
    
    // calculation value and operations
    var value     : Float = 0
    var lastValue : Float = 0
    var operation : CalculatorButton = .none
    
    func handleTap(button: CalculatorButton) -> String {
        
        switch button {
            
        case .clear:
            
            if operation == .zero {
                self.value = 0
            }else {
                self.value = 0
                self.operation = .zero
            }

            return "0"
        
        case .negative:
            return self.floatNumToStrNum(value: self.value * -1)
            
        case .percent:
            return self.floatNumToStrNum(value: self.value / 100)
            
        case .divide, .multiply, .subtract, .add:
            
            self.operation = button
            self.lastValue = self.value
            
            return self.floatNumToStrNum(value: self.value)
            
        case .decimal:
            break
            
            
        case .equal:
            
            self.value = self.calculate(button: self.operation,
                                        value: self.value,  lastValue: self.lastValue)
            
            return self.floatNumToStrNum(value: self.value)
            
        default:
            
            if self.value == 0 || (self.operation != .zero && self.value == self.lastValue) {
                self.value = self.strNumtoFloatNum(value: button.rawValue)
                
                return self.floatNumToStrNum(value: self.value)
            }else {
                let valueStr = self.floatNumToStrNum(value: self.value)
                self.value   = self.strNumtoFloatNum(value: "\(valueStr)\(button.rawValue)")
                
                return "\(valueStr)\(button.rawValue)"
            }
      
        }
        
        return ""
        
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
    
    func strNumtoFloatNum(value: String) -> Float {
        return Float(value)!
    }
    
    func floatNumToScientificStr(value: Float) -> String {
        return ""
    }

    
}
