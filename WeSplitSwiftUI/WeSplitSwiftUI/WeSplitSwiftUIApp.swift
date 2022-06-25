//
//  WeSplitSwiftUIApp.swift
//  WeSplitSwiftUI
//
//  Created by Ahuja, Abhishek on 4/24/22.
//

import SwiftUI

@main
struct WeSplitSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
