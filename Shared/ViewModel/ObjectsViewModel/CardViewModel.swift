//
//  CardViewModel.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 15/02/2022.
//

import Foundation
import SwiftUI
import CoreData



struct CardViewModel: Identifiable, Hashable {
    var card: Card
    
    var id: NSManagedObjectID {
        card.objectID
    }
    
    var creationDate: Date {
        card.creationDate ?? Date()
    }
    
    var deck: Deck {
        card.deck!
    }
    
    var cardElements: [CardElementViewModel] {
        var cardElementsList: [CardElementViewModel] = []
        for item in card.cardElements?.allObjects as! [CardElement] {
            cardElementsList.append(CardElementViewModel(cardElement: item))
        }
        return cardElementsList
    }
}
