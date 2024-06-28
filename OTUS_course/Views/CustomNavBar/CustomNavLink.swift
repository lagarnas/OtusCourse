//
//  CustomNavLink.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 27.06.2024.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(destination: CustomNavBarContainerView(content: {
            destination
        }).navigationBarHidden(true)
           ,
           label: {
            label
        })
    }
}

#Preview {
    CustomNavView {
        CustomNavLink(destination: Text("Destination")) {
            Text("CLICK ME")
        }
    }
}
