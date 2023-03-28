//
//  ItemColumnView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 13.03.2023.
//

import SwiftUI

struct ItemColumnView: View {
    let item: ItemModel
    var body: some View {
        ZStack {
            //  RoundedRectangle(cornerRadius: 10)
            ItemImageView(item: item)
            VStack {
                if item.discount != nil {
                    saleSection
                }
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
            .frame(width: 114, height: 149)
        }
        .frame(width: 114, height: 149)
        .cornerRadius(10)
        .clipped()
    }
}

struct ItemColumnView_Previews: PreviewProvider {
    static var previews: some View {
        SaleColumnView(item: dev.item)
            .previewLayout(.sizeThatFits)
    }
}

extension ItemColumnView {
    
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
            ZStack {
                if item.discount != nil {
                    Image("SaleField")
                    Text("\(item.discount ?? 0)% off" )
                        .font(.custom("Montserrat-Medium", size: 7.89))
                }
            }
        }
        .padding(9)
    }
    
}
