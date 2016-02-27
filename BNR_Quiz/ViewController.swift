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
    
    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var nextQuestionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    // MARK: - IBAction Methods
    
    @IBAction func showNextQuestionButtonDidTouch(sender: UIButton) {
        ++self.qna.currentQuestionIndex
        if self.qna.currentQuestionIndex == self.qna.questions.count {
            self.qna.currentQuestionIndex = 0
        }
        
        self.nextQuestionLabel.text = self.qna.questions[self.qna.currentQuestionIndex]
        self.answerLabel.text = "???"
        
        self.animateLabelTransitions()
    }
    
    @IBAction func showAnswerButtonDidTouch(sender: UIButton) {
        self.answerLabel.text = self.qna.answers[self.qna.currentQuestionIndex]
    }
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentQuestionLabel.text = self.qna.questions[self.qna.currentQuestionIndex]
        self.updateOffScreenNextQuestionLabel()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nextQuestionLabel.alpha = 0.0
    }
    
    // MARK: - Helper Methods
    
    func animateLabelTransitions() {
        self.view.layoutIfNeeded()
        
        let screenWidth = self.view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant = screenWidth
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: [], animations: { () -> Void in
            self.currentQuestionLabel.alpha = 0.0
            self.nextQuestionLabel.alpha = 1.0
            self.view.layoutIfNeeded()
            }) { (_) -> Void in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                self.updateOffScreenNextQuestionLabel()
        }
    }
    
    func updateOffScreenNextQuestionLabel() {
        let screenWidth = self.view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
}

