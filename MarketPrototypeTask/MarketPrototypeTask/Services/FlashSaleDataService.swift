//
//  FlashSaleDataService.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 14.03.2023.
//

import Combine
import Foundation

class FlashSaleDataService {
    @Published var allSales: [FlashSale] = []
    var salesSubscription: AnyCancellable?
    
    init() {
        getSales()
    }
    
    private func getSales() {
        guard let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac") else {
            return }
        salesSubscription = NetworkingManager.download(url: url)
            .decode(type: FlashSaleModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] returnedSales in
                self?.allSales = returnedSales.flashSale
                self?.salesSubscription?.cancel()
            })
    }
}
