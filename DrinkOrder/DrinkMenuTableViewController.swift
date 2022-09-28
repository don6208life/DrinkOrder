//
//  DrinkMenuTableViewController.swift
//  DrinkOrder
//
//  Created by Don Chan on 2022/9/28.
//

import UIKit

class DrinkMenuTableViewController: UITableViewController
{
    var drinks = [DrinkMenu]()
    
    func fetchDrinkMenu()
    {
        if let url = URL(string:"https://sheetdb.io/api/v1/gtyq7i9wju40i")
        {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data
                {
                    do{
                        let decoder = JSONDecoder()
                        self.drinks = try decoder.decode([DrinkMenu].self, from: data)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
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

        fetchDrinkMenu()
    }
    
    
    @IBSegueAction func orderDetail(_ coder: NSCoder) -> OrderTableViewController?
    {
        if let row = tableView.indexPathForSelectedRow?.row
        {
            return OrderTableViewController(coder: coder, drinkDetail: drinks[row])
        }
        else
        {
            return nil
        }
      
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return drinks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DrinkMenuTableViewCell.reuseIdentifier, for: indexPath) as! DrinkMenuTableViewCell
        let drink = drinks[indexPath.row]
        
        cell.titleLabel.text = drink.name
        cell.calLabel.text = "卡路里:\(drink.cal)"
        cell.priceLabel.text = "$\(drink.price)"
        cell.imageShow.image = UIImage(named: drink.image)
        
        return cell
    }
   

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
