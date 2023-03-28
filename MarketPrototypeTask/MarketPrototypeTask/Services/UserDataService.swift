//
//  UserDataService.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 17.03.2023.
//

import CoreData
import Foundation

class UserDataService {
    
    private let container: NSPersistentContainer
    private let containerName: String = "UsersContainer"
    private let entityName: String = "UserEntity"
    @Published var savedEntities: [UserEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
        }
        self.getUsers()
    }
    
    
    //MARK: Public
    
    func userAlreadyExists(user: UserModel) -> Bool {
        if (savedEntities.first(where: { $0.firstName?.lowercased() == user.firstName.lowercased() }) != nil) {
            print("User exist")
            return true
        } else {
            add(user: user)
            print("User added")
        }
        return false
    }
    
    func userInputValidData(firstName: String) -> Bool {
        if (savedEntities.first(where: { $0.firstName == firstName }) != nil)  {
            return true
        }
        return false
    }
    
    //MARK: Private
    
    private func getUsers() {
        let request = NSFetchRequest<UserEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching User Entities! \(error)")
        }
    }
    
    private func add(user: UserModel) {
        let entity = UserEntity(context: container.viewContext)
        entity.firstName = user.firstName
        entity.lastName = user.lastName
        entity.email = user.email
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data! \(error)")
        }
    }
    // if delete needed
    private func delete(entity: UserEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func applyChanges() {
        save()
        getUsers()
    }
    
}
