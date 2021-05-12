//
//  Persistence.swift
//  TabBarController
//
//  Created by R M Sharma on 09/05/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let newAddress = Address(context: viewContext)
        let newUser = User(context: viewContext)
        
        let loc = Location(context: viewContext)
        loc.lat = "-43.9509"
        loc.lng = "-34.4618"
        newAddress.geo = loc
        
        newAddress.street = "Victor Plains"
        newAddress.suite = "Suite 879"
        newAddress.city = "Wisokyburgh"
        newAddress.zipcode = "90566-7771"
        
        newUser.id = 1
        newUser.name = "Ervin Howell"
        newUser.username = "Antonette"
        newUser.email = "Shanna@melissa.tv"
        newUser.phone = "010-692-6593 x09125"
        newUser.website = "anastasia.net"
        newUser.address = newAddress
       
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TabBarController")
        //// update CoreData model
//        let description = NSPersistentStoreDescription()
//        description.shouldInferMappingModelAutomatically = true
//        description.shouldMigrateStoreAutomatically = true
//        container.persistentStoreDescriptions.append(description)
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
//        container.viewContext.automaticallyMergesChangesFromParent = true
//        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
                    
    }
}
