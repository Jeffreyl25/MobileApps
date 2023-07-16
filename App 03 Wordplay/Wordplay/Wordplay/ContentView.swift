//
//  ContentView.swift
//  Wordplay
//
//  Created by Jeffrey Lin on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var words = Words()
    var body: some View {
        NavigationView {
            VStack {
                Text("Word Play/Mad Libs")
                    .font(.title).bold().foregroundColor(.red)
                Text("Please enter the requested words below")
                    .bold().foregroundColor(.red)
                HStack{
                    CustomTextField(placeholder: "Bird", variable: $words.bird)
                    CustomTextField(placeholder: "Room", variable: $words.room)
                }
                HStack {
                    CustomTextField(placeholder: "Name", variable: $words.relative)
                    CustomTextField(placeholder: "Liquid", variable: $words.liquid)
                    CustomTextField(placeholder: "Animal", variable: $words.animal)
                }
                HStack {
                    CustomTextField(placeholder: "BodyPart", variable: $words.bodypart)
                    CustomTextField(placeholder: "adjective", variable: $words.adjective)
                    CustomTextField(placeholder: "Verb", variable: $words.verb0)
                }
                HStack {
                    CustomTextField(placeholder: "Verb", variable: $words.verb1)
                    CustomTextField(placeholder: "Verb", variable: $words.verb2)
                    CustomTextField(placeholder: "Noun", variable: $words.noun)
                }
                NavigationLink("Next", destination: StoryView(words: words))
                Spacer()
            }
        }
        .navigationTitle("Word Play")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Words {
    var bird = ""
    var room = ""
    var relative = ""
    var liquid = ""
    var bodypart = ""
    var animal = ""
    
    var adjective = ""
    var verb0 = ""
    var verb1 = ""
    var verb2 = ""
    var noun = ""
}

struct CustomTextField: View {
    let placeholder : String
    let variable : Binding<String>
    var body: some View {
        TextField(placeholder, text: variable)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
    }
}


