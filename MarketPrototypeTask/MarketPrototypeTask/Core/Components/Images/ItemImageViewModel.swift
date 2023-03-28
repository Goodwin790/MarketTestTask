//
//  ItemImageViewModel.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 20.03.2023.
//


import Combine
import Foundation
import SwiftUI

class ItemImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading = false
    
    private let item: ItemModel
    private let dataService: ItemImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(item: ItemModel) {
        self.item = item
        self.dataService = ItemImageService(item: item)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink {[weak self] _ in
                self?.isLoading = false
            } receiveValue: {[weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
        
    }
}
