//
//  ModalScreen.swift
//  OtusHomeWork
//
//  Created by Andrey Samchenko on 03.09.2022.
//

import SwiftUI

struct ModalScreen: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    showModal.toggle()
                } label: {
                    Text("Show Modal")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(16)
                }.sheet(isPresented: $showModal) {
                    Text("🍿")
                        .font(.system(size: 300))
                }
            }
        }
    }
}



struct ModalScreen_Previews: PreviewProvider {
    static var previews: some View {
        ModalScreen()
    }
}
