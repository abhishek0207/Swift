//
//  ViewController.swift
//  HWS-Pproject8
//
//  Created by Ahuja, Abhishek on 4/22/22.
//

import UIKit

class ViewController: UIViewController {
    var cluesLabel: UILabel!
    var answersLabel : UILabel!
    var currentAnswer: UITextField!
    var scoreLabel : UILabel!
    var letterButtons = [UIButton]()
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    var letterBits = [String]()
    var solutionString = ""
    var clueString = ""
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    var level = 1
    func loadLevel() {
        if let levelFile = Bundle.main.url(forResource: "level1", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: levelFile) {
                var lines = fileContents.components(separatedBy: "\n")
                lines.shuffle()
                for (index, line) in lines.enumerated() {
                    let parts = line.components(separatedBy: ":")
                    let answer = parts[0]
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    let clue = parts[1]
                    clueString+="\(index + 1) : \(clue)\n"
                    solutionString+="\(solutionWord.count) letters\n"
                    solutions.append(solutionWord)
                    let bits = answer.components(separatedBy: "|")
                    letterBits+=bits
                }

                cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
                answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
                letterBits.shuffle()
                if letterBits.count == letterButtons.count {
                    for i in 0 ..< letterButtons.count {
                        letterButtons[i].setTitle(letterBits[i], for: .normal)
                    }
                }

            }
        }
    }
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        //okay lets add labels now

        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Score : \(score)"

        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.text  = "CLUES"
        cluesLabel.numberOfLines = 0
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        answersLabel = UILabel()
        answersLabel.translatesAutoresizingMaskIntoConstraints = false
        answersLabel.font = UIFont.systemFont(ofSize: 24)
        answersLabel.text  = "ANSWERS"
        answersLabel.numberOfLines = 0
        answersLabel.textAlignment = .right
        answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        currentAnswer  = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap letters to Guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled = false

        let submitButton : UIButton = UIButton(type: .system)
        let clearButton : UIButton = UIButton(type: .system)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Submit Answer", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitle("Clear", for: .normal)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)

        let buttonsView : UIView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false



        view.addSubview(scoreLabel)
        view.addSubview(cluesLabel)
        view.addSubview(answersLabel)
        view.addSubview(currentAnswer)
        view.addSubview(submitButton)
        view.addSubview(clearButton)
        view.addSubview(buttonsView)

        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor , multiplier: 0.6, constant: -100),
            answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
            answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor , multiplier: 0.4, constant: -100),
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
            submitButton.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            clearButton.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            submitButton.heightAnchor.constraint(equalToConstant: 44),
            clearButton.heightAnchor.constraint(equalToConstant: 44),
            buttonsView.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.widthAnchor.constraint(equalToConstant: 750)
        ])
//        buttonsView.backgroundColor = .green
//        cluesLabel.backgroundColor = .red
//        answersLabel.backgroundColor = .blue
        let width = 150
        let height = 80

        for row in 0..<4 {
            for col in 0..<5 {
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.setTitle("WW", for: .normal)
                let frame = CGRect(x: col * width, y: row*height, width: width, height: height)
                letterButton.frame  = frame
//                letterButton.translatesAutoresizingMaskIntoConstraints = false
                letterButton.layer.borderWidth = 1
                letterButton.layer.borderColor = UIColor.red.cgColor
                buttonsView.addSubview(letterButton)
                letterButtons.append(letterButton)
                letterButton.addTarget(self, action: #selector(letterButtonTapped), for: .touchUpInside)
            }
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadLevel()
    }
    @objc func letterButtonTapped(_ sender : UIButton) {
        guard let buttonText = sender.titleLabel?.text else {return}
        currentAnswer.text = currentAnswer.text?.appending(buttonText)
        activatedButtons.append(sender)
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            sender.alpha = 0.1
        }, completion : {
            finished in
            print("its faded")
        })
    }
    @objc func clearButtonTapped() {
        currentAnswer.text = ""
        for btn in activatedButtons {
            btn.isHidden  = false
        }
        activatedButtons = []
    }
    @objc func submitButtonTapped(_ sender : UIButton) {
        guard let answerText = currentAnswer.text  else {return }
        if let solutionPosition = solutions.firstIndex(of: answerText) {
            activatedButtons.removeAll()
            var splitAnswers = answersLabel.text?.components(separatedBy: "\n")
            splitAnswers?[solutionPosition] = answerText
            answersLabel.text  = splitAnswers?.joined(separator: "\n")
            currentAnswer.text = ""
            score+=1
            if score % 7 == 0 {
                     let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
                     ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
                     present(ac, animated: true)
            }

        } else {
            showErrorAlert("Invalid Answer", "Sorry thats a wrong Answer")
        }

    }
    func showErrorAlert(_ errorTitle: String, _ errorMessage: String) {
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        let action  =  UIAlertAction(title: "OK", style: .default)
        ac.addAction(action)
        present(ac, animated: true, completion: nil)
    }
    func levelUp(action: UIAlertAction) {
        level += 1
        solutions.removeAll(keepingCapacity: true)

        loadLevel()

        for btn in letterButtons {
            btn.isHidden = false
        }
    }

}

