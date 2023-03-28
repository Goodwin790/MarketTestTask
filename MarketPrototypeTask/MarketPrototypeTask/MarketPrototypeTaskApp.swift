//
//  MarketPrototypeTaskApp.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 10.03.2023.
//

import SwiftUI

@main
struct MarketPrototypeTaskApp: App {
    @StateObject private var vm = Page1ViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
            SignInPage()
            }
            .environmentObject(vm)
        }
    }
}
