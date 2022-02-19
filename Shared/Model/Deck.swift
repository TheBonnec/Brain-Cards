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
public class Deck: NSManagedObject {
    
}


extension Deck {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Deck> {
        return NSFetchRequest<Deck>(entityName: "Deck")
    }

    @NSManaged public var icon: String
    @NSManaged public var iconColor: UIColor
    @NSManaged public var lastOpening: Date
    @NSManaged public var name: String
    @NSManaged public var cards: NSSet?

}


// MARK: Generated accessors for cards
extension Deck {

    @objc(addCardsObject:)
    @NSManaged public func addToCards(_ value: CardElement)

    @objc(removeCardsObject:)
    @NSManaged public func removeFromCards(_ value: CardElement)

    @objc(addCards:)
    @NSManaged public func addToCards(_ values: NSSet)

    @objc(removeCards:)
    @NSManaged public func removeFromCards(_ values: NSSet)

}


extension Deck: Identifiable {

}


extension Deck: CoreDataBaseModel {
    static func all() -> NSFetchRequest<Deck> {
        let request = Deck.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Deck.lastOpening, ascending: true)]
        return request
    }
}
