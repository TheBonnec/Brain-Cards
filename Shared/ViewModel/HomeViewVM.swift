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



@MainActor
class HomeViewVM: NSObject, ObservableObject {
    
    @Published var decks: [DeckViewModel] = []
    private let fetchedResultsController: NSFetchedResultsController<Deck>
    
    init(context: NSManagedObjectContext) {
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: Deck.all(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        self.fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            guard let decks = fetchedResultsController.fetchedObjects else {return}
            self.decks = decks.map(DeckViewModel.init)
        } catch {
            print(error)
        }
    }
}




extension HomeViewVM: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let deckss = controller.fetchedObjects as? [Deck] else {return}
        self.decks = deckss.map(DeckViewModel.init)
    }
}
