//
//  ContentView.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 02.06.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @State var tabSelected: Int = 0
    
    var body: some View {
        TabView(selection: $tabSelected) {
            HomeScreen(tabSelected: $tabSelected)
                .tabItem {
                    Label("Home",
                          systemImage: "house.fill")
                }
                .tag(0)
            MenuScreen()
                .tabItem {
                    Label("Menu", systemImage: "menucard.fill")
                }
                .tag(1)
            ProfileScreen()
                .badge("!")
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainTabView()
}
