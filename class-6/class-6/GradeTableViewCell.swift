//
//  GradeTableViewCell.swift
//  class-6
//
//  Created by Sasori on 6/7/2567 BE.
//

import UIKit

class GradeTableViewCell: UITableViewCell {

    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        gradeLabel.textColor = .red
        backgroundColor = .green
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
