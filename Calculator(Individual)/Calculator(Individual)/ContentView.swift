//
//  ContentView.swift
//  Calculator(Individual)
//
//  Created by Jeffrey Lin on 7/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumberTextField = ""
    @State private var secondNumberTextField = ""
    @State private var calculation = 0
    var body: some View {
        NavigationView {
            VStack {
                Text("Calculator")
                    .font(.title).bold()
                Text("This view is for addition")
                    .padding()
                TextField("Enter a Number", text: $firstNumberTextField)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 30, alignment: .center)
                    .font(.body)
                    .padding()
                Text("+")
                TextField("Enter a Number", text: $secondNumberTextField)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 30, alignment: .center)
                    .font(.body)
                    .padding()
                Button("Calculate") {
                    if let firstNumber = Int(firstNumberTextField) {
                        if let secondNumber = Int(secondNumberTextField) {
                            calculation = firstNumber + secondNumber
                        }
                    }
                }
                Text("\(calculation)")
                    .frame(width: 200, height: 30, alignment: .center)
                Text("Click this button to cycle through views")
                    .padding()
                NavigationLink("Next View", destination: Subtraction(phrase: "This View is for Subtraction"))
                Spacer()
            }
            .foregroundColor(.green)
            .navigationTitle("")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
