import UIKit

class AppDailyUsageViewCell: UITableViewCell {
    
    @IBOutlet weak var usage_day: UILabel!
    @IBOutlet weak var usage_day_time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
