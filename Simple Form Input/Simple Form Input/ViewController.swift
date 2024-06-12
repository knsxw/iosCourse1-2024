//
//  ViewController.swift
//  Simple Form Input
//
//  Created by Sasori on 12/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstNameInput : UITextField!
    @IBOutlet var lastNameInput : UITextField!
    @IBOutlet var ageInput : UITextField!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var ageLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.isHidden = true
        ageLabel.isHidden = true
    }
    @IBAction func showText() {
        
        if let age = ageInput.text, !age.isEmpty {
            ageLabel.text = "You are \(age) years old."
            ageLabel.isHidden = false
        } else {
            ageLabel.isHidden = true
        }
        let firstName = firstNameInput.text ?? ""
        let lastName = lastNameInput.text ?? ""
        if !firstName.isEmpty || !lastName.isEmpty {
            nameLabel.text = "Your name is \(firstName) \(lastName)."
            nameLabel.isHidden = false
        } else {
            nameLabel.isHidden = true
        }
    }

}

