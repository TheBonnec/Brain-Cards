//
//  CardElementViewModel.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 15/02/2022.
//

import Foundation
import SwiftUI
import CoreData



struct CardElementViewModel: Identifiable, Hashable {
    var cardElement: CardElement
    
    var id: NSManagedObjectID {
        cardElement.objectID
    }
    
    var position: Int {
        Int(cardElement.position)
    }
    
    var content: String! {
        cardElement.content ?? ""
    }
    
    var card: Card {
        cardElement.card ?? Card()
    }
}
