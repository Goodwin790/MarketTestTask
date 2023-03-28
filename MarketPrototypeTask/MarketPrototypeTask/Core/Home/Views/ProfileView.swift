//
//  ProfileView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 11.03.2023.
//
import PhotosUI
import SwiftUI

struct ProfileView: View {
    @ObservedObject var vm = Page1ViewModel()
    @State private var logOut = false
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var data: Data?
    
    var body: some View {
        
        VStack(spacing: 0) {
            profileHeader
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
            } else {
                Image("ProfilePhoto")
            }
            photoPickerButton
                .padding(.top, 8.5)
                .padding(.bottom, 19.6)
            Image("Profile")
            uploadButton
            buttonsSection
            Spacer()
        }
        .fullScreenCover(isPresented: $logOut) {
            SignInPage()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
    }
}

extension ProfileView {
    
    private var profileHeader: some View {
        HStack {
            Button {
                print("Button back tapped")
            } label: {
                Image("LeftArrow")
                Spacer(minLength: 132.25)
            }
            Image("Profile")
            Spacer()
            Spacer()
        }
        .padding(EdgeInsets(top: 33, leading: 20, bottom: 19.38, trailing: 159.48))
    }
    
    private var uploadButton: some View {
        Button {
            print("upload item is tapped")
        } label: {
            Image("UploadButton")
        }
        .padding(EdgeInsets(top: 37.82, leading: 0, bottom: 14, trailing: 0))
    }
    
    private var buttonsSection: some View {
        VStack(alignment: .leading, spacing: 25) {
            Button {
                print("Trade store is tapped")
            } label: {
                Image("TradeStore")
            }
            Button {
                print("Payment method is tapped")
            } label: {
                Image("PaymentMethod")
            }
            Button {
                print("Balance is tapped")
            } label: {
                Image("Balance")
            }
            Button {
                print("Trade history is tapped")
            } label: {
                Image("TradeHistory")
            }
            Button {
                print("Restore pyrchase is tapped")
            } label: {
                Image("RestorePurchase")
            }
            Button {
                print("Help is tapped")
            } label: {
                Image("Help")
            }
            Button {
                logOut.toggle()
            } label: {
                Image("LogOut")
            }
        }
    }
    
    private var photoPickerButton: some View {
        PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images) {
            Image("ChangePhoto")
        }
        .onChange(of: selectedItems) { newValue in
            guard let item = selectedItems.first else { return }
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data = data {
                        self.data = data
                    } else {
                        print("Data is nil!!!")
                    }
                case .failure(let failure):
                    fatalError("\(failure)")
                }
            }
        }
    }
}
