//
//  HomeFeedView.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import SwiftUI

struct HomeFeedView: View {
    @State private var searchText: String = String()
    @Binding var showAddButtonView: Bool
    @ObservedObject var homeViewModel = HomeViewModel()
    var body: some View {
        ZStack{
            Color(red: 0.95, green: 0.95, blue: 0.95)
            VStack(alignment: .leading, spacing: 0){
                TopView
                ScrollView(.vertical){
                    VStack(spacing: 0){
                        ForEach(homeViewModel.posts, id: \.userName) { post in
                            PostView(post: post)
                                .padding(.top, 10)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .fullScreenCover(isPresented: $showAddButtonView) {
                ZStack(alignment: .bottom){
                    VStack(spacing: 0){
                        Spacer()
                        AddView(homeViewModel: homeViewModel)
                            .frame(height: 310)
                            .padding(.bottom, 20)
                        Image("close")
                            .resizable()
                            .frame(width: 44, height: 44)
                            .padding(.bottom, 9)
                            .onTapGesture {
                                showAddButtonView.toggle()
                            }
                    }
                }
                .background(TransparentedBackgroundView())
            }
        }
        .navigationBarHidden(true)
    }
}

extension HomeFeedView{
    private var TopView: some View{
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0){
                VStack(alignment: .leading, spacing: 0){
                    Text("COMMUNITY")
                        .font(.system(size: 12).bold())
                        .kerning(1)
                        .foregroundColor(Color(red: 0.65, green: 0.69, blue: 0.76))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 17)
                    
                    HStack(spacing: 0){
                        Text("All Communities")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(red: 0, green: 0.66, blue: 0.51))
                            .frame(alignment: .leading)
                        
                        Image("arrow-down")
                            .padding(.leading, 5)
                        Spacer()
                    }
                }
                
                Image("user")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 28.5, height: 28.5)
                    .clipped()
                    .padding(.top, 20.75)
            }
            .padding(.trailing, 20)
            
            HStack{
                HStack{
                    TextField("Search posts and members", text: $searchText)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.leading, 10)
                    Image("search")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 10)
                }
                .frame(height: 32)
                .overlay{
                    RoundedRectangle(cornerRadius: 2)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.8, green: 0.93, blue: 0.9), lineWidth: 1)
                }
                Spacer()
                Image("bell")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            .padding(.top, 22)
            .padding(.trailing, 20)
            
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 77, height: 26)
                        .background(Color(red: 0.8, green: 0.93, blue: 0.9))
                        .cornerRadius(13)
                        .overlay{
                            Text("All Posts")
                                .font(.system(size: 13))
                                .frame(width: 53, height: 16)
                                .foregroundColor(Color(red: 0, green: 0.66, blue: 0.51))
                                .padding(.horizontal,12)
                                .padding(.vertical, 5)
                        }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 59, height: 26)
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.8, green: 0.93, blue: 0.9), lineWidth: 1)
                                .overlay{
                                    Text("News")
                                        .font(.system(size: 13))
                                        .foregroundColor(Color(red: 0, green: 0.66, blue: 0.51))
                                        .padding(.horizontal,12)
                                        .padding(.vertical, 5)
                                }
                        )
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 49, height: 26)
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.8, green: 0.93, blue: 0.9), lineWidth: 1)
                                .overlay{
                                    Text("Diet")
                                        .font(.system(size: 13))
                                        .foregroundColor(Color(red: 0, green: 0.66, blue: 0.51))
                                        .padding(.horizontal,12)
                                        .padding(.vertical, 5)
                                }
                        )
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 75, height: 26)
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.8, green: 0.93, blue: 0.9), lineWidth: 1)
                                .overlay{
                                    Text("Lifestyle")
                                        .font(.system(size: 13))
                                        .foregroundColor(Color(red: 0, green: 0.66, blue: 0.51))
                                        .padding(.horizontal,12)
                                        .padding(.vertical, 5)
                                }
                        )
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 89, height: 26)
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.8, green: 0.93, blue: 0.9), lineWidth: 1)
                                .overlay{
                                    Text("Symptoms")
                                        .font(.system(size: 13))
                                        .foregroundColor(Color(red: 0, green: 0.66, blue: 0.51))
                                        .padding(.horizontal,12)
                                        .padding(.vertical, 5)
                                }
                        )
                }
                .padding(.top, 15)
            }
            .scrollIndicators(.hidden)
            .padding(.bottom, 10)
        }
        .padding(.leading, 20)
        .background(Color.white)
    }
    
}



//struct HomeFeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeFeedView()
//    }
//}
