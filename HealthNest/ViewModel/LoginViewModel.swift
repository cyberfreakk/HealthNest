//
//  LoginViewModel.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var credentials = Credentials()
    @Published var showProgressView: Bool = false
    
    func login(completion: @escaping (Bool) -> Void){
        showProgressView = true
        APIService.shared.login(credentials: credentials) { [weak self] result in
            guard let self = self else{ return }
            switch result{
            case .success:
                SessionManager.shared.isUserRegistered = true
                completion(true)
            case .failure:
                SessionManager.shared.isUserRegistered = false
                self.credentials = Credentials()
                completion(false)
            }
        }
    }
}
