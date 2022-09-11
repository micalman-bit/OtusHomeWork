//
//  FoodScreen.swift
//  OtusHomeWork
//
//  Created by Andrey Samchenko on 03.09.2022.
//

import SwiftUI

struct FoodScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var title: String
    
    var body: some View {
        VStack {
//            NavigationLink("lol") {
//
//            }
            Text(title)
                .font(.system(size: 350))
            
            Text("Back")
                .font(.largeTitle)
                .padding()
                .background(.brown)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer()
        }
        .frame(height: 500)
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
//        .navigationTitle(title)
    }
}

struct FoodScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodScreen(title: "🥨")
    }
}
