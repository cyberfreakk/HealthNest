//
//  LoginView.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 19/09/23.
//

import SwiftUI

struct LoginView: View {
    @State private var mobileNumber: String = String()
    @ObservedObject var loginViewModel = LoginViewModel()
    @State private var isUserLoggedin = false
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(alignment: .leading, spacing: 0){
                    Image("Logo")
                        .resizable()
                        .frame(width: 75, height: 72, alignment: .leading)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
                        .padding(.leading, -11.55)
                    
                    Text("Welcome to\nHealthNest")
                        .font(.system(size: 30).weight(.bold))
                        .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                        .frame(width: 320, alignment: .bottomLeading)
                        .padding(.top, 13.15)
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text("Enter Mobile Number")
                            .font(.system(size: 10))
                            .foregroundColor(Color(red: 0.65, green: 0.69, blue: 0.76))
                        
                        HStack(alignment: .center, spacing: 0) {
                            Image("IN")
                                .frame(width: 28, height: 20)
                            Image("Path 2")
                                .padding(.leading, 5)
                            
                            VStack(spacing: 0) {
                                HStack{
                                    TextField("Enter Mobile Number", text: $mobileNumber)
                                        .keyboardType(.numberPad)
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                                        .onChange(of: mobileNumber) { _ in
                                            limitNumbers()
                                        }
                                    Spacer()
                                    Image("phone-icon")
                                        .padding(.leading, 5)
                                }
                                HStack(alignment: .center, spacing: 0) {
                                    Color(red: 0.65, green: 0.69, blue: 0.76)
                                }
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 1, alignment: .center)
                            }
                            .padding(.leading, 8)
                        }
                        .padding(.top, 5)
                    }
                    .padding(.top, 58)
                    
                    Text("We never compromise on security!\nHelp us create a safe place by providing your mobile number to maintain authenticity.")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.65, green: 0.69, blue: 0.76))
                        .frame(width: 320, height: 57, alignment: .leading)
                        .padding(.top, 32)
                    
                    
                    HStack{
                        Spacer()
                        
                        Button{
                            debugPrint("Send OTP tapped")
                            loginViewModel.credentials = Credentials(mobileNumber: mobileNumber)
                            loginViewModel.login { success in
                                if success{
                                    isUserLoggedin = true
                                }
                            }
                        } label:{
                            Text("Send OTP")
                                .font(.system(size: 16).bold())
                                .foregroundColor(mobileNumber.count < 10 ? Color(red: 0.65, green: 0.69, blue: 0.76) : Color(red: 1, green: 1, blue: 1))
                        }
                        .disabled(mobileNumber.count < 10)
                        .frame(alignment: .center)
                        .padding(15)
                        .background(mobileNumber.count < 10 ? Color(red: 0.91, green: 0.92, blue: 0.94) : Color(red: 0, green: 0.66, blue: 0.51))
                        .cornerRadius(2)
                        
                        Spacer()
                    }
                    .padding(.top, 50)
                }
                .frame(width: UIScreen.main.bounds.width - 40)
                
                ProgressLoaderView()
                    .isHidden(!loginViewModel.showProgressView)
                    
            }
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $isUserLoggedin) {
                TabbarView()
            }
            .onAppear{
                if SessionManager.shared.isUserRegistered{
                    isUserLoggedin = true
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension LoginView{
    func limitNumbers() {
        if mobileNumber.count > 10 {
            mobileNumber = String(mobileNumber.prefix(10))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
