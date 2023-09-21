//
//  Activity.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 22/09/23.
//

import Foundation

struct Activity: Identifiable{
    var id: Int
    var title: String
    var logo: String
    var subTitle: String
    
    static func getActivties() -> [Activity]{
        return [
            Activity(id: 1, title: "Create a post", logo: "Icons(2)", subTitle: "Share your thoughts with the community"),
            Activity(id: 2, title: "Ask a Question", logo: "Icons(3)", subTitle: "Any doubts? As the community"),
            Activity(id: 3, title: "Start a Poll", logo: "Icons(4)", subTitle: "Need the opinion of the many? "),
            Activity(id: 4, title: "Organise an Event", logo: "Icons(5)", subTitle: "Start a meet with people to share your joys")
        ]
    }
}
