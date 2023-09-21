//
//  APIService.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import Foundation

class APIService{
    static let shared = APIService()
    enum APIError: Error{
        case error
    }
    
    func login(credentials: Credentials, completion: @escaping (Result<Bool, APIError>) -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            completion(.success(true))
        }
    }
}
