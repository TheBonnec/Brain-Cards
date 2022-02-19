//
//  DeckViewVM.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 13/02/2022.
//

import Foundation
import SwiftUI
import Combine
import CoreData



class DeckViewVM: NSObject, ObservableObject {
    
    @Published var cards: [CardViewModel] = []
    private let fetchedResultsController: NSFetchedResultsController<Card>
    var deck: DeckViewModel
    
    
    init(context: NSManagedObjectContext, deck: DeckViewModel) {
        self.deck = deck
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: Card.allFromDeck(deck: deck.deck), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        self.fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            guard let cards = fetchedResultsController.fetchedObjects else {return}
            self.cards = cards.map(CardViewModel.init)
        } catch {
            print(error)
        }
    }
    
    
    
    func createCard(context: NSManagedObjectContext, deck: Deck, cardElement1Content: String, cardElement2Content: String) {
        let newCard = Card(context: context)
        newCard.creationDate = Date()
        newCard.deck = deck
        let newCardElement1 = CardElement(context: context)
        newCardElement1.content = cardElement1Content
        newCardElement1.position = Int16(0)
        newCardElement1.card = newCard
        let newCardElement2 = CardElement(context: context)
        newCardElement2.content = cardElement2Content
        newCardElement2.position = Int16(1)
        newCardElement2.card = newCard
        
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}




extension DeckViewVM: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let cards = controller.fetchedObjects as? [Card] else {return}
        self.cards = cards.map(CardViewModel.init)
    }
}
