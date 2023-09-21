//
//  TabbarView.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import SwiftUI

struct TabbarView: View {
    @State private var currentTab : Tab = .Feed
    @State private var showAddButtonView = false
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $currentTab){
                HomeFeedView(showAddButtonView: $showAddButtonView)
                    .padding(.bottom, 1)
                    .tag(Tab.Feed)
            }
            
            CustomTabBarView(currentTab: $currentTab, showAddButtonView: $showAddButtonView)
        }
    }
}

enum Tab: String, CaseIterable {
case Feed = "Feed"
case Library = "Library"
case Default = "Default"
case Messages = "Messages"
case Services = "Services"
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
