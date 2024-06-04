//
//  ContentView.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 02.06.2024.
//

import SwiftUI

// 6. Протестировать на iPad/iPhone симуляторах, со сменой ориентации девайса
// 7. Добавить один UIKit компонент через UIViewRepresantable

struct MainTabView: View {
    var body: some View {
        TabView {
            FirstTabView()
                .badge(2)
                .tabItem {
                    Label("Received",
                          systemImage: "tray.and.arrow.down.fill")
                }
            SecondTabView()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
            ThirdTabView()
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

// На первом табе должна быть кнопка открывающая второй таб и один из пунктов там
struct FirstTabView: View {
    var body: some View {
        Text("The First Tab")
    }
}

// 2.На втором табе сделать List с обернутый в NavigationView
// 3.Из листа должны быть переходы с NavigationLink
struct SecondTabView: View {
    var body: some View {
        Text("The Second Tab")
    }
}

// 4. На третьем табе должна быть кнопка открывающая модальное окно
struct ThirdTabView: View {
    var body: some View {
        Text("The Third Tab")
    }
}

#Preview {
    MainTabView()
}
