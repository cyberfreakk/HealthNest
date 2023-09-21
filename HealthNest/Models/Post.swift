//
//  Post.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 20/09/23.
//

import Foundation


struct Post{
    var isQuestion: Bool
    var userName: String
    var imageName: String
    var question: String?
    var postText: String
    var reaction: String
    
    static func getPosts() -> [Post]{
        return [
            Post(isQuestion: true, userName: "rohit.shetty12", imageName: "Image Mask", question: "What are the signs and symptoms of skin cancer? signs and symptoms of skin cancer?", postText: "I’ve been facing a few possibble symptoms of skin cancer. I’ve googled the possibilities but i thought i’d ask the community inste...", reaction: "24 members have this question"),
            Post(isQuestion: false, userName: "priya321", imageName: "priya_image", question: nil, postText: "My husband has his 3 days transplant assessment in Newcastle next month, strange mix of emotions. For those that have been through this how long did it take following assessment was it until you were t...", reaction: "24 members reacted to this post"),
            Post(isQuestion: false, userName: "username1275", imageName: "priya_image", question: nil, postText: "My husband has his 3 days transplant assessment in Newcastle next month, strange mix of emotions. For those that have been through this how long did it take following assessment was it until you were t...", reaction: "24 members reacted to this post"),
            Post(isQuestion: false, userName: "Member", imageName: "01", question: nil, postText: "My husband has his 3 days transplant assessment in Newcastle next month, strange mix of emotions. For those that have been through this how long did it take following assessment was it until you were t...", reaction: "24 members reacted to this post")
        ]
    }
}
