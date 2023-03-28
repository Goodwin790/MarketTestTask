//
//  LoginView.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 10.03.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = Page1ViewModel()
    @State private var firstName = ""
    @State private var password = ""
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var isSecure = true
    @State private var isLogged = false
    
    var body: some View {
        if isLogged {
            Page1View()
        } else {
            VStack(spacing: 0){
                Image("WelcomeBack")
                    .padding(.top, 158.71)
                firstNameSection
                passwordSection
                loginButton
                Spacer()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    
    private var firstNameSection: some View {
        ZStack {
            textFieldModifier(textFieldText: $firstName)
            if firstName.isEmpty {
                Image("FirstName")
                    .allowsHitTesting(false)
            }
        }
        .padding(EdgeInsets(top: 80.82, leading: 0, bottom: 35, trailing: 0))
    }
    
    private var passwordSection: some View {
        ZStack(alignment: .trailing) {
            if isSecure {
                SecureField("", text: $password)
            } else {
                TextField("", text: $password)
            }
            if password.isEmpty {
                Image("Password")
                    .padding(.trailing, 120.12)
                    .allowsHitTesting(false)
            }
            Button(action: {
                isSecure.toggle()
            }) {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundColor(Color.theme.foreground)
            }
            .padding(.trailing, 7)
        }
        .font(.custom("Montserrat-Medium", size: 12))
        .multilineTextAlignment(.center)
        .frame(width: 289, height: 29)
        .background(Color.theme.field)
        .cornerRadius(15)
        .padding(.bottom, 99)
    }
    
    private var loginButton: some View {
        Button {
            loginButtonIsTapped()
        } label: {
            ZStack {
                Image("ButtonModel")
                Image("LoginButton")
            }
        }
    }
    
    private func textFieldModifier(textFieldText: Binding<String>) -> some View {
        TextField("", text: textFieldText)
            .font(.custom("Montserrat-Medium", size: 12))
            .multilineTextAlignment(.center)
            .autocapitalization(.none)
            .frame(width: 289, height: 29)
            .background(Color.theme.field)
            .cornerRadius(15)
    }
    
    private func loginButtonIsTapped() {
        if vm.userIsExist(firstName: firstName) {
            isLogged = true
        } else {
            alertTitle = "User with this name is not exist!"
            alertMessage = "Check the correctness of the entered data"
            showAlert.toggle()
        }
    }
}
