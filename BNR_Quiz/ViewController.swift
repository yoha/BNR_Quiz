//
//  ViewController.swift
//  BNR_Quiz
//
//  Created by Yohannes Wijaya on 1/29/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Stored Properties
    
    var qna = QuestionsAndAnswers()

    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    // MARK: - IBAction Methods
    
    @IBAction func showNextQuestionButtonDidTouch(sender: UIButton) {
        ++self.qna.currentQuestionIndex
        if self.qna.currentQuestionIndex == self.qna.questions.count {
            self.qna.currentQuestionIndex = 0
        }
        
        self.questionLabel.text = self.qna.questions[self.qna.currentQuestionIndex]
        self.answerLabel.text = "???"
        
        self.animateLabelTransitions()
    }
    
    @IBAction func showAnswerButtonDidToich(sender: UIButton) {
        self.answerLabel.text = self.qna.answers[self.qna.currentQuestionIndex]
    }
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionLabel.text = self.qna.questions[self.qna.currentQuestionIndex]
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.questionLabel.alpha = 0.0
    }
    
    // MARK: - Helper Methods
    
    func animateLabelTransitions() {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.questionLabel.alpha = 1.0
        }
    }
}

