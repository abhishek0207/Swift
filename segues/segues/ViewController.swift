//
//  ViewController.swift
//  segues
//
//  Created by Ahuja, Abhishek on 2/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSegue" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.dataFromvc1 = name.text!
        }
    }


}

