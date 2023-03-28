//
//  PhotoCaoruselView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 26.03.2023.
//

import SwiftUI

struct PhotoCaoruselView: View {
    
    @StateObject var vm: DetailImagesViewModel
    @Binding var index: Int
    
    init(details: DetailInfoModel, index: Binding<Int>) {
        _vm = StateObject(wrappedValue: DetailImagesViewModel(details: details))
        _index = index
    }
    
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach( vm.images.indices, id: \.self) { index in
                    if let unwrappedImage = vm.images[index] {
                        
                        Image(uiImage: unwrappedImage)
                        
                            .resizable()
                            .scaledToFill()
                        
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

struct PhotoCaoruselView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaoruselView(details: dev.details, index: .constant(0))
    }
}
