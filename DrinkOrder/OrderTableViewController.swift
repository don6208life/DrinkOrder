//
//  OrderTableViewController.swift
//  DrinkOrder
//
//  Created by Don Chan on 2022/9/28.
//

import UIKit

class OrderTableViewController: UITableViewController
{

    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkTitleLabel: UILabel!
    @IBOutlet weak var drinkDescriptipnLabel: UILabel!
    
    @IBOutlet weak var hot: UIButton!
    @IBOutlet weak var cold: UIButton!
    
    @IBOutlet weak var noIce: UIButton!
    @IBOutlet weak var reduceIce: UIButton!
    @IBOutlet weak var normalIce: UIButton!
    
    
    @IBOutlet weak var iceLabel: UILabel!
    @IBOutlet weak var noIceLabel: UILabel!
    @IBOutlet weak var reduceIceLabel: UILabel!
    @IBOutlet weak var normalIceLabel: UILabel!
    
    @IBOutlet weak var noSugar: UIButton!
    @IBOutlet weak var microSugar: UIButton!
    @IBOutlet weak var fewSugar: UIButton!
    @IBOutlet weak var normalSugar: UIButton!
    
    let drinkDetail: DrinkMenu
    
    var hotTemp: Bool = false
    var coldTemp: Bool = false
    
    var noIceChoice: Bool = false
    var reduceIceChoice: Bool = false
    var normalIceChoice: Bool = false
    
    var noSugarChoice: Bool = false
    var microSugarChoice: Bool = false
    var fewSugarChoice: Bool = false
    var normalSugarChoice: Bool = false
        
    @IBOutlet weak var quantityLabel: UILabel!
    
    var orderName: String = ""
    var orderTemp: String = ""
    var orderIce: String = ""
    var orderSugar: String = ""
    var orderNo = 1
    
    
    var quantity = 0
    var productPrice = 0
   
    
    init?(coder: NSCoder, drinkDetail: DrinkMenu){
        self.drinkDetail = drinkDetail
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
     
        drinkImage.image = UIImage(named: drinkDetail.image)
        drinkTitleLabel.text = drinkDetail.name
        drinkDescriptipnLabel.text = drinkDetail.description
        quantityLabel.text = String(quantity)
   
    }
    
    @IBAction func hotButton(_ sender: UIButton)
    {
        //設定飲料溫度指標
        hotTemp = true
        coldTemp = false
        //設定button背景顏色(被選擇的為黑色)
        sender.configuration?.background.backgroundColor = UIColor.black
        cold.configuration?.background.backgroundColor = UIColor.white
        //設定冰塊選項外觀變為灰色代表無法使用
        iceOptionOutward()
    }
    
    @IBAction func coldButton(_ sender: UIButton)
    {
        //設定飲料溫度指標
        hotTemp = false
        coldTemp = true
        //設定button背景顏色(被選擇的為黑色)
        sender.configuration?.background.backgroundColor = UIColor.black
        hot.configuration?.background.backgroundColor = UIColor.white
        //設定冰塊選項外觀
        iceOptionOutward()
    }
        
