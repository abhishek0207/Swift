//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Ahuja, Abhishek on 1/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadImage();
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        loadImage();
        
    }
    func loadImage() {
        var randomNumber: Int = Int.random(in: 0...4)
        imageView.image = UIImage(named: ballArray[randomNumber])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        loadImage()
    }
}

