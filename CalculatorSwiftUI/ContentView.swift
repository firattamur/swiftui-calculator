//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Firat Tamur on 11/22/21.
//

import SwiftUI

enum CalculationButton: String {
    
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
    case clear = "AC"
    case decimal = ","
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

struct ContentView: View {
    
    let buttons: [[CalculationButton]] =
    [
        [.clear, .negative, .percent, .divide],
        [.six, .seven, .eight, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    
    ]
    
    @State var value = "0"
    @State var pastValue: String = "0"
    @State var selectedOperation : CalculationButton = .clear

    let textLimit    = 11
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
        
            VStack {
                Spacer()
                
                // result of calculation
                HStack {
                    
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 80))
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.50)
    
                }
                .padding()
                
                // buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self) { item in
                            
                            Button {
                                self.didTapButton(button: item)
                            } label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .bold()
                                    .frame(width: self.buttonWidth(item: item),
                                           height: self.buttonHeight(),
                                           alignment: .center)
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item) / 2)
                            }
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func didTapButton(button: CalculationButton) {
        
        switch button {
            
        case .add, .subtract, .divide, .multiply, .equal:
            
            if self.selectedOperation == .clear {
                self.pastValue = self.value
                self.selectedOperation = button
                self.setValue(value: "0")
            }else {
                self.selectedOperation = .clear
                self.handleOperation(number: self.value, operation: button)
            }
            
        case .clear:
            self.value = "0"
        case .decimal, .negative, .percent:
            break
        default:
            
            // no more than 10^9 numbers like in iOS default calculator
            if self.value.count == 11 {
                break
            }
            
            let number = button.rawValue
            
            if self.value == "0" {
                value = number
            }else {
    
                if self.value.count == 3 || self.value.count == 7 {
                    setValue(value: "\(self.value),")
                }
                    
                setValue(value: "\(self.value)\(number)")
                
            }
                
        }
        
    }
    
    func setValue(value: String) {
        if value.count > self.textLimit {
            self.value = String(value.prefix(textLimit))
        }else {
            self.value = value
        }
    }
    
    func getNumber(value: String) {
        
        
        
    }
    
    func handleOperation(number: String, operation: CalculationButton) {
 
        if operation == .add {
            let pastNumber = self.getNumber(self.pastValue)
            let number = self.getNumber(number)
            
            self.setValue(value: "\(pastNumber + number)")
            
        }
            
    }
    
    func buttonWidth(item: CalculationButton) -> CGFloat {
        
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
