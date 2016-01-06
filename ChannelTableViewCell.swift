//
//  ChannelTableViewCell.swift

import UIKit

class ChannelTableViewCell: UITableViewCell {
    // MARK: Properties
    
    @IBOutlet weak var channelLabel: UILabel! // channel name label
    @IBOutlet weak var channelName: UITextField! //

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
