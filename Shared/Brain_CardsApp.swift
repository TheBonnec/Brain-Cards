//
//  Brain_CardsApp.swift
//  Shared
//
//  Created by Thomas Le Bonnec on 21/01/2022.
//

import SwiftUI

@main
struct Brain_CardsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(ContentViewVM())
        }
    }
}
