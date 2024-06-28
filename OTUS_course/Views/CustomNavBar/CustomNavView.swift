//
//  CustomNavView.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 27.06.2024.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            CustomNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    CustomNavView {
        Color.red.ignoresSafeArea()
    }
}

extension UINavigationController {
    
    open override func viewDidLoad() {
         super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = nil
    }
}
