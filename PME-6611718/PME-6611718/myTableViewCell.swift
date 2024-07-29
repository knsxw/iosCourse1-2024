//
//  myTableViewCell.swift
//  PME-6611718
//
//  Created by Sasori on 27/7/2567 BE.
//

import UIKit

class myTableViewCell: UITableViewCell {
    

    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var resLocation: UILabel!
    @IBOutlet weak var resPrice: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var resRating: UILabel!
    @IBOutlet weak var resTime: UILabel!
    @IBOutlet weak var resImage: UIImageView!
    var isFill = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func favoriteAdd(_ sender: Any) {
        if isFill {
            heartButton.setImage(UIImage (systemName: "heart"), for: .normal)
        } else {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            isFill = true
        }
    }
}
