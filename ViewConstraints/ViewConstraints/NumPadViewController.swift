//
//  NumPadViewController.swift
//  ViewConstraints
//
//  Created by Sasori on 6/7/2567 BE.
//

import UIKit

class NumPadViewController: UIViewController {

    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        oneLabel.layer.cornerRadius = oneLabel.frame.height / 2
        oneLabel.layer.masksToBounds = true
        twoLabel.layer.cornerRadius = twoLabel.frame.height / 2
        twoLabel.layer.masksToBounds = true
        threeLabel.layer.cornerRadius = threeLabel.frame.height / 2
        threeLabel.layer.masksToBounds = true
        // Do any additional setup after loading the view.
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
