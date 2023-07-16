//
//  SwiftUIView01.swift
//  Multiple Views Hackwich
//
//  Created by Jeffrey Lin on 6/29/23.
//

import SwiftUI

struct SwiftUIView01: View {
    let phrase : String
    var body: some View {
        VStack {
            Text(phrase)
                .padding()
            NavigationLink("Next View", destination: SwiftUIView02(phrase: "This came from the second view"))
        }
        .navigationTitle("Second View")
    }
}

struct SwiftUIView01_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView01(phrase: "Howdy")
    }
}
