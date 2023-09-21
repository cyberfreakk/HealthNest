//
//  ProgressLoaderView.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import Foundation
import SwiftUI

struct ProgressLoaderView: View {
    let color: Color? = Color.white
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
            ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: color!))
            .scaleEffect(1.5)
            .ignoresSafeArea(.all)
        }
    }
}
