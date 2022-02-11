//
//  HomeViewVM.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 09/02/2022.
//

import Foundation
import SwiftUI
import Combine
import CoreData



class HomeViewVM: ObservableObject {
    
    func createDeck(context: NSManagedObjectContext, name: String, icon: String, iconColor: UIColor) {
        let newDeck = Deck(context: context)
        newDeck.id = UUID()
        newDeck.name = name
        newDeck.icon = icon
        newDeck.iconColor = iconColor
        newDeck.lastOpening = Date()
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
    func deleteDeck(context: NSManagedObjectContext, deck: Deck) {
        context.delete(deck)
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
