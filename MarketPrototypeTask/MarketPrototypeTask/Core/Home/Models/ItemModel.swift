//
//  ItemModel.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 17.03.2023.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID().uuidString
    let category, name: String
    let price: Double
    let discount: Int?
    let imageURL: String
    let currentCart: Double?
}
