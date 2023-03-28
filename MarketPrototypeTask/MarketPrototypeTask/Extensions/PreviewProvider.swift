//
//  PreviewProvider.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 13.03.2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() { }
    
    let homeVm = Page1ViewModel()
    
    let item = ItemModel(category: "Phones", name: "Samsung S10", price: 1000, discount: nil, imageURL: "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg", currentCart: 2)
    //    Latest(category: "Phones", name: "Samsung S10", price: 1000, imageURL: "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg", currentCart: 2)
    
    let details = DetailInfoModel(name: "Reebok Classic", description: "Shoes inspired by 80s running shoes are still relevant today", rating: 4.3, numberOfReviews: 4000, price: 24, colors: [
        "#ffffff",
        "#b5b5b5",
        "#000000"
    ], imageUrls: [
        "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg",
        "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/a94fbe7d8dfb4d3bbaf9ac63000135ed_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_03_standard.jpg",
        "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_05_standard.jpg"
    ], currentCart: 1)
}
