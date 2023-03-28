//
//  LatestColumnView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 13.03.2023.
//

import SwiftUI

struct LatestColumnView: View {
    let item: ItemModel
    var body: some View {
        ZStack {
            ItemImageView(item: item)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 2) {
                    Spacer()
                    categoryRow
                    nameRow
                    priceRow
                }
                .padding(.horizontal, 2)
                Spacer()
                plusButton
            }
            .padding(.bottom, 5)
            .padding(.horizontal, 5)
            .frame(width: 114, height: 149)
            .cornerRadius(10)
            
        }
        .frame(width: 114, height: 149)
        .cornerRadius(10)
        .clipped()
    }
}

struct LatestColumnView_Previews: PreviewProvider {
    static var previews: some View {
        LatestColumnView(item: dev.item)
            .previewLayout(.sizeThatFits)
    }
}

extension LatestColumnView {
    
    private var categoryRow: some View {
        ZStack {
            Image("CategoryFieldLatest")
            Text(item.category)
                .font(.custom("Montserrat-Medium", size: 7.14))
        }
        .padding(.bottom, 4)
    }
    
    private var nameRow: some View {
        Text(item.name)
            .font(.custom("Montserrat-Medium", size: 9.14))
            .foregroundColor(.white)
            .padding(.bottom, 19)
    }
    
    private var priceRow: some View {
        Text(Double(item.price).asCurrencyWith2Decimals())
            .font(.custom("Montserrat-Medium", size: 6.45))
            .foregroundColor(.white)
    }
    
    private var plusButton: some View {
        Button {
            print("Button + is tapped")
        } label: {
            Image("PlusButtonLatest")
        }
    }
    
}
