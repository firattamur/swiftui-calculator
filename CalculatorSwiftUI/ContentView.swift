//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Firat Tamur on 11/22/21.
//

import SwiftUI


struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let buttons: [[CalculatorButton]] =
    [
        [.clear, .negative, .percent, .divide],
        [.six, .seven, .eight, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    @State var lastValue = "0"
    @State var value     = "0"
    @State var operation : CalculatorOperations = .none
    
    var body: some View {
    
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
        
            VStack {
                Spacer()
                
                // result of calculation
                HStack {
                    
                    Spacer()
                    Text(self.value)
                        .bold()
                        .font(.system(size: 80))
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.50)
    
                }
                .padding()
                
                // buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 15){
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
                    .padding(.bottom, 10)
                }
            }
        }
    }
    
    func didTapButton(button: CalculatorButton) {
        
    }
    
    func buttonWidth(item: CalculatorButton) -> CGFloat {
        
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
}
