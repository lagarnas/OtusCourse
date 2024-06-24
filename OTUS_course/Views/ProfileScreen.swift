//
//  ProfileScreen.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 24.06.2024.
//

import SwiftUI

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

#Preview {
    ProfileScreen()
}
