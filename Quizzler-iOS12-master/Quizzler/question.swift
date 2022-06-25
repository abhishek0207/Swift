//
//  question.swift
//  Quizzler
//
//  Created by Ahuja, Abhishek on 1/26/22.
//

import Foundation

class Question {
    let questionText : String;
    let answer : Bool;
    
    init(text: String, correctAnswer: Bool) {
        questionText = text;
        answer = correctAnswer;
    }
    
}
