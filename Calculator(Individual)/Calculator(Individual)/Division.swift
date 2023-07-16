//
//  Division.swift
//  Calculator(Individual)
//
//  Created by Jeffrey Lin on 7/2/23.
//

import SwiftUI

struct Division: View {
    @State private var firstNumberTextField = ""
    @State private var secondNumberTextField = ""
    @State private var calculation = 0
    let phrase : String
    var body: some View {
        VStack {
            Text("This View is for Division")
                .padding()
            TextField("Enter a Number", text: $firstNumberTextField)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30, alignment: .center)
                .font(.body)
                .padding()
            Text("÷")
            TextField("Enter a Number", text: $secondNumberTextField)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30, alignment: .center)
                .font(.body)
                .padding()
            Button("Calculate") {
                if let firstNumber = Int(firstNumberTextField) {
                    if let secondNumber = Int(secondNumberTextField) {
                        calculation = firstNumber / secondNumber
                    }
                }
            }
            Text("\(calculation)")
                .frame(width: 200, height: 30, alignment: .center)
            Text(phrase)
                .padding()
            Spacer()
        }
        .foregroundColor(.yellow)
        .navigationTitle("Division")
    }
}

struct Division_Previews: PreviewProvider {
    static var previews: some View {
        Division(phrase: "")
    }
}
