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
    let queue1 = DispatchQueue(label:"Serial Queues 1") //serial queue by default
    // what is serial queue or concurrent queue q
    let queue2 = DispatchQueue(label:"Concurrent Queues 2",attributes: .concurrent)
    
    var body: some Scene {
        WindowGroup {
            SingleThreadExample()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
           
            
        }
    }
}
