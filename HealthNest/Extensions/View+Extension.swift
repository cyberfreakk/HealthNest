//
//  View+Extension.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import Foundation
import SwiftUI

extension View{
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
