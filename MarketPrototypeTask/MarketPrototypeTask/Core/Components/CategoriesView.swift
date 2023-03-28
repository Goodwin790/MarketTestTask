//
//  CategoriesView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 14.03.2023.
//

import SwiftUI

struct CategoriesView: View {
    private let categories = ["Phones", "Headphones", "Games",  "Cars", "Furniture", "Kids"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 19.5){
                ForEach(categories, id: \.self) { category in
                    Button {
                        print("\(category) is tapped.")
                    } label: {
                        Image(category)
                    }
                    
                }
            }
            .padding(.horizontal)
        }
        .padding(EdgeInsets(top: 17, leading: 0, bottom: 36.5, trailing: 0))
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
