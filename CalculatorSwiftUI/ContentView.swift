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
    case multiply = "*"
    case equal = "="
    case clear = "AC"
    case decimal = ","
    case percent = "%"
    case negative = "+/-"
    
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
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // result of calculation
                HStack {
                    
                    Spacer()
                    Text("0")
                        .bold()
                        .font(.system(size: 64))
                        .foregroundColor(Color.white)
    
                }
                .padding()
                
                // buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self) { item in
                            
                            Button {
                                print("Hello")
                            } label: {
                                Text(item.rawValue)
                                    .font(.system(size: 40))
                                    .bold()
                                    .frame(width: self.buttonWidth(item: item),
                                           height: 70, alignment: .center)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            }
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func buttonWidth(item: CalculationButton) -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12))
    }
    
    func button
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
