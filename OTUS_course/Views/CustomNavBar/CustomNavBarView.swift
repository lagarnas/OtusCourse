//
//  CustomNavBarView.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 27.06.2024.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack {
            if showBackButton { backButton }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue)
    }
}

#Preview {
    VStack {
        CustomNavBarView(showBackButton: true, 
                         title: "Title here",
                         subtitle: "Subtitle goes here")
        Spacer()
    }
}

extension  CustomNavBarView {
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        })
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}
