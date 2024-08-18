import UIKit

class GradeTableViewCell: UITableViewCell {

    @IBOutlet var code: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var credit: UILabel!
    @IBOutlet var grade: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
