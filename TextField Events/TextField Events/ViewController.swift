//
//  ViewController.swift
//  TextField Events
//
//  Created by Sasori on 29/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func textFieldOnEditingChanged(_ sender: Any) {
        if let currentInput = phoneNumberTextField.text {
            switch currentInput.count {
            case 2, 7, 14, 17:
                let firstPart = currentInput.substring(to: currentInput.count - 1)
                let hyphen = "-"
                let lastPart = currentInput.substring(from: currentInput.count - 1)
                phoneNumberTextField.text = "\(firstPart)\(hyphen)\(lastPart)"
            case 19:
                phoneNumberTextField.text = currentInput.substring(to: 18)
            default:
                break
            }

        }
    }
    
    @IBAction func textFieldOnEditingDidBegin(_ sender: Any) {
        print("textFieldOnEditingDidBegin")
    }
    @IBAction func imDoneButtonClicked(_ sender: Any) {
        phoneNumberTextField.resignFirstResponder()
    }
}

