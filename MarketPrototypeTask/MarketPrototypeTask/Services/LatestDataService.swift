//
//  LatestDataService.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 14.03.2023.
//

import Combine
import Foundation

class LatestDataService {
    @Published var allLatest: [Latest] = []
    var latestSubscription: AnyCancellable?
    
    init() {
        getLatest()
    }
    
    private func getLatest() {
        guard let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")
        else {
            return }
        latestSubscription = NetworkingManager.download(url: url)
            .decode(type: LatestModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] returnedLatest in
                self?.allLatest = returnedLatest.latest
                self?.latestSubscription?.cancel()
            })
    }
}
