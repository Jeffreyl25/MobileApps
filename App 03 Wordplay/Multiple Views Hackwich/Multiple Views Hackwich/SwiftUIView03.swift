//
//  SwiftUIView03.swift
//  Multiple Views Hackwich
//
//  Created by Jeffrey Lin on 6/29/23.
//

import SwiftUI

struct SwiftUIView03: View {
    let phrase : String
    var body: some View {
        VStack {
            Text(phrase)
                .padding()
        }
        .navigationTitle("Fourth View")
    }
}

struct SwiftUIView03_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView03(phrase: "Howdy")
    }
}
