//
//  Page2View.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 14.03.2023.
//

import SwiftUI

struct Page2View: View {
    @EnvironmentObject private var vm: Page1ViewModel
    
    @State var amount: Int = 1
    @State private var selectedColor: String? = nil
    @Binding var showPage2: Bool
    @Binding var index: Int
    @State private var photoIndex = 0
    @State private var image: UIImage? = nil
    
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            VStack(spacing: 0) {
                ZStack {
                    mainPhoto
                    sharedAndFavoritesField
                }
                detailPhotoPicker
                itemInfoSection
                colorPicker
                quantitySection
                Spacer()
            }
        }
    }
}

struct Page2View_Previews: PreviewProvider {
    static var previews: some View {
        Page2View(showPage2: .constant(true), index: .constant(0))
            .environmentObject(dev.homeVm)
    }
}

extension Page2View {
    
    private var mainPhoto: some View {
        ZStack(alignment: .topLeading) {
            if let details = vm.allDetails {
                PhotoCaoruselView(details: details, index: $photoIndex)
                    .frame(width: 370, height: 300)
                    .cornerRadius(10)
            }
            
            Button {
                showPage2.toggle()
            } label: {
                Image("ArrowLeft")
            }
            .offset(x: 50, y: -7)
        }
        .offset(x: -15)
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 35, trailing: 52))
    }
    
    private var quantitySection: some View {
        ZStack(alignment: .top) {
            Image("QuantityBackground")
                .scaleEffect(1.04)
            HStack {
                VStack(alignment: .leading) {
                    Text("Quantity:")
                        .font(.custom("Montserrat-Medium", size: 12))
                        .foregroundColor(.theme.foreground)
                    
                    HStack(spacing: 36.79) {
                        Button {
                            amount -= 1
                        } label: {
                            Image("MinusButton")
                        }
                        Button {
                            amount += 1
                        } label: {
                            Image("PlusButton")
                        }
                    }
                }
                Spacer()
                ZStack {
                    Button {
                        index = 2
                        showPage2 = false
                    } label: {
                        Image ("AddToCartButton")
                    }

                    Text(vm.updateCart(price: vm.allDetails?.price ?? 0, amount: amount))
                        .font(.custom("Montserrat-Medium", size: 12))
                        .foregroundColor(.theme.cartPrice)
                        .padding(.trailing, 80)
                }
            }
            .padding(.horizontal, 40)
            .padding(.top)
        }
    }
    
    private var sharedAndFavoritesField: some View {
        ZStack {
            Image("ShareAndFavoritesField")
            VStack(spacing: 31) {
                Button {
                    print("Like is tapped")
                } label: {
                    Image("Like")
                }
                Button {
                    print("Share is tapped")
                } label: {
                    Image("ShareButton")
                }
            }
        }
        .padding(EdgeInsets(top: 196, leading: 320, bottom: 83, trailing: 34))
    }
    
    private var detailPhotoPicker: some View {
        VStack {
            if let details = vm.allDetails {
                DetailImagesView(details: details, index: $photoIndex, image: $image)
            }
        }
    }
    
    private var itemInfoSection: some View {
        VStack {
            HStack(alignment: .top) {
                Text(vm.allDetails?.name ?? "")
                    .font(.custom("Montserrat-Black", size: 18))
                Spacer()
                Text("$\(vm.allDetails?.price ?? 0)")
                    .font(.custom("Montserrat-Black", size: 15))
            }
            .padding(EdgeInsets(top: 29.26, leading: 24.87, bottom: 15.97, trailing: 23.7))
            
            Text(vm.allDetails?.description ?? "")
                .font(.custom("Montserrat-Thin", size: 11))
                .foregroundColor(Color.theme.foreground)
            
            HStack {
                Image(systemName: "star")
                    .foregroundColor(.yellow)
                Text(String(vm.allDetails?.rating ?? 0))
                Text("(\(vm.allDetails?.numberOfReviews ?? 0) reviews)")
                    .foregroundColor(Color.theme.foreground)
                Spacer()
            }
            .font(.custom("Montserrat-Bold", size: 13))
            .padding(EdgeInsets(top: 14.16, leading: 24, bottom: 17.09, trailing: 0))
        }
    }
    
    private var colorPicker: some View {
        HStack {
            VStack(spacing: 12.91) {
                Text("Color:")
                    .font(.custom("Montserrat-Medium", size: 13))
                if let colors = vm.allDetails?.colors {
                    
                    HStack {
                        ForEach(colors, id: \.self) { color in
                            Color(hex: color)
                                .frame(width: 32, height: 24)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(selectedColor == color ? Color.gray : Color.clear, lineWidth: 2)
                                )
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                    }
                }
            }
            .padding(.leading, 24)
            Spacer()
        }
        .padding(.bottom, 20)
    }
    
}
