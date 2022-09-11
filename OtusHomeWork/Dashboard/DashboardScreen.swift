//
//  DashboardScreen.swift
//  OtusHomeWork
//
//  Created by Andrey Samchenko on 03.09.2022.
//

import SwiftUI

struct Food: Identifiable {
    let name: String
    let isFav: Bool
    let id = UUID()
}

final class FoodListViewModel: ObservableObject {
    
    @Published private(set) var toggleFavTitle = "Show Favorites"
    
    @Published private(set) var foods = [
        Food(name: "🍦", isFav: true),
        Food(name: "🍕", isFav: false),
        Food(name: "🧀", isFav: true),
        Food(name: "🍔", isFav: false),
        Food(name: "🥑", isFav: true),
    ]
}

final class DashboardViewModel: ObservableObject {

    @Published var promos: [Int] = Array<Int>(0...20)

    init() { }
}

struct DashboardScreen: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                FoodListView()
            }.navigationTitle("Food")
        }
    }
}

struct FoodListView: View {
    
    @StateObject var viewModel: FoodListViewModel = .init()
    
    @State var favesShowed: Bool = false
    
    var body: some View {
        VStack {
            List {
                FoodFilterView(favesShowed: $favesShowed)
                    .environmentObject(viewModel)
                ForEach(viewModel.foods) { food in
                    if favesShowed || food.isFav {
                        NavigationLink(destination: FoodScreen(title: food.name)) {
                            Text(food.name)
                        }
                    } else {
                        EmptyView()
                    }
                }
            }
        }
    }
}

struct FoodFilterView: View {
 
    @EnvironmentObject var viewModel: FoodListViewModel
    @Binding var favesShowed: Bool
    
    var body: some View {
        Toggle(isOn: $favesShowed) {
            Text(viewModel.toggleFavTitle)
        }
    }
    
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
