//
//  ViewController.swift
//  VowelsCounter
//
//  Created by Sasori on 30/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wordInputField: UITextField!
    
    @IBOutlet weak var aBox: UIImageView!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var eBox: UIImageView!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var iBox: UIImageView!
    @IBOutlet weak var iButton: UIButton!
    @IBOutlet weak var oBox: UIImageView!
    @IBOutlet weak var oButton: UIButton!
    @IBOutlet weak var uBox: UIImageView!
    @IBOutlet weak var uButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func EditingChangedOnWordInputField(_ sender: Any) {
        var vowelCounts: [Character: Int] = ["a": 0, "e": 0, "i": 0, "o": 0, "u": 0]
        let inputString = wordInputField.text ?? ""
        
        for c in inputString.lowercased(){
            switch c{
            case "a","e","i","o","u":
                vowelCounts[c, default: 0] += 1
            default:
                break
            }
        }
        
        aBox.backgroundColor = vowelCounts["a"]! > 0 ? UIColor.green : UIColor.gray
        eBox.backgroundColor = vowelCounts["e"]! > 0 ? UIColor.green : UIColor.gray
        iBox.backgroundColor = vowelCounts["i"]! > 0 ? UIColor.green : UIColor.gray
        oBox.backgroundColor = vowelCounts["o"]! > 0 ? UIColor.green : UIColor.gray
        uBox.backgroundColor = vowelCounts["u"]! > 0 ? UIColor.green : UIColor.gray
        
        updateButtonTitles(vowelCounts: vowelCounts)
    }
    
    func updateButtonTitles(vowelCounts: [Character: Int]) {
        aButton.titleLabel?.text = "x\(vowelCounts["a"] ?? 0)"
        eButton.titleLabel?.text = "x\(vowelCounts["e"] ?? 0)"
        iButton.titleLabel?.text = "x\(vowelCounts["i"] ?? 0)"
        oButton.titleLabel?.text = "x\(vowelCounts["o"] ?? 0)"
        uButton.titleLabel?.text = "x\(vowelCounts["u"] ?? 0)"
    }
}

