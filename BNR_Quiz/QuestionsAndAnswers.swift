//
//  Model.swift
//  BNR_Quiz
//
//  Created by Yohannes Wijaya on 1/29/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import Foundation

struct QuestionsAndAnswers {
    
    var currentQuestionIndex: Int = 0
    
    let questions: [String] = [
        "From what is cognac made?",
        "What is 7 + 7?",
        "What is the capital of Vermont?"
    ]
    
    let answers: Array<String> = [
        "Grapes",
        "14",
        "Montpelier"
    ]
}