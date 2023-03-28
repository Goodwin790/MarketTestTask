//
//  Page1ViewModel.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 14.03.2023.
//

import Combine
import Foundation
import SwiftUI

class Page1ViewModel: ObservableObject {
    
    @Published var allItems: [ItemModel] = []
    @Published var allUsers: [UserEntity] = []
    @Published var allDetails: DetailInfoModel? = nil
    @Published var detailImages: [UIImage] = []
    @Published var words: WordsModel? = nil
    
    private let latestService = LatestDataService()
    private let saleService = FlashSaleDataService()
    private let userDataService = UserDataService()
    private let detailInfo = DetailInfoDataService()
    private var wordsService = WordsDataService()
    private var cancellables = Set<AnyCancellable>()
    
    let data = ["apple", "banana", "cherry", "orange", "pear"]
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        latestService.$allLatest
            .zip(saleService.$allSales)
            .compactMap { (latestModels, flashSaleModels) -> [ItemModel]? in
                guard !latestModels.isEmpty, !flashSaleModels.isEmpty else { return nil }
                
                var itemModels = [ItemModel]()
                
                for flashSale in flashSaleModels {
                    let itemModel = ItemModel(category: flashSale.category,
                                              name: flashSale.name,
                                              price: flashSale.price,
                                              discount: flashSale.discount,
                                              imageURL: flashSale.imageURL,
                                              currentCart: flashSale.currentCart)
                    itemModels.append(itemModel)
                }
                
                for latest in latestModels {
                    let itemModel = ItemModel(category: latest.category,
                                              name: latest.name,
                                              price: Double(latest.price),
                                              discount: nil,
                                              imageURL: latest.imageURL,
                                              currentCart: latest.currentCart)
                    itemModels.append(itemModel)
                }
                
                return itemModels
            }
            .sink { [weak self] itemModels in
                self?.allItems = itemModels
            }
            .store(in: &cancellables)
        
        detailInfo.$allDetails
            .sink { [weak self] returnedDetails in
                self?.allDetails = returnedDetails
            }
            .store(in: &cancellables)
        
        wordsService.$words
            .sink { [weak self] returnedWords in
                self?.words = returnedWords
            }
            .store(in: &cancellables)
        
    }
    
    func addUser(firstName: String, lastName: String, email: String) -> Bool {
        let newUser
        = UserModel(firstName: firstName.lowercased(), lastName: lastName.lowercased(), email: email.lowercased())
        return userDataService.userAlreadyExists(user: newUser)
    }
    
    func userIsExist(firstName: String) -> Bool {
        return userDataService.userInputValidData(firstName: firstName)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func updateCart(price: Int, amount: Int) -> String {
        return "#\(price * amount)"
    }
    
    func search(searchText: String) -> [ItemModel] {
        return allItems.filter { $0.name.contains(searchText)}
    }
    
    func filteredSuggestions (searchText: String) -> [String] {
        if searchText.isEmpty
            ||
            !(words?.words.filter { $0.lowercased() == searchText.lowercased() }.isEmpty ?? false) {
            return []
        } else {
            return words?.words.filter { $0.lowercased().contains(searchText.lowercased()) } ?? []
        }
    }
    
}

