//
//  ViewController.swift
//  OCarina_Of_Time
//
//  Created by Ahuja, Abhishek on 2/28/22.
//

import UIKit

class ViewController: UIViewController {
    var textLabel: UILabel!
    var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let layout = view.layoutMarginsGuide
        textLabel = UILabel()
        textLabel.text = "Hey there i am created programatically"
        textLabel.textColor = .black
        view.addSubview(textLabel)
        
        //Add Constraints
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: layout.topAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        // Lets add a button
        
        myButton = UIButton()
        myButton.setTitle("Click me!!", for: .normal)
        myButton.setTitleColor(.black, for: .normal)
        view.addSubview(myButton)
        
        // Add Constraints
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
        myButton.centerXAnchor.constraint(equalTo:layout.centerXAnchor).isActive  = true
        
        //
        myButton.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
    }
    @objc func changeTitle() {
        textLabel.text = "Hey i guess you clicked a button"
    }


}

