//
//  SessionManager.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import Foundation
import SwiftUI

final class SessionManager{
    private init(){}
    static let shared = SessionManager()
    
    var mobileNumber: String?{
        get{
            UserDefaults.standard.string(forKey: "mobileNumber")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "mobileNumber")
        }
    }
    
    var isUserRegistered: Bool{
        get{
            UserDefaults.standard.bool(forKey: "isUserRegistered")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "isUserRegistered")
        }
    }
}
