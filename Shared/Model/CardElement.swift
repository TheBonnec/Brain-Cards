//
//  CardElement.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 15/02/2022.
//

import Foundation
import CoreData


extension CardElement: CoreDataBaseModel {
    static func all() -> NSFetchRequest<CardElement> {
        let request = CardElement.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CardElement.position, ascending: true)]
        return request
    }
    
    static func allFromCard(card: Card) -> NSFetchRequest<CardElement> {
        let request = CardElement.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CardElement.position, ascending: true)]
        request.predicate = NSPredicate(format: "card == %@", card)
        return request
    }
}
