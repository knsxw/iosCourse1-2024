//
//  ViewController.swift
//  Random Ocean Life Animal
//
//  Created by Sasori on 15/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Label : UILabel!
    @IBOutlet var Image : UIImageView!
    var textArray : [String] = ["Shark", "Whale", "Turtle", "Octopus", "Jellyfish", "Dolphins"]
    var imageArray = [#imageLiteral(resourceName: "shark.jpg"),#imageLiteral(resourceName: "whale.jpg"),#imageLiteral(resourceName: "turtle.jpg"),#imageLiteral(resourceName: "octopus.jpg"),#imageLiteral(resourceName: "jellyfish.jpg"),#imageLiteral(resourceName: "dolphins.jpg")]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func generateRandomImage() {
        let RandomInt = Int.random(in: 0..<6)
        Label.text = textArray[RandomInt]
        Label.isHidden = false
        Image.image = imageArray[RandomInt]
    }
}

