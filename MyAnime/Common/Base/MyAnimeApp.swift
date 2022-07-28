//
//  MyAnimeApp.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import SwiftUI

@main
struct MyAnimeApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
