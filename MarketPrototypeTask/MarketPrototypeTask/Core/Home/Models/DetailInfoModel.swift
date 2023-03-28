//
//  DetailInfoModel.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 21.03.2023.
//

import Foundation

//DetailInfoModel API info
/*
 URL:
 https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239
 JSON Response:
 {
 "name": "Reebok Classic",
 "description": "Shoes inspired by 80s running shoes are still relevant today",
 "rating": 4.3,
 "number_of_reviews": 4000,
 "price": 24,
 "colors": [
 "#ffffff",
 "#b5b5b5",
 "#000000"
 ],
 "image_urls": [
 "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg",
 "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/a94fbe7d8dfb4d3bbaf9ac63000135ed_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_03_standard.jpg",
 "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_05_standard.jpg"
 ]
 }
 */

struct DetailInfoModel: Codable {
    let name, description: String
    let rating: Double
    let numberOfReviews, price: Int
    let colors: [String]
    let imageUrls: [String]
    let currentCart: Double?
    
    enum CodingKeys: String, CodingKey {
        case name, description, rating, price, colors
        case numberOfReviews = "number_of_reviews"
        case imageUrls = "image_urls"
        case currentCart
    }
}
