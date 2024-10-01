//
//  MovieTableViewCell.swift
//  API_Test
//
//  Created by Sasori on 1/10/2567 BE.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var poster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
