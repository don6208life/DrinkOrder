//
//  OrderSuccessViewController.swift
//  DrinkOrder
//
//  Created by Don Chan on 2022/10/7.
//

import UIKit

class OrderSuccessViewController: UIViewController
{

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var information: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        image.image = UIImage.animatedImageNamed("drink-", duration: 1)
        information.text = "感謝訂購,您的飲料製作中"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
