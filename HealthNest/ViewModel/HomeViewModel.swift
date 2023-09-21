//
//  HomeViewModel.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var posts: [Post] = Post.getPosts()
    @Published var activities: [Activity] = Activity.getActivties()
}
