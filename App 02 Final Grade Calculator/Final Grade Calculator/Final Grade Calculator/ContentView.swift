//
//  ContentView.swift
//  Final Grade Calculator
//
//  Created by Jeffrey Lin on 6/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentGradeTextField = ""
    @State private var finalWeightTextField = ""
    @State private var desiredGrade = 0.0
    @State private var requiredGrade = 0.0
    var body: some View {
        VStack {
            CustomText(text: "Final Grade Calculator")
            CustomTextField(placeholder: "Current Semester Grade", variable: $currentGradeTextField)
            CustomTextField(placeholder: "Final Weight %", variable: $finalWeightTextField)
            Picker("Desired Semester Grade", selection: $desiredGrade){
                Text("A").tag(90.0)
                Text("B").tag(80.0)
                Text("C").tag(70.0)
                Text("D").tag(60.0)
            }
            .pickerStyle(.segmented)
            .padding()
            Text("Required Grade on the Final")
                .fontDesign(.monospaced)
                .foregroundColor(Color.blue)
                .italic()
            CustomText(text: String(format: "%.1f", requiredGrade))
            Spacer()
        }
        .onChange(of: desiredGrade, perform: { newValue in calculateGrade()})
        .background(requiredGrade > 100 ? Color.red : Color.green.opacity(requiredGrade > 0 ? 1.0 : 0))
    }
    
    func calculateGrade() {
        if let currentGrade = Double(currentGradeTextField) {
            if let finalWeight = Double(finalWeightTextField) {
                if finalWeight < 100 && finalWeight > 0 {
                    let finalPercentage = finalWeight / 100.0
                    requiredGrade = max(0.0,(desiredGrade - (currentGrade * (1.0 - finalPercentage))) / finalPercentage)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomText: View {
    let text : String
    var body: some View {
        Text(text)
            .font(.title).bold().italic().underline()
            .foregroundColor(Color.blue)
    }
}

struct CustomTextField: View {
    let placeholder : String
    let variable : Binding<String>
    var body: some View {
        TextField(placeholder, text: variable)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30, alignment: .center)
            .font(.body)
            .padding()
    }
}
