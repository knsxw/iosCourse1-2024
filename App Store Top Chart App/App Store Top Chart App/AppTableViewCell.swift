//
//  AppTableViewCell.swift
//  App Store Top Chart App
//
//  Created by Sasori on 19/7/2567 BE.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var appDescription: UILabel!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        appIcon.layer.cornerRadius = 20
        getButton.layer.cornerRadius = 40
        // Configure the view for the selected state
    }

}
