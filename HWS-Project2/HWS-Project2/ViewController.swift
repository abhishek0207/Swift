//
//  ViewController.swift
//  HWS-Project2
//
//  Created by Ahuja, Abhishek on 4/18/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var button1: UIButton!

    @IBOutlet var button2: UIButton!

    @IBOutlet var button3: UIButton!

    @IBOutlet weak var scoreLabel: UILabel!
    var countries : [String] = []
    var correctAnswer = 0
    var score = 0
    let rightButton = UIBarButtonItem(title: "0", style: .plain, target: self, action: nil)
    @IBAction func onButtonPressed(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            score+=1

        } else {
            score-=1
        }
        reloadGame()
        scoreLabel.text = "\(score)"
        rightButton.title = "\(score)"

    }
    func reloadGame() {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        print("correct answer inside")
        print(correctAnswer)
        title = countries[correctAnswer].uppercased()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        let buttons = [button1, button2, button3]
        buttons.forEach {
            b in
            b?.layer.borderWidth = 1
            b?.layer.borderColor = UIColor.lightGray.cgColor
        }
        navigationItem.rightBarButtonItem = rightButton
        reloadGame()
    }


}

