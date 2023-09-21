//
//  PostView.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import SwiftUI

struct PostView: View {
    @State private var showReactionView = false
    @State private var isUserReacted = false
    var post: Post
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)){
            VStack(spacing: 0) {
                HStack(spacing: 0){
                    Text("DIET")
                        .font(.system(size: 12).bold())
                        .foregroundColor(Color(red: 0.65, green: 0.69, blue: 0.76))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("1min")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                }
                
                HStack(spacing: 10){
                    Image(post.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 0){
                        if post.isQuestion{
                            Group{
                                Text(post.userName)
                                    .font(.system(size: 14).bold())
                                    .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                                +
                                Text(" asked a question.")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 0.64, green: 0.69, blue: 0.75))
                                
                            }
                        }
                        else{
                            Text(post.userName)
                                .font(.system(size: 14).bold())
                                .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                        }
                        
                        Text("Diagnosed Recently".uppercased())
                            .font(.system(size: 10))
                            .foregroundColor(Color(red: 0, green: 0.66, blue: 0.51))
                            .frame(height: 16, alignment: .leading)
                    }
                    
                    Spacer()
                    
                    Image("ellipses")
                    
                }
                .padding(.top, 10)
                
                if post.isQuestion{
                    HStack{
                        Text(post.question ?? "")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                            .padding(.top, 15)
                        Spacer()
                    }
                }
                
                HStack{
                    Group{
                        Text(post.postText)
                            .font(.system(size: 14))
                            .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                        +
                        Text("See More")
                            .font(.system(size: 14).bold())
                            .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                    }
                    .padding(.top, post.isQuestion ? 5 : 15)
                    Spacer()
                }
                
                HStack(spacing: 0){
                    Image("map-marker-alt")
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    Text("Peninsula Park, Andheri, Mumbai")
                        .font(.system(size: 10))
                        .foregroundColor(Color(red: 0, green: 0.66, blue: 0.51))
                        .frame(height: 16)
                        .padding(.leading, 4)
                    Spacer()
                }
                .padding(.top, 10)
                
                Rectangle()
                    .stroke(Color(red: 0.91, green: 0.92, blue: 0.94), lineWidth: 1)
                    .frame(height: 0.5)
                    .padding(.top, 12)
                
                
                HStack(spacing: 0) {
                    HStack(spacing: 0){
                        Image("dp")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                            .background(
                                Image("Image Mask")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                                    .offset(x: 15, y: 0)
                                    .background(
                                        Image("Image Mask")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 20)
                                            .clipShape(Circle())
                                            .offset(x: 30, y: 0)
                                    )
                            )
                    }
                    
                    Text(post.reaction)
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                        .padding(.leading, 40)
                    
                    Spacer()
                }
                .padding(.top, 10)
                
                Rectangle()
                    .stroke(Color(red: 0.91, green: 0.92, blue: 0.94), lineWidth: 1)
                    .frame(height: 0.5)
                    .padding(.top, 12)
                
                HStack(alignment: .center, spacing: 55) {
                    HStack(spacing: 0){
                        Image(post.isQuestion ? "empty_question" : (isUserReacted ? "Like" : "Like-1"))
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("24")
                            .font(.system(size: 12).weight(.bold))
                            .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                            .padding(.leading, post.isQuestion ? 2 : 5)
                    }
                    .onTapGesture {
                        if !post.isQuestion{
                            showReactionView.toggle()
                            isUserReacted = false
                        }
                    }
                    HStack(spacing: 0){
                        Image("comment-lines")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("24")
                            .font(.system(size: 12).weight(.bold))
                            .foregroundColor(Color(red: 0.33, green: 0.36, blue: 0.39))
                    }
                    Image("bookmark-full")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Image("share-alt")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.vertical, 10)
            }
            .padding(.horizontal, 15)
            .padding(.top, 15)
            .background(Color.white)
            
            ReactionView(showReactionView: $showReactionView, isUserReacted: $isUserReacted)
                .transition(.move(edge: .bottom))
                .offset(x: 12, y: -45)
                .animation(Animation.easeIn, value: showReactionView)
                .isHidden(!showReactionView)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(isQuestion: false, userName: "", imageName: "", postText: "", reaction: ""))
    }
}
