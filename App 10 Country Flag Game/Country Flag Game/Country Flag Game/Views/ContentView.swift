//
//  ContentView.swift
//  Country Flag Game
//
//  Created by Jeffrey Lin on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var quizManager = QuizManager()
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Country Flag Game")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.yellow)
                    Text("Ready to test your skillz?")
                        .foregroundColor(.yellow)
                }
                NavigationLink {
                    QuestionView()
                        .environmentObject(quizManager)
                } label: {
                    CustomButton(text: "Start")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(.cyan)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
