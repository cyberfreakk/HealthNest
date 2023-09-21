//
//  ReactionView.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 22/09/23.
//

import SwiftUI

struct ReactionView: View {
    @Binding var showReactionView: Bool
    @Binding var isUserReacted: Bool
    var body: some View {
        HStack(spacing: 15) {
            ForEach(reactions, id: \.self){ reaction in
                HStack{
                    Image(reaction)
                    Text(reaction)
                }
                .onTapGesture {
                    showReactionView.toggle()
                    isUserReacted.toggle()
                }
            }
        }
        .padding(.vertical, 13)
        .padding(.horizontal, 16)
        .background(Color.white)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.1), radius: 5, x:0, y:4)
    }
}


var reactions = ["Like", "Haha", "Sad"]
struct ReactionView_Previews: PreviewProvider {
    static var previews: some View {
        ReactionView(showReactionView: .constant(false), isUserReacted: .constant(false))
    }
}
