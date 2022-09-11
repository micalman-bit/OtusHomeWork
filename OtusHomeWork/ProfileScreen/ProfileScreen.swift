//
//  ProfileScreen.swift
//  OtusHomeWork
//
//  Created by Andrey Samchenko on 03.09.2022.
//

import SwiftUI

struct ProfileScreen: View {
    
    @Binding var tabSelection: Int
    @State var text = NSMutableAttributedString(string: "This is home work")

    var body: some View {
        VStack {
            Button {
                tabSelection = 1
            } label: {
                Text("To Dashboard")
                    .padding()
                    .background(.mint)
                    .foregroundColor(.white)
            }
            TextView(text: $text)
                .frame(minWidth: 0, maxWidth: 140, minHeight: 0, maxHeight: 100)
        }
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.backgroundColor = .green.withAlphaComponent(0.6)
        uiView.attributedText = text
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(tabSelection: .constant(0))
    }
}
