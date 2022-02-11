//
//  Deck.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 09/02/2022.
//

import Foundation
import CoreData
import SwiftUI


@objc(Deck)
class Deck: NSManagedObject {
    
}


extension Deck {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Deck> {
        return NSFetchRequest<Deck>(entityName: "Deck")
    }

    @NSManaged public var icon: String
    @NSManaged public var iconColor: UIColor
    @NSManaged public var id: UUID
    @NSManaged public var lastOpening: Date
    @NSManaged public var name: String

}

extension Deck: Identifiable {

}
