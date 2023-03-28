//
//  UserModel.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 17.03.2023.
//

import Foundation

struct UserModel {
    let firstName: String
    let lastName: String
    let email: String
    
    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    func updateCompletion() -> UserModel {
        return UserModel(firstName: firstName, lastName: lastName, email: email)
    }
    
}
