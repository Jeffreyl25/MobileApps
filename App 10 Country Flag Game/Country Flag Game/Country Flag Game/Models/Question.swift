//
//  Question.swift
//  Country Flag Game
//
//  Created by Jeffrey Lin on 7/10/23.
//

import Foundation

struct Question: Identifiable {
    var id = UUID()
    var correctAnswer: Answer
    var incorrectAnswers: [Answer]
}

struct Answer: Identifiable {
    var id = UUID()
    var text: String
    var isCorrect: Bool
}
