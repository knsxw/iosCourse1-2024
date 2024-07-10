//
//  ViewController.swift
//  PhoneApp
//
//  Created by Sasori on 10/7/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    @IBOutlet weak var starBtn: UIButton!
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var sharpBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let buttonArray: [UIButton] = [oneBtn, twoBtn, threeBtn, fourBtn, fiveBtn, sixBtn, sevenBtn, eightBtn, nineBtn, zeroBtn, starBtn, sharpBtn, phoneBtn]
        setCornerRadius(for: buttonArray)
    }

    func setCornerRadius(for btns: [UIButton]) {
        for btn in btns {
            btn.layer.cornerRadius = btn.frame.height / 2
            btn.layer.masksToBounds = true
        }
    }
    
    @IBAction func phoneClicked(button: UIButton) {
        var textInput = textField.text ?? ""
        switch button.tag {
        case 1:
            textField.text = textInput + "1"
        case 2:
            textField.text = textInput + "2"
        case 3:
            textField.text = textInput + "3"
        case 4:
            textField.text = textInput + "4"
        case 5:
            textField.text = textInput + "5"
        case 6:
            textField.text = textInput + "6"
        case 7:
            textField.text = textInput + "7"
        case 8:
            textField.text = textInput + "8"
        case 9:
            textField.text = textInput + "9"
        case 10:
            textField.text = textInput + "#"
        case 11:
            textField.text = textInput + "*"
        case 0:
            textField.text = textInput + "0"
        default:
            break
        }
    }
}

