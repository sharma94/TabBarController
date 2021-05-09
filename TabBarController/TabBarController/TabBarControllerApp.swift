//
//  TabBarControllerApp.swift
//  TabBarController
//
//  Created by R M Sharma on 09/05/21.
//

import SwiftUI

@main
struct TabBarControllerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
