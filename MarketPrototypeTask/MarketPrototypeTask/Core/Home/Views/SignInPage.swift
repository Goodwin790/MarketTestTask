//
//  SignInPage.swift
//  MarketPrototypeTask
//
//  Created by Сергей Киров on 10.03.2023.
//

import SwiftUI

struct SignInPage: View {
    @StateObject var vm = Page1ViewModel()
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var showPage1 = false
    @State private var showLogin = false
    
    
    var body: some View {
        if showLogin {
            LoginView()
        } else if showPage1 {
            Page1View()
        } else {
            VStack {
                Spacer()
                Image("SignIn")
                    .padding(.bottom, 50)
                firstNameSection
                lastNameSection
                emailSection
                signInButton
                haveAnAccountSection
                Spacer()
                signWith
                Spacer()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage))
            }
        }
    }
}

struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPage()
    }
}

extension SignInPage {
    
    private var firstNameSection: some View {
        ZStack {
            textFieldModifier(textFieldText: $firstName)
            if firstName.isEmpty {
                Image("FirstName")
                    .allowsHitTesting(false)
            }
        }
    }
    
    private var lastNameSection: some View {
        ZStack {
            textFieldModifier(textFieldText: $lastName)
            if lastName.isEmpty {
                Image("LastName")
                    .allowsHitTesting(false)
            }
        }
    }
    
    private var emailSection: some View {
        ZStack {
            textFieldModifier(textFieldText: $email)
            if email.isEmpty {
                Image("Email")
                    .allowsHitTesting(false)
            }
        }
    }
    
    private var signInButton: some View {
        Button {
            signInButtonIsTapped()
        } label: {
            ZStack {
                Image("ButtonModel")
                Image("SignInButton")
            }
        }
        .padding(7)
    }
    
    private var haveAnAccountSection: some View {
        HStack {
            Image("HaveAnAccount?")
            Button {
                showLogin = true
            } label: {
                Image("Login")
            }
            Spacer()
        }
        .padding(.horizontal, 50)
        
    }
    
    private var signWith: some View {
        VStack(spacing: 44){
            Button {
            print("Sign in vith google")
        } label: {
            HStack {
                Image("GoogleIcon")
                Image("SignInGoogle")
            }
        }
            Button {
                print("Sign in with apple")
            } label: {
                HStack {
                    Image("AppleIcon")
                    Image("SignInApple")
                }
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
            .padding()
    }
    
    private func signInButtonIsTapped() {
        if !vm.isValidEmail(email) {
            alertTitle = "Email is not valid!"
            alertMessage = "Format of email must looks like: userName@mymail.com"
            showAlert = true
        } else if vm.addUser(firstName: firstName, lastName: lastName, email: email) {
            alertTitle = "Name is used!"
            alertMessage = "User with this name already exists. Press Log in login to your account"
            showAlert = true
        } else {
            firstName = ""
            lastName = ""
            email = ""
            showPage1 = true
        }
    }
}

