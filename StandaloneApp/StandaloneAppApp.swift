//
//  StandaloneAppApp.swift
//  StandaloneApp
//
//  Created by Makena Robison on 1/27/22.
//

import SwiftUI

@main
struct StandaloneAppApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
