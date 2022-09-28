//
//  ShoppingCarViewController.swift
//  DrinkOrder
//
//  Created by Don Chan on 2022/10/5.
//

import UIKit

class ShoppingCarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var myTable: UITableView!
    
    
    
    var loadShoppingCars = [LoadShoppingCar]()
    
    func fetchShoppingCar()
    {
        var index = 0
        var total = 0
        
        if let url = URL(string: "https://sheetdb.io/api/v1/kxpbh1nqkuzts")
        {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data
                {
                    do{
                        let decoder = JSONDecoder()
                        self.loadShoppingCars = try decoder.decode([LoadShoppingCar].self, from: data)
                        DispatchQueue.main.async {
                            self.myTable.reloadData()
                            for _ in self.loadShoppingCars
                            {
                                total += Int(self.loadShoppingCars[index].price) ?? 0
                                index += 1
                                self.totalCost.text = "總金額 ＝ \(String(total))元"
                            }
                        }
                    }
                    catch{
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
       
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        fetchShoppingCar()
        //當從shoppingcar返回menu修改訂單後返回shoppingcar自動更新
        
        
    }

    @IBAction func confirm(_ sender: UIButton)
    {
        let url = URL(string: "https://sheetdb.io/api/v1/kxpbh1nqkuzts/orderno/1")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse{
                print(httpResponse.statusCode)
            }
        }.resume()
    }
    
    @IBAction func cancelOrder(_ sender: UIButton)
    {
        totalCost.text = "總金額 = 0元"
        let url = URL(string: "https://sheetdb.io/api/v1/kxpbh1nqkuzts/orderno/1")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse{
                print(httpResponse.statusCode)
            }
        }.resume()
    }
    
   
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return loadShoppingCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ShoppingCarTableViewCell.self)", for: indexPath) as! ShoppingCarTableViewCell
        let shoppingCar = loadShoppingCars[indexPath.row]
        
            cell.productName.text = "品名：\(shoppingCar.orderName)"
            cell.temp.text = "冷/熱：\(shoppingCar.temp)"
            if shoppingCar.temp == "熱飲"
            {
                cell.ice.text = "冰塊：熱飲不適用"
            }
            else
            {
                cell.ice.text = "冰塊：\(shoppingCar.ice)"
            }
            cell.sugar.text = "甜度：\(shoppingCar.sugar)"
            cell.quantity.text = "數量：\(String(shoppingCar.quantity))"
            cell.price.text = "價格：\(String(shoppingCar.price))元"
            cell.drinkImage.image = UIImage(named: shoppingCar.orderName)
        
            return cell
    }

}
