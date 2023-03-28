//
//  WordsDataService.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 25.03.2023.
//

import Combine
import Foundation

class WordsDataService {
    @Published var words: WordsModel? = nil
    var wordsSubscription: AnyCancellable?
    
    init() {
        getWords()
    }
    
   private func  getWords() {
       guard let url = URL(string:  "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19") else { return }
       wordsSubscription = NetworkingManager.download(url: url)
           .decode(type: WordsModel.self, decoder: JSONDecoder())
           .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedWords in
               self?.words = returnedWords
               self?.wordsSubscription?.cancel()
           })
    }
    
}
