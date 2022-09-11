//
//  OtusHomeWorkApp.swift
//  OtusHomeWork
//
//  Created by admin on 03.09.2022.
//

import SwiftUI

@main
struct AppSUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DashboardViewModel())
        }
    }
}
