//
//  Subtraction.swift
//  Calculator(Individual)
//
//  Created by Jeffrey Lin on 7/2/23.
//

import SwiftUI

struct Subtraction: View {
    @State private var firstNumberTextField = ""
    @State private var secondNumberTextField = ""
    @State private var calculation = 0
    let phrase : String
    var body: some View {
        VStack {
            Text("This View is for Subtraction")
                .padding()
            TextField("Enter a Number", text: $firstNumberTextField)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30, alignment: .center)
                .font(.body)
                .padding()
            Text("-")
            TextField("Enter a Number", text: $secondNumberTextField)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30, alignment: .center)
                .font(.body)
                .padding()
            Button("Calculate") {
                if let firstNumber = Int(firstNumberTextField) {
                    if let secondNumber = Int(secondNumberTextField) {
                        calculation = firstNumber - secondNumber
                    }
                }
            }
            Text("\(calculation)")
                .frame(width: 200, height: 30, alignment: .center)
            Text(phrase)
                .padding()
            NavigationLink("Next View", destination: Multiplication(phrase: "This View is for Multiplication"))
            Spacer()
        }
        .foregroundColor(.red)
        .navigationTitle("Subtraction")
    }
}

struct Subtraction_Previews: PreviewProvider {
    static var previews: some View {
        Subtraction(phrase: "")
    }
}
