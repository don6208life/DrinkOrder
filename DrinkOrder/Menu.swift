//
//  Menu.swift
//  DrinkOrder
//
//  Created by Don Chan on 2022/9/28.
//

import Foundation

struct DrinkMenu: Codable
{
    let name: String
    let image: String
    let price: String
    let description: String
    let cal: String
}
    
struct ShoppingCar: Codable
{
    let orderno: Int
    let orderName: String
    let temp: String
    let ice: String
    let sugar: String
    let quantity: Int
    let price: Int
}

struct LoadShoppingCar: Codable
{
    let orderName: String
    let temp: String
    let ice: String
    let sugar: String
    let quantity: String
    let price: String
}


//    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
//    static func loadDrink() -> [ShoppingCar]? {
//        let url = documentsDirectory.appendingPathComponent("shoppingCar")
//        guard let data = try? Data(contentsOf: url) else{return nil}
//        let decoder = JSONDecoder()
//        return try? decoder.decode([ShoppingCar].self, from: data)
//    }
//
//    static func saveDrink(_ drink: [Self]){
//        let encoder = JSONEncoder()
//        guard let data = try? encoder.encode(drink) else {return}
//        let url = documentsDirectory.appendingPathComponent("shoppingCar")
//        try? data.write(to: url)
//    }


