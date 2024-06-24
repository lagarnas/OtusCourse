//
//  HomeScreen.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 24.06.2024.
//

import SwiftUI

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

#Preview {
    HomeScreen(tabSelected: .constant(1))
}
