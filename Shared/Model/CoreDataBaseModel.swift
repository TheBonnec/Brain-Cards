//
//  CoreDataBaseModel.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 15/02/2022.
//

import Foundation
import CoreData



// Protocol that every CoreData Objects will conform to.
// It will enable every Object to "save" and "delete" itself
protocol CoreDataBaseModel {
    static var viewContext: NSManagedObjectContext {get}
    func save() throws
    func delete() throws
}


extension CoreDataBaseModel where Self: NSManagedObject {
    static var viewContext: NSManagedObjectContext {
        PersistenceController.shared.container.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
}
