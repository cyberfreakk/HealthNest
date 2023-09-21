//
//  AddView.swift
//  HealthNest
//
//  Created by Arunesh Gupta on 21/09/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    var body: some View {
        ZStack{
            Color.white
            List{
                ForEach($homeViewModel.activities, id: \.id) { activity in
                    VStack{
                        HStack(alignment: .center, spacing: 14.62) {
                            Image(activity.logo.wrappedValue)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(activity.title.wrappedValue)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 0, green: 0.66, blue: 0.51))
                                Text(activity.subTitle.wrappedValue)
                                    .font(.system(size: 10))
                                    .foregroundColor(Color(red: 0.65, green: 0.69, blue: 0.76))
                                    .frame(width: 228, height: 13, alignment: .topLeading)
                            }
                            
                            Image("arrow-right")
                        }
                        .padding(.vertical, 8)
                        Rectangle()
                            .foregroundColor(Color(red: 0.91, green: 0.92, blue: 0.94))
                            .frame(width: UIScreen.main.bounds.width - 20)
                            .frame(height: 1)
                            .offset(y: 5)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .cornerRadius(8)
        .padding(.horizontal, 10)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(homeViewModel: HomeViewModel())
    }
}


struct TransparentedBackgroundView: UIViewRepresentable {
    private class View: UIView {
        override func didMoveToSuperview() {
            super.didMoveToSuperview()
            DispatchQueue.main.async {
                self.superview?.superview?.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            }
        }
    }
    
    func makeUIView(context: Context) -> UIView {
        return View()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
