//
//  AUTableViewCell.swift
//  AU Map
//
//  Created by Sasori on 17/8/2567 BE.
//

import UIKit

class AUTableViewCell: UITableViewCell {

    
    @IBOutlet var title: UILabel!
    @IBOutlet var imageLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
