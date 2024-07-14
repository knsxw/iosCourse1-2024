//
//  SecondViewController.swift
//  PhoneApp
//
//  Created by Sasori on 11/7/2567 BE.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    var phoneNumber: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneBtn.layer.cornerRadius = phoneBtn.frame.height / 2
        phoneBtn.layer.masksToBounds = true
        phoneLabel.text = phoneNumber
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
