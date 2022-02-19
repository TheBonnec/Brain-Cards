//
//  DeckViewModel.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 15/02/2022.
//

import Foundation
import SwiftUI
import Combine
import CoreData



struct DeckViewModel: Identifiable, Hashable {
    var deck: Deck
    
    init(deck: Deck) {
        self.deck = deck
    }
    
    var id: NSManagedObjectID {
        deck.objectID
    }
    
    var name: String! {
        deck.name
    }
    
    var icon: String {
        deck.icon
    }
    
    var iconColor: UIColor {
        deck.iconColor
    }
    
    var lastOpening: Date {
        deck.lastOpening
    }
    
    var cards: [CardViewModel] {
        var cardsList: [CardViewModel] = []
        for item in deck.cards?.allObjects as! [Card] {
            cardsList.append(CardViewModel(card: item))
        }
        return cardsList
    }
}
