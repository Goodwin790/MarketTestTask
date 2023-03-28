//
//  ItemImageService.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 20.03.2023.
//

import Combine
import Foundation
import SwiftUI

class ItemImageService: ObservableObject {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let item: ItemModel
    
    init(item: ItemModel) {
        self.item = item
        getLatestImage()
    }
    
    private func getLatestImage() {
        guard let url = URL(string: item.imageURL)
        else {
            return }
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
    
}
