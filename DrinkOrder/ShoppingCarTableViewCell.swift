//
//  ShoppingCarTableViewCell.swift
//  DrinkOrder
//
//  Created by Don Chan on 2022/10/5.
//

import UIKit

class ShoppingCarTableViewCell: UITableViewCell
{
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var ice: UILabel!
    @IBOutlet weak var sugar: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
