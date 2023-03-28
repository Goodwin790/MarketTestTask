//
//  FlashSaleModel.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 13.03.2023.
//

import Foundation

//Flash sale API info
/*
 URL:
 https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac
 JSODResponse:
 {
 "category": "Kids",
 "name": "New Balance Sneakers",
 "price": 22.5,
 "discount": 30,
 "image_url": "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg"
 }
 */

struct FlashSaleModel: Codable {
    let flashSale: [FlashSale]
    
    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

struct FlashSale: Identifiable, Codable {
    let id = UUID().uuidString
    let category, name: String
    let price: Double
    let discount: Int
    let imageURL: String
    let currentCart: Double?
    
    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
        case currentCart
    }
}
