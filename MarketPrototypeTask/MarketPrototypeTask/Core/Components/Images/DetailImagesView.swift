//
//  DetailImagesView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 22.03.2023.
//

import SwiftUI

struct DetailImagesView: View {
    
    @StateObject var vm: DetailImagesViewModel
    @Binding var index: Int
    @Binding var image: UIImage?
    let screen = UIScreen.main.bounds

    
    init(details: DetailInfoModel, index: Binding<Int>, image: Binding<UIImage?>) {
        _vm = StateObject(wrappedValue: DetailImagesViewModel(details: details))
        _index = index
        _image = image
    }
    
    
    var body: some View {
        ScrollView(.horizontal) {
        LazyHStack {
            ForEach( vm.images.indices, id: \.self) { index in
                if let unwrappedImage = vm.images[index] {
                    
                    Image(uiImage: unwrappedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: self.index == index ? 83 : 65, height: self.index == index ? 45 : 37)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.index = index
                            self.image = vm.images[index]
                        }
                    }
                }
            }
        .frame(width: screen.width)
        }
        .onReceive(vm.$images) { images in
            if let unwrappedImage = images.first {
                image = unwrappedImage
            }
        }
    }
}

struct DetailImagesView_Previews: PreviewProvider {
    static var previews: some View {
        DetailImagesView(details: dev.details, index: .constant(0), image: .constant(nil))
    }
}
