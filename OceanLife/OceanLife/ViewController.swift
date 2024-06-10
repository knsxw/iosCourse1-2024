//
//  ViewController.swift
//  OceanLife
//
//  Created by Sasori on 10/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var seaLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func turtleImageClicked() {
        seaLabel.isHidden = false;
        seaLabel.text = "Sea Turtle"
    }

    @IBAction func sharkImageClicked() {
        seaLabel.isHidden = false;
        seaLabel.text = "Shark"
    }
    
    @IBAction func whaleImageClicked() {
        seaLabel.isHidden = false;
        seaLabel.text = "Whale"
    }
    
    @IBAction func octopusImageClicked() {
        seaLabel.isHidden = false;
        seaLabel.text = "Octopus"
    }
    
    @IBAction func dolphinsImageClicked() {
        seaLabel.isHidden = false;
        seaLabel.text = "Dolphins"
    }
    
    @IBAction func jellyfishImageClicked() {
        seaLabel.isHidden = false;
        seaLabel.text = "Jellyfish"
    }
}

