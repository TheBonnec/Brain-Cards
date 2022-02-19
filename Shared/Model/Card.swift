//
//  Card.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 15/02/2022.
//

import Foundation
import CoreData



extension Card: CoreDataBaseModel {
    static func all() -> NSFetchRequest<Card> {
        let request = Card.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Card.creationDate, ascending: true)]
        return request
    }
    
    static func allFromDeck(deck: Deck) -> NSFetchRequest<Card> {
        let request = Card.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Card.creationDate, ascending: true)]
        request.predicate = NSPredicate(format: "deck == %@", deck)
        return request
    }
}
