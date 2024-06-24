//
//  AppButtonStyle.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 24.06.2024.
//

import SwiftUI

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
