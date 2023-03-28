//
//  FavoriteView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 23.03.2023.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject private var vm: Page1ViewModel
    var body: some View {
        Text("Favorite")
            .font(.largeTitle)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(dev.homeVm)
    }
}
