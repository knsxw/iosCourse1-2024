//
//  PlanetViewController.swift
//  Solar System
//
//  Created by Sasori on 24/8/2567 BE.
//

import UIKit

class PlanetViewController: UIViewController {

    @IBOutlet var planetImageView : UIImageView!
    @IBOutlet var planetName : UILabel!
    
    var img: String?
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        planetImageView.image = UIImage(named: img!)
        planetName.text = name
    }
    
}