    @IBAction func noIceButton(_ sender: UIButton)
    {
        //判斷若為熱飲卻點選冰塊選項禁用並跳出警示
        if hotTemp == true
        {
            iceOptionDisableAlert()
        }
        else
        {
            coldTemp = true//若使用者直接點選冰塊量主動設定為冷飲
            //為免使用者為設定溫度直接選冰塊主動設定冷飲button背景黑色
            cold.configuration?.background.backgroundColor = UIColor.black
            //冰塊量指標設定
            noIceChoice = true
            reduceIceChoice = false
            normalIceChoice = false
            //將被選擇的冰塊量button背景色設為黑色
            sender.configuration?.background.backgroundColor = UIColor.black
            //其餘選項背景色設為白色
            reduceIce.configuration?.background.backgroundColor = UIColor.white
            normalIce.configuration?.background.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func reduceIceButton(_ sender: UIButton)
    {
        //判斷若為熱飲卻點選冰塊選項禁用並跳出警示
        if hotTemp == true
        {
            iceOptionDisableAlert()
        }
        else
        {
            coldTemp = true//若使用者直接點選冰塊量主動設定為冷飲
            //為免使用者為設定溫度直接選冰塊主動設定冷飲button背景黑色
            cold.configuration?.background.backgroundColor = UIColor.black
            //冰塊量指標設定
            noIceChoice = false
            reduceIceChoice = true
            normalIceChoice = false
            //將被選擇的冰塊量button背景色設為黑色
            sender.configuration?.background.backgroundColor = UIColor.black
            //其餘選項背景色設為白色
            noIce.configuration?.background.backgroundColor = UIColor.white
            normalIce.configuration?.background.backgroundColor = UIColor.white
        }
    }
        
    @IBAction func normalIce(_ sender: UIButton)
    {
        //若使用者直接點選冰塊量主動設定為冷飲
        if hotTemp == true
        {
            iceOptionDisableAlert()
        }
        else
        {
            coldTemp = true//若使用者直接點選冰塊量主動設定為冷飲
            //為免使用者為設定溫度直接選冰塊主動設定冷飲button背景黑色
            cold.configuration?.background.backgroundColor = UIColor.black
            //冰塊量指標設定
            noIceChoice = false
            reduceIceChoice = false
            normalIceChoice = true
            //將被選擇的冰塊量button背景色設為黑色
            sender.configuration?.background.backgroundColor = UIColor.black
            //其餘選項背景色設為白色
            noIce.configuration?.background.backgroundColor = UIColor.white
            reduceIce.configuration?.background.backgroundColor = UIColor.white
        }
    }
//MARK: - Sugar button
    @IBAction func noSugarButton(_ sender: UIButton)
    {
        noSugarChoice = true
        microSugarChoice = false
        fewSugarChoice = false
        normalSugarChoice = false
        
        noSugar.configuration?.background.backgroundColor = UIColor.black
        microSugar.configuration?.background.backgroundColor = UIColor.white
        fewSugar.configuration?.background.backgroundColor = UIColor.white
        normalSugar.configuration?.background.backgroundColor = UIColor.white
        
    }
    
    @IBAction func microSugarButton(_ sender: UIButton)
    {
        noSugarChoice = false
        microSugarChoice = true
        fewSugarChoice = false
        normalSugarChoice = false
        
        noSugar.configuration?.background.backgroundColor = UIColor.white
        microSugar.configuration?.background.backgroundColor = UIColor.black
        fewSugar.configuration?.background.backgroundColor = UIColor.white
        normalSugar.configuration?.background.backgroundColor = UIColor.white
    }
    
    @IBAction func fewSugarButton(_ sender: UIButton)
    {
        noSugarChoice = false
        microSugarChoice = false
        fewSugarChoice = true
        normalSugarChoice = false
            
        noSugar.configuration?.background.backgroundColor = UIColor.white
        microSugar.configuration?.background.backgroundColor = UIColor.white
        fewSugar.configuration?.background.backgroundColor = UIColor.black
        normalSugar.configuration?.background.backgroundColor = UIColor.white
        
    }
    
    @IBAction func normalSugarButton(_ sender: UIButton)
    {
        noSugarChoice = false
        microSugarChoice = false
        fewSugarChoice = false
        normalSugarChoice = true
        
        noSugar.configuration?.background.backgroundColor = UIColor.white
        microSugar.configuration?.background.backgroundColor = UIColor.white
        fewSugar.configuration?.background.backgroundColor = UIColor.white
        normalSugar.configuration?.background.backgroundColor = UIColor.black
    }
//MARK: - Quantity setup
    @IBAction func reduceQuantity(_ sender: UIButton)
    {
        if quantity == 0
        {
            let controller = UIAlertController(title: "數量", message: "數量為0", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "確認", style: .default)
            controller.addAction(confirmAction)
            present(controller, animated: true)
            
        }
        else
        {
            quantity -= 1
            quantityLabel.text = String(quantity)
        }
    }
    
    @IBAction func addQuantity(_ sender: UIButton)
    {
        quantity += 1
        quantityLabel.text = String(quantity)
    }
//MARK: - Shopping Car
    @IBAction func shoppingCar(_ sender: UIButton)
    {
        orderName = drinkTitleLabel.text ?? ""
        if hotTemp == false && coldTemp == false
        {
            let controller = UIAlertController(title: "溫度", message: "溫度未選擇", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "確認", style: .default)
            controller.addAction(confirmAction)
            present(controller, animated: true)
        }
        else if coldTemp == true && noIceChoice == false && reduceIceChoice == false && normalIceChoice == false
        {
            let controller = UIAlertController(title: "冰塊", message: "冰塊量未選擇", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "確認", style: .default)
            controller.addAction(confirmAction)
            present(controller, animated: true)
        }
        else if noSugarChoice == false && microSugarChoice == false && fewSugarChoice == false && normalSugarChoice == false
        {
            let controller = UIAlertController(title: "甜度", message: "甜度未選擇", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "確認", style: .default)
            controller.addAction(confirmAction)
            present(controller, animated: true)
        }
        else if quantity == 0
        {
            let controller = UIAlertController(title: "數量", message: "數量未提供", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "確認", style: .default)
            controller.addAction(confirmAction)
            present(controller, animated: true)
            
        }
        else
        {
            if hotTemp == true
            {
                orderTemp = "熱飲"
                
            }
            else
            {
                orderTemp = "冷飲"
            }
            
            if noIceChoice == true
            {
                orderIce = "去冰"
            }
            else if reduceIceChoice == true
            {
                orderIce = "少冰"
            }
            else if normalIceChoice == true
            {
                orderIce = "冰塊正常"
            }
            
            if noSugarChoice == true
            {
                orderSugar = "無糖"
            }
            else if microSugarChoice == true
            {
                orderSugar = "微糖"
            }
            else if fewSugarChoice == true
            {
                orderSugar = "少糖"
            }
            else
            {
                orderSugar = "正常"
            }
        }
        priceCalculate()
        uploadDrinkShoppingCar()
    }
    
    func iceOptionOutward()
    {
        if hotTemp == true
        {
            //熱飲選項將所有冰塊指標設為false
            noIceChoice = false
            reduceIceChoice = false
            normalIceChoice = false
            
            //選擇熱飲將冰塊選項字體及灰色讓使用者直覺無法點選
            iceLabel.textColor = UIColor.gray
            noIceLabel.textColor = UIColor.gray
            reduceIceLabel.textColor = UIColor.gray
            normalIceLabel.textColor = UIColor.gray
            
            //將button外觀線變灰色
            noIce.configuration?.background.strokeColor = UIColor.gray
            reduceIce.configuration?.background.strokeColor = UIColor.gray
            normalIce.configuration?.background.strokeColor = UIColor.gray
            
            //為防使用者先點選冰塊之後點選熱飲造成冰塊button及熱飲button皆標示成黑色
            noIce.configuration?.background.backgroundColor = UIColor.white
            reduceIce.configuration?.background.backgroundColor = UIColor.white
            normalIce.configuration?.background.backgroundColor = UIColor.white
        }
        else
        {
            //冷飲選項將label字體設為黑色,表示可供選擇
            iceLabel.textColor = UIColor.black
            noIceLabel.textColor = UIColor.black
            reduceIceLabel.textColor = UIColor.black
            normalIceLabel.textColor = UIColor.black
            //冷飲選項將button外框線設為黑色,表示可供選擇
            noIce.configuration?.background.strokeColor = UIColor.black
            reduceIce.configuration?.background.strokeColor = UIColor.black
            normalIce.configuration?.background.strokeColor = UIColor.black
        }
    }
//MARK: - Special Func
    func iceOptionDisableAlert()
    {
        let controller = UIAlertController(title: "冷飲專用選項", message: "熱飲不適用", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "確認", style: .default)
        controller.addAction(confirmAction)
        present(controller, animated: true)
    }
    
    func priceCalculate()
    {
        switch orderName
        {
            case "娜杯紅茶拿鐵":
                productPrice = quantity * 60
                break
            case "白甘蔗青茶":
                productPrice = quantity * 75
                break
            case "青檸香茶":
                productPrice = quantity * 75
                break
            case "柳丁綠茶":
                productPrice = quantity * 75
                break
            case "芋頭鮮奶":
                productPrice = quantity * 80
                break
            case "珍珠伯爵紅茶拿鐵":
                productPrice = quantity * 70
                break
            case "珍珠焙香決明大麥":
                productPrice = quantity * 50
                break
            case "珍珠手炒黑糖鮮奶":
                productPrice = quantity * 80
                break
            case "芋圓茉香綠茶拿鐵":
                productPrice = quantity * 75
                break
            case "仙草凍冬瓜茶":
                productPrice = quantity * 50
                break
            default:
                break
            }
       
        
    }
    
    func uploadDrinkShoppingCar()
    {
        let shoppingCar = ShoppingCar(orderno: orderNo, orderName: orderName, temp: orderTemp, ice: orderIce, sugar: orderSugar, quantity: quantity, price: productPrice)
        
        let url = URL(string: "https://sheetdb.io/api/v1/kxpbh1nqkuzts")!
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let body = ShoppingCarBody(data: [shoppingCar])
        request.httpBody = try? encoder.encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error
            in
            if data != nil
            {
                do{
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                        }
                }
            }
        }.resume()
    }
    
    
 
    
    
    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
