//
//  CalculationButton.swift
//  CalculatorSwiftUI
//
//  Created by Firat Tamur on 11/24/21.
//

import Foundation
import SwiftUI


enum CalculatorButton: String {
    
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six  = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "C"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    
    var buttonColor: Color {
        switch self {
            
        case .multiply, .divide, .subtract, .add, .equal:
            return .orange
            
        case .clear, .percent, .negative:
            return Color(.lightGray)
            
        default:
            return Color(UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1))
            
        }
    }
    
}
