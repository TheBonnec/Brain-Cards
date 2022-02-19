//
//  CardCellView.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 13/02/2022.
//

import SwiftUI
import CoreData


struct CardCellView: View {
    
    var card: CardViewModel
    
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(card.cardElements, id: \.self) { cardElement in
                Text(cardElement.content)
                    .hLeading()
                    .background(Color(uiColor: .brainCardsBackground4))
            }
            .padding(16)
        }
        .frame(height: 100)
        .background(Color(uiColor: .brainCardsBackground4))
        .cornerRadius(10)
        .bcShadow2()
    }
}





struct CardCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardCellView(card: CardViewModel(card: Card()))
    }
}
