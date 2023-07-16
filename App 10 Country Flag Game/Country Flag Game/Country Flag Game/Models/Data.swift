//
//  Data.swift
//  Country Flag Game
//
//  Created by Jeffrey Lin on 7/10/23.
//

import Foundation

struct Data {
    let questions = [
        
        Question(correctAnswer:
                Answer(text: "England", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Ireland", isCorrect: false),
                Answer(text: "Iceland", isCorrect: false),
                Answer(text: "South Africa", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "France", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Spain", isCorrect: false),
                Answer(text: "Italy", isCorrect: false),
                Answer(text: "Germany", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Germany", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Austria", isCorrect: false),
                Answer(text: "Italy", isCorrect: false),
                Answer(text: "Czech Republic", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Angola", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Algeria", isCorrect: false),
                Answer(text: "Bangladesh", isCorrect: false),
                Answer(text: "Ghana", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "China", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Indonesia", isCorrect: false),
                Answer(text: "Japan", isCorrect: false),
                Answer(text: "South Korea", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Austria", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Jamaica", isCorrect: false),
                Answer(text: "Kenya", isCorrect: false),
                Answer(text: "England", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Estonia", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Finland", isCorrect: false),
                Answer(text: "Iceland", isCorrect: false),
                Answer(text: "Sweden", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Greece", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Sweden", isCorrect: false),
                Answer(text: "Kazakhstan", isCorrect: false),
                Answer(text: "South Africa", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "India", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Mexico", isCorrect: false),
                Answer(text: "Mali", isCorrect: false),
                Answer(text: "Pakistan", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Israel", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Pakistan", isCorrect: false),
                Answer(text: "Jamaica", isCorrect: false),
                Answer(text: "Jordan", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Italy", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "France", isCorrect: false),
                Answer(text: "Mexico", isCorrect: false),
                Answer(text: "Greece", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Norway", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Sweden", isCorrect: false),
                Answer(text: "Iceland", isCorrect: false),
                Answer(text: "Australia", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Pakistan", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Guinea", isCorrect: false),
                Answer(text: "Brazil", isCorrect: false),
                Answer(text: "Bangladesh", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Peru", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Mexico", isCorrect: false),
                Answer(text: "Canada", isCorrect: false),
                Answer(text: "Ireland", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Saudi Arabia", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Pakistan", isCorrect: false),
                Answer(text: "Brazil", isCorrect: false),
                Answer(text: "Afghanistan", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "South Africa", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Burundi", isCorrect: false),
                Answer(text: "Eritrea", isCorrect: false),
                Answer(text: "Guyana", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Spain", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Mexico", isCorrect: false),
                Answer(text: "Argentina", isCorrect: false),
                Answer(text: "Slovakia", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Sweden", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Denmark", isCorrect: false),
                Answer(text: "Norway", isCorrect: false),
                Answer(text: "Scania", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Ukraine", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Russia", isCorrect: false),
                Answer(text: "Germany", isCorrect: false),
                Answer(text: "Yemen", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Ireland", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Italy", isCorrect: false),
                Answer(text: "England", isCorrect: false),
                Answer(text: "Pakistan", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Bhutan", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Slovakia", isCorrect: false),
                Answer(text: "Jamaica", isCorrect: false),
                Answer(text: "Yemen", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Cyprus", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Jordan", isCorrect: false),
                Answer(text: "Croatia", isCorrect: false),
                Answer(text: "Portugal", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "United States", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Russia", isCorrect: false),
                Answer(text: "Germany", isCorrect: false),
                Answer(text: "Canada", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Honduras", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Palua", isCorrect: false),
                Answer(text: "Qatar", isCorrect: false),
                Answer(text: "Iceland", isCorrect: false)
                 ])
        ,
        
        Question(correctAnswer:
                Answer(text: "Kazakhstan", isCorrect: true),
                incorrectAnswers: [
                Answer(text: "Afghanistan", isCorrect: false),
                Answer(text: "Djibouti", isCorrect: false),
                Answer(text: "Yemen", isCorrect: false)
                 ])
        ,
    ]
}

