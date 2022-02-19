//
//  CreateCardViewVM.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 18/02/2022.
//

import Foundation
import SwiftUI
import Combine
import CoreData



class CreateCardViewVM: NSObject, ObservableObject {
    
    @Published var cardContent1: String = ""
    @Published var cardContent2: String = ""
    var deck: DeckViewModel
    var context: NSManagedObjectContext
    
    init(deck: DeckViewModel, context: NSManagedObjectContext) {
        self.deck = deck
        self.context = context
    }
    
    
    func save() {
        do {
            let newCard = Card(context: context)
            newCard.deck = deck.deck
            let newCardElement1 = CardElement(context: context)
            newCardElement1.card = newCard
            newCardElement1.content = cardContent1
            newCardElement1.position = 0
            let newCardElement2 = CardElement(context: context)
            newCardElement2.card = newCard
            newCardElement2.content = cardContent2
            newCardElement2.position = 1
            try newCard.save()
        } catch {
            print(error)
        }
    }
}
