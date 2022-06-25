//
//  ViewController.swift
//  concentration
//
//  Created by Ahuja, Abhishek on 1/25/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender);
    }
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle  == emoji {
            button.setTitle("", for: UIControl.State.normal);
            button.backgroundColor = UIColor.orange;
            
        } else {
            button.setTitle(emoji, for: .normal);
            button.backgroundColor = UIColor.white;
        }
    }
}

