//
//  MenuScreen.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 24.06.2024.
//

import SwiftUI

struct MenuScreen: View {
    
    @State private var menuItems: [MenuItem] = .init()
    
    var body: some View {
        NavigationStack {
            List(menuItems) { item in
                NavigationLink(item.name) {
                    Text("Grilled Fingerlings")
                    Text("Asian Pear Salad")
                    Text("Roasted Acorn Squash")
                    Text("Smothered Chicken")
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
