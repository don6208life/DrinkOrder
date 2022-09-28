//
//  DrinkMenuTableViewCell.swift
//  DrinkOrder
//
//  Created by Don Chan on 2022/9/28.
//

import UIKit

class DrinkMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var imageShow: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var calLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
