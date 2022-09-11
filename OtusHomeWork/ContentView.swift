//
//  ContentView.swift
//  OtusHomeWork
//
//  Created by Andrey Samchenko on 03.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelection: Int = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            ProfileScreen(tabSelection: $tabSelection)
                .tag(0)
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
            DashboardScreen()
                .tag(1)
                .tabItem {
                    Label("Dashboard", systemImage: "pawprint.fill")
                }
            ModalScreen()
                .tag(2)
                .tabItem {
                    Label("ModalScreen", systemImage: "globe.europe.africa.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
