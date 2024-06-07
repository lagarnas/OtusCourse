//
//  OTUS_courseApp.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 02.06.2024.
//

import SwiftUI

@main
struct OTUS_courseApp: App {
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
