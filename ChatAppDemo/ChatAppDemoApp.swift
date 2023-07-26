//
//  ChatAppDemoApp.swift
//  ChatAppDemo
//
//  Created by Airis Wang on 7/25/23.
//

import SwiftUI
import Firebase

@main
struct ChatAppDemoApp: App {
    // configure our iOS app with the Firebase app we created
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
