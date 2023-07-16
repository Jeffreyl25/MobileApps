//
//  StoryView.swift
//  Wordplay
//
//  Created by Jeffrey Lin on 6/29/23.
//

import SwiftUI

struct StoryView: View {
    let words : Words
    var body: some View {
        Text(writeStory())
        Image("Laugh")
    }
    func writeStory() -> String {
        return "I woke up to the \(words.adjective) smell of \(words.bird) roasting in the \(words.room) downstairs. " + "I \(words.verb0) down the stairs to see if I could help \(words.verb1) the dinner. " + "My mom said, \"See if \(words.relative) needs a fresh \(words.noun).\" " + "So I carried a tray of glasses full of \(words.liquid) into the \(words.verb2) room. " + "When I got there, I couldn't believe my \(words.bodypart)! " + "There was a \(words.animal) in the \(words.verb2) room!"
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(words: Words())
    }
}

