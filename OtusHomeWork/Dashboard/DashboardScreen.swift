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
    
    init() {
        
    }
    
}

struct DashboardScreen: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
//                PromosView()
//                Button {
//                    showModal.toggle()
//                } label: {
//                    Text("Show Modal")
//                        .font(.largeTitle)
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.green)
//                        .cornerRadius(8)
//                }.sheet(isPresented: $showModal) {
//                    Text("🥬")
//                        .font(.system(size: 300))
//                }
//            NavigationLink("lll"){
                    FoodListView()
//                }
            }
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

//                        cell(food: food)
                        
                    } else {
                        EmptyView()
                    }
                }
            }
        }.navigationTitle("Food")
    }
//    func cellcc(food: Food) -> some UIView {
//        NavigationLink(destination: FoodScreen(title: food.name)) {
//            Text(food.name)
//        }
//    }
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

//struct PromosView: View {
//    
//    @EnvironmentObject var dashboardViewModel: DashboardViewModel
//    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack {
//                ForEach(dashboardViewModel.promos, id: \.self) { item in
//                    Text("\(item)")
//                        .frame(width: 100, height: 100)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .cornerRadius(8)
//                }
//            }
//        }
//    } // body
//    
//}


struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
