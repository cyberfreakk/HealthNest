//
//  CustomTabBarView.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var currentTab: Tab
    @Binding var showAddButtonView: Bool
    var body: some View {
        HStack(alignment: .center, spacing: 0){
            ForEach(Tab.allCases, id: \.rawValue) {tab in
                Spacer()
                TabButton(tab: tab, currentTab: $currentTab)
                    .onTapGesture {
                        currentTab = tab
                        if currentTab == .Default{
                            showAddButtonView.toggle()
                        }
                    }
            }
            Spacer()
        }
        .overlay{
            Rectangle()
                .stroke(Color(red: 0.91, green: 0.92, blue: 0.94), lineWidth: 1)
                .frame(height: 1)
                .offset(x: 0, y: -30)
        }
        .background(Color.white)
    }
}

struct TabButton: View{
    var tab: Tab
    @Binding var currentTab: Tab
    
    var body: some View{
        Rectangle()
            .foregroundColor(.clear)
            .overlay{
                VStack(spacing: 0) {
                    Image(getImage(tabValue: tab, currentTab: currentTab))
                    if(tab != Tab.Default){
                        Text(tab.rawValue)
                            .font(.system(size: 10).weight(.bold))
                            .foregroundColor(currentTab == tab ? Color(red: 0, green: 0.66, blue: 0.51) : Color(red: 0.65, green: 0.69, blue: 0.76))
                            .padding(.top, 7)
                    }
                }
            }
            .frame(width: 60, height: 60)
    }
    
    func getImage(tabValue: Tab, currentTab: Tab) -> String{
        switch tabValue{
        case .Feed:
            return currentTab == tabValue ? "feed-selected" : "feed"
        case.Library:
            return currentTab == tabValue ? "library-selected" : "library"
        case.Default:
            return tabValue.rawValue
        case.Messages:
            return currentTab == tabValue ? "messages-selected" : "messages"
        case .Services:
            return currentTab == tabValue ? "services-selected" : "services"
        }
    }
}



