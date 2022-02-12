//
//  DeckView.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 08/02/2022.
//

import SwiftUI

struct DeckCellView: View {
    
    var deck: Deck
    var progression: CGFloat
    
    
    var body: some View {
        HStack(spacing: 16) {
            // Logo of the Deck
            LinearGradient(gradient: Gradient(colors: [Color(deck.iconColor)]), startPoint: .bottomTrailing, endPoint: .topLeading)
                .mask({
                    Image(systemName: deck.icon)
                        .resizable()
                        .scaledToFit()
                        .font(Font.title.weight(.semibold))
            })
            .frame(width: 35, height: 35)
            
            // Name of the Deck
            Text(deck.name)
                .font(Font.title2.weight(.semibold))
            
            Spacer()
            
            // Progression Value
            ZStack {
                ProgressRing(progression: progression, ringColor: Color(deck.iconColor))
                    .frame(width: 60, height: 60, alignment: .center)
                
                Text(String(format: "%.f", progression))
                    .font(Font.title2)
                    .foregroundColor(Color(uiColor: .gray))
            }
        }
        .padding(16)
        .background(Color(uiColor: .brainCardsBackground4))
        .cornerRadius(10)
        .bcShadow2()
    }
}





struct DeckCellView_Previews: PreviewProvider {
    static var previews: some View {
        DeckCellView(deck: Deck(), progression: 71)
    }
}
