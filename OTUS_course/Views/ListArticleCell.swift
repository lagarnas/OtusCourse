//
//  ListArticleCell.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 25.06.2024.
//

import SwiftUI

struct ListArticleCell: View {
    
    let title: String
    let description: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).foregroundColor(.secondary)
            VStack {
                Text(title.isEmpty ? description: title)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .onTapGesture {
            // some animation
        }
    }
}

#Preview {
    ListArticleCell(title: "", description: "")
}
