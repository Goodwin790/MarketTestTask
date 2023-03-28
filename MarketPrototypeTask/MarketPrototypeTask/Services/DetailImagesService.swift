//
//  DetailImagesService.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 22.03.2023.
//

import Combine
import Foundation
import SwiftUI


class DetailImagesService: ObservableObject {
    
    @Published var images: [UIImage?] = []
    
    private var imageSubscription: AnyCancellable?
    private let detials: DetailInfoModel
    
    init(detials: DetailInfoModel) {
        self.detials = detials
        getLatestImages()
    }
    
    private func getLatestImages() {
        for imageURL in detials.imageUrls {
            guard let url = URL(string: imageURL) else {
                continue
            }
            imageSubscription = NetworkingManager.download(url: url)
                .tryMap({ data -> UIImage? in
                    return UIImage(data: data)
                })
                .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] returnedImage in
                    guard let self = self else { return }
                    self.images.append(returnedImage)
                    if self.images.count == self.detials.imageUrls.count {
                        self.imageSubscription?.cancel()
                    }
                })
        }
    }
    
}






