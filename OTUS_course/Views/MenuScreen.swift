//
//  MenuScreen.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 24.06.2024.
//

import SwiftUI

// * Сделать глубину в 3 экрана с помощью навигейшен-стека

struct MenuScreen: View {
    
    @State private var menuItems: [MenuItem] = .init()
    
    var body: some View {
        NavigationStack {
            List(menuItems) { item in
                NavigationLink(item.name) {
                    List {
                        NavigationLink("Grilled Fingerlings", destination: Text("Grilled Fingerlings"))
                        NavigationLink("Asian Pear Salad", destination: Text("Asian Pear Salad"))
                        NavigationLink("Roasted Acorn Squash", destination: Text("Roasted Acorn Squash"))
                        NavigationLink("Smothered Chicken", destination: Text("Smothered Chicken"))
                    }
                }
            }.task {
                self.menuItems = await MenuItem.all
            }
            .navigationTitle("Menu")
            
        }
    }
}

#Preview {
    MenuScreen()
}
