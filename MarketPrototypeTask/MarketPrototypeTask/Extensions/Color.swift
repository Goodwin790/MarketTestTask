//
//  Color.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 10.03.2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }

}

struct ColorTheme {
    let field = Color("FieldsColor")
    let background = Color("BackgroundColor")
    let foreground = Color("ForegroundTextFieldColor")
    let search = Color("BackgroundSearchColor")
    let cartPrice = Color("PriceOfCartColor")
}
