//
//  WordsModel.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 25.03.2023.
//

import Foundation

//words API info
/*
 URL:
 https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19
 JSODResponse:
 {
   "words": [
     "Adidas Yeezy",
     "Sony Playstation",
     "Nike Air",
     "Puma",
     "BMW X6",
     "Xbox One",
     "Jack Daniels",
     "New Balance",
     "Reebok Classic",
     "Rolex"
   ]
 }
 */

struct WordsModel: Codable {
    let words: [String]
}
