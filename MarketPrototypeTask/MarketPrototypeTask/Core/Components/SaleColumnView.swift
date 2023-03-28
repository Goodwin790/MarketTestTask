//
//  SaleColumnView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 13.03.2023.
//

import SwiftUI

struct SaleColumnView: View {
    let item: ItemModel
    var body: some View {
        ZStack {
            //  RoundedRectangle(cornerRadius: 10)
            ItemImageView(item: item)
            VStack {
                saleSection
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 2) {
                        
                        Spacer()
                        categoryRow
                        nameRow
                        priceRow
                    }
                    .padding(.horizontal, 4)
                    Spacer()
                    likeButton
                        .padding(.bottom, 4)
                    plusButton
                }
                .padding(.bottom, 5)
                .padding(.horizontal, 5)
            }
            .frame(width: 174, height: 221)
        }
        .frame(width: 174, height: 221)
        .cornerRadius(13)
        .clipped()
    }
}

struct SaleColumnView_Previews: PreviewProvider {
    static var previews: some View {
        SaleColumnView(item: dev.item)
            .previewLayout(.sizeThatFits)
    }
}

extension SaleColumnView {
    
    private var categoryRow: some View {
        ZStack {
            Image("CategoryFieldLatest")
            Text(item.category)
                .font(.custom("Montserrat-Medium", size: 7.14))
        }
        .padding(.bottom, 8)
    }
    
    private var nameRow: some View {
        Text(item.name)
            .font(.custom("Montserrat-Medium", size: 13))
            .foregroundColor(.white)
            .padding(.bottom, 15)
    }
    
    private var priceRow: some View {
        Text(Double(item.price).asCurrencyWith2Decimals())
            .font(.custom("Montserrat-Medium", size: 9.22))
            .foregroundColor(.white)
            .padding(.bottom, 10)
    }
    
    private var plusButton: some View {
        Button {
            print("Button + is tapped")
        } label: {
            Image("SalePlusButton")
        }
    }
    
    private var likeButton: some View {
        Button {
            print("Like")
        } label: {
            Image("SaleLikeIcon")
        }
    }
    
    private var saleSection: some View {
        HStack(alignment: .top) {
            Image("SaleIcon")
            Spacer()
            if item.discount != nil {
                ZStack {
                    Image("SaleField")
                    Text("\(item.discount ?? 0)% off" )
                        .font(.custom("Montserrat-Medium", size: 7.89))
                }
            }
        }
        .padding(9)
    }
    
}
