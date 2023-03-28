//
//  DetailImagesViewModel.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 22.03.2023.
//

import Combine
import Foundation
import SwiftUI

class DetailImagesViewModel: ObservableObject {
    @Published var images: [UIImage?] = []
    
    private let details: DetailInfoModel
    private let dataService: DetailImagesService
    private var cancellables = Set<AnyCancellable>()
    
    init(details: DetailInfoModel) {
        self.details = details
        self.dataService = DetailImagesService(detials: details)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$images
            .sink { [weak self] returnedImages in
                self?.images = returnedImages
            }
            .store(in: &cancellables)
    }
    
}
