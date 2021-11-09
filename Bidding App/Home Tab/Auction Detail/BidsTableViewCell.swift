//
//  BidsTableViewCell.swift
//  Bidding App
//
//  Created by jiju on 03/11/21.
//

import UIKit

class BidsTableViewCell: UITableViewCell {

    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personName: UILabel!
    @IBOutlet var bidAmt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
