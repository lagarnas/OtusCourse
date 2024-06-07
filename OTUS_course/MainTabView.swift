//
//  ContentView.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 02.06.2024.
//

import SwiftUI

// 6. Протестировать на iPad/iPhone симуляторах, со сменой ориентации девайса - DONE
// 1. Добавить TabView - DONE
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

// 5.На первом табе должна быть кнопка открывающая второй таб и один из пунктов там - 1/2 DONE
struct HomeScreen: View {
    
    @Binding var tabSelected: Int
    
    var body: some View {
        ZStack {
            Image("dishes")
                .resizable()
            Button("Go to our menu") {
                tabSelected = 1
            }
            .applyAppButtonStyle()
        }
    }
}

// 2.На втором табе сделать List с обернутый в NavigationView - DONE
// 3.Из листа должны быть переходы с NavigationLink - DONE

struct MenuItem: Identifiable, Codable {
    var id: String = UUID().uuidString
    let name: String
    
    static var all: [MenuItem] {
        get async {
            [
                MenuItem(name: "Main Course"),
                MenuItem(name: "Appetizer"),
                MenuItem(name: "Dessert"),
                MenuItem(name: "Drinks")
            ]
        }
    }
}

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

// 4. На третьем табе должна быть кнопка открывающая модальное окно - DONE
struct ProfileScreen: View {
    
    @State private var showModal = false
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            Color.blue
            Button("Sign up in our app") {
                showModal = true
            }
            .applyAppButtonStyle()
            .sheet(isPresented: $showModal) {
                VStack(spacing: 20) {
                    Text("This is a modal view")
                    ActivityIndicator(
                        style: .large,
                        isLoading: isLoading
                    )
                    Button("Update please") {
                        isLoading.toggle()
                    }
                }
            }
            
        }
    }
}

// *6. Добавить один UIKit компонент через UIViewRepresantable - DONE
import UIKit

struct ActivityIndicator: UIViewRepresentable {
    var style: UIActivityIndicatorView.Style
    var isLoading: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isLoading ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

#Preview {
    MainTabView()
}

// ViewModifier

struct AppButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .foregroundStyle(.black)
            .background(.white)
            .cornerRadius(10)
    }
}

extension Button {
    func applyAppButtonStyle() -> some View {
        modifier(AppButtonStyle())
    }
}
