//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    let allQuestions = QuestionBank()
    var pickedAnswer  = false;
    var questionNumber = 0;
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        checkAnswer()
        updateUI()
    }
    
    
    func updateUI() {
        
        nextQuestion()
    }
    

    func nextQuestion() {
        if(questionNumber<=12) {
        let Question = allQuestions.list[questionNumber];
        questionLabel.text=Question.questionText
        scoreLabel.text = "Score : \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
            
            
        } else {
            let alert = UIAlertController(title: "Awesome!!", message: "You've finished all the questions", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
                (UIAlertAction) in self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion:nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[0].answer;
        if(correctAnswer == pickedAnswer) {
            score+=1
            ProgressHUD.showSuccess("Correct")
        } else {
            ProgressHUD.showError("Wrong")
        }
        questionNumber = questionNumber + 1
    }
    
    
    func startOver() {
       questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
}
