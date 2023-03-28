//
//  SearchView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 25.03.2023.
//

import SwiftUI



struct SearchView: View {
    
    @EnvironmentObject private var vm: Page1ViewModel
    @State private var searchText = ""
    @State private var showPage2 = false
    @State private var index = 0
    @State private var showSuggestions = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.theme.background.ignoresSafeArea(edges: .top)
            VStack {
                switch index {
                case 1:
                    Text("Favorite")
                        .font(.largeTitle)
                case 2:
                    Text("Cart")
                        .font(.largeTitle)
                case 3:
                    Text("Messages")
                        .font(.largeTitle)
                case 4:
                    ProfileView()
                default:
                    if showPage2 {
                        Page2View(showPage2: $showPage2)
                    } else {
                        
                        ZStack(alignment: .top) {
                            VStack {
                                homeHeader
                                searchSection
                                    CategoriesView()
                                ScrollView(.vertical, showsIndicators: false) {
                                    allLatestList
                                    allSalesList
                                    allBrandsList
                                }
                            }
                            if showSuggestions {
                                VStack(spacing: 1) {
                                    ForEach(vm.filteredSuggestions(searchText: searchText), id: \.self) { suggestion in
                                        SuggestionRow(suggestion: suggestion)
                                            .onTapGesture {
                                                searchText = suggestion
                                                showSuggestions.toggle()
                                            }
                                    }
                                    .animation(.easeInOut(duration: 1), value: searchText)
                                }
                                .padding(.top, 100)
                            }
                        }
                        }
                        Spacer()
                    }
                    
                }
                tabBar
            }
        }
    }
    
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                Page1View()
            }
            .environmentObject(dev.homeVm)
        }
    }
    
    
    extension SearchView {
        
        private var homeHeader: some View {
            VStack {
                HStack(alignment: .center, spacing: 30) {
                    Image("Menu")
                    Spacer()
                    Image("TradeByBata")
                    Spacer()
                    Image("ProfilePhotoP1")
                }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 40))
                HStack {
                    Spacer()
                    Image("Location")
                    Image("BottomShevron")
                }
                .padding(.trailing, 28)
            }
        }
        
        private var searchSection: some View {
            VStack {
                ZStack (alignment: .top) {
              
                    TextField("What are you looking for?", text: $searchText)
                        .font(.custom("Montserrat_Medium", size: 9.3))
                        .multilineTextAlignment(.center)
                        .frame(width: 262, height: 24)
                        .background(Color.theme.search)
                        .cornerRadius(13)
                        .padding(5)
                        .onChange(of: searchText, perform: { value in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                showSuggestions = !vm.filteredSuggestions(searchText: searchText).isEmpty
                            }
                        })
                    Image("SearchMark")
                        .padding(.leading, 230)
                        .padding(.top, 10)
                    
                    
                }
            }
        }
        
        private var allLatestList: some View {
            VStack {
                HStack(alignment: .top) {
                    Image("Latest")
                    Spacer()
                    Image("ViewAll")
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 7.86)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(vm.allItems.filter({ item in
                            item.discount == nil
                        })) { item in
                            LatestColumnView(item: item)
                                .onTapGesture {
                                    showPage2.toggle()
                                }
                        }
                    }
                    .padding(.horizontal, 12)
                }
            }
            .padding(.bottom, 22.9)
        }
        
        private var allSalesList: some View {
            VStack {
                HStack(alignment: .top) {
                    Image("FlashSale")
                    Spacer()
                    Image("ViewAll")
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 8.86)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(vm.allItems.filter({ item in
                            item.discount != nil
                        })) { item in
                            SaleColumnView(item: item)
                                .onTapGesture {
                                    showPage2.toggle()
                                }
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.bottom, 22.9)
                }
            }
        }
        
        private var allBrandsList: some View {
            VStack {
                HStack(alignment: .top) {
                    Image("Brands")
                    Spacer()
                    Image("ViewAll")
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 8.86)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(vm.allItems) { item in
                            ItemColumnView(item: item)
                                .onTapGesture {
                                    showPage2.toggle()
                                }
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.bottom, 43)
                }
            }
        }
        
        private var tabBar: some View {
            ZStack {
                Image("TabBar")
                    .scaleEffect(1.04)
                HStack(spacing: 58.64) {
                    ZStack {
                        if index == 0 {
                            Image("Overlay")
                        }
                        Button {
                            buttonIsTapped(index: 0)
                        } label: {
                            Image("Home")
                        }
                    }
                    ZStack {
                        if index == 1 {
                            Image("Overlay")
                        }
                        Button {
                            buttonIsTapped(index: 1)
                        } label: {
                            Image("Heart")
                        }
                    }
                    ZStack {
                        if index == 2 {
                            Image("Overlay")
                        }
                        Button {
                            buttonIsTapped(index: 2)
                        } label: {
                            Image("Cart")
                        }
                    }
                    ZStack {
                        if index == 3 {
                            Image("Overlay")
                        }
                        Button {
                            buttonIsTapped(index: 3)
                        } label: {
                            Image("Message")
                        }
                    }
                    ZStack {
                        if index == 4 {
                            Image("Overlay")
                        }
                        Button {
                            buttonIsTapped(index: 4)
                        } label: {
                            Image("MyPage")
                        }
                    }
                    
                    
                }
            }
        }
        
        private func buttonIsTapped(index: Int) {
            self.index = index
        }
    }


