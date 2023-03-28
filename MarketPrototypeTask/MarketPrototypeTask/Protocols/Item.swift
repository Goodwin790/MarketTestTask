//
//  Item.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 20.03.2023.
//

import Foundation
protocol Item: Identifiable {
    var id: String { get }
    var name: String { get }
    var category: String { get }
    var price: Int { get }
    var imageURL: String { get }
}
