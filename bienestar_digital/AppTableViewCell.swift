import UIKit

class AppTableViewCell: UITableViewCell {
    
    @IBOutlet weak var app_name: UILabel!
    @IBOutlet weak var app_logo: UILabel!
       
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
