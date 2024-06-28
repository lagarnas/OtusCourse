//
//  AppNavBarView.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 27.06.2024.
//

import SwiftUI

private enum Constants {
    static let firstScreenTitle: String = "First screen"
    static let secondScreenTitle: String = "Second screen"
    static let thirdScreenTitle: String = "Third screen"
    static let firstNavLinkTitle: String = "Navigate to second screen"
    static let secondNavLinkTitle: String = "Navigate to third screen"
    static let thirdNavLinkTitle: String = "This is a third screen!"
}

// 4. Сделать глубину в 3 экрана с помощью кастомного навигейшен-стека

struct AppNavBarView: View {
    
    var body: some View {
        CustomNavView {
            ZStack {
                Color.white.ignoresSafeArea()
                CustomNavLink(destination: CustomNavLink(destination: Text(Constants.thirdNavLinkTitle)
                    .customNavBarItems(title: Constants.thirdScreenTitle,
                                       backButtonHidden: false)) {
                    Text(Constants.secondNavLinkTitle)
                        .customNavBarItems(title: Constants.secondScreenTitle,
                                           backButtonHidden: false)
                }) {
                    Text(Constants.firstNavLinkTitle)
                }
            }
            .customNavBarItems(title: Constants.firstScreenTitle,
                               backButtonHidden: true)
        }
    }
}

#Preview {
    AppNavBarView()
}

extension AppNavBarView {
    
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink(destination:
                                Text("Destination")
                    .navigationTitle("Title 2")
                    .navigationBarBackButtonHidden(false)
                               ,
                               label: { Text("Navigate")
                })
            }
            .navigationTitle("Nav title here")
        }
    }
}
