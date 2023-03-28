//
//  DetailInfoDataService.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 21.03.2023.
//

import Combine
import Foundation

class DetailInfoDataService: ObservableObject {
    @Published var allDetails: DetailInfoModel? = nil
    var detailSubscription: AnyCancellable?
    
    init() {
        getDetail()
        
    }
    
    private func getDetail() {
        guard let url = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239") else {
            return }
        detailSubscription = NetworkingManager.download(url: url)
            .decode(type: DetailInfoModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] returnedDetails in
                self?.allDetails = returnedDetails
                self?.detailSubscription?.cancel()
            })
    }
}
