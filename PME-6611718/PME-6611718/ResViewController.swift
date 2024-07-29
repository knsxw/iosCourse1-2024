//
//  ResViewController.swift
//  PME-6611718
//
//  Created by Sasori on 27/7/2567 BE.
//

import UIKit

class ResViewController: UIViewController {

    var restaurant: Restaurant?
    @IBOutlet var resDescription: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var resLocation: UILabel!
    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var resImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        resDescription.text = restaurant?.description
        resName.text = restaurant?.name
        price.text = "💲\(restaurant?.price ??  "")"
        time.text = "🕒\(restaurant?.openingTime ?? "")"
        rating.text = "\(restaurant!.rating) ⭐⭐⭐⭐"
        resImage.image = UIImage(named: restaurant?.images[0] ?? "")
        resLocation.text = restaurant?.location
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
