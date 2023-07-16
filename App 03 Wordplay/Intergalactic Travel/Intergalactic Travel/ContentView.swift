//
//  ContentView.swift
//  Intergalactic Travel
//
//  Created by Jeffrey Lin on 6/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                StarView(name: "Blue Star")
                    .padding()
                StarView(name: "Red Dwarf")
                .foregroundColor(.red)
            }
            .navigationBarTitle("Intergalactic Travel", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct StarView: View {
    let name: String
    var body: some View {
        NavigationLink("Travel to \(name)") {
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
    }
}
