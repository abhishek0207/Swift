//
//  ViewController.swift
//  segues
//
//  Created by Ahuja, Abhishek on 2/8/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var dataFromvc1 : String = ""
    
    @IBOutlet weak var labelVal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelVal.text = dataFromvc1
        
    }


}

