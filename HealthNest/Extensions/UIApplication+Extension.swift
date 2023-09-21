//
//  UIApplication+Extension.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import UIKit

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
