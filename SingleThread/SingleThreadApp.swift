//
//  SingleThreadApp.swift
//  SingleThread
//
//  Created by Mach Dieu Bang on 10/1/20.
//

import SwiftUI

@main
struct SingleThreadApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            SingleThreadExample()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
           
            
        }
    }
}
