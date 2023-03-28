//
//  ItemImageView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 20.03.2023.
//

import SwiftUI



struct ItemImageView: View {
    
    @StateObject var vm: ItemImageViewModel
    
    init(item: ItemModel) {
        _vm = StateObject(wrappedValue: ItemImageViewModel(item: item))
    }
    
    var body: some View {
        if let image = vm.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .scaleEffect(1.2)
                .clipped()
        } else if vm.isLoading {
            ProgressView()
        } else {
            Image(systemName: "questionmark")
                .foregroundColor(.gray)
        }
    }
}

struct ItemImageView_Previews: PreviewProvider {
    static var previews: some View {
        ItemImageView(item: dev.item)
    }
}
