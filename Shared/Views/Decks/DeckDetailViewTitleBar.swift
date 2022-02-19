//
//  DeckDetailViewTitleBar.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 14/02/2022.
//

import SwiftUI

struct DeckDetailViewTitleBar: View {
    
    var deck: DeckViewModel
    
    
    var body: some View {
        HStack(spacing: 0) {
            // Deck's Logo
            LinearGradient(gradient: Gradient(colors: [Color(deck.iconColor)]), startPoint: .bottomTrailing, endPoint: .topLeading)
                .mask({
                    Image(systemName: deck.icon)
                        .resizable()
                        .scaledToFit()
                        .font(Font.title2.weight(.semibold))
            })
            .frame(width: 35, height: 35)
            .padding(.trailing, 16)
            
            
            // Deck's Title
            Text(deck.name)
                .font(Font.title.weight(.bold))
            
            Spacer()
            
            // Deck's Progression Value
            ZStack {
                ProgressRing(progression: 70, ringColor: Color(deck.iconColor), backgroundColor: Color(uiColor: .brainCardsBackground3), size: 45, weight: 6)
                    .frame(width: 50, height: 50, alignment: .center)
                
                Text(String(format: "%.f", 70))
                    .font(Font.title2)
                    .foregroundColor(Color(uiColor: .gray))
            }
        }
    }
}





struct DeckDetailViewTitleBar_Previews: PreviewProvider {
    static var previews: some View {
        DeckDetailViewTitleBar(deck: DeckViewModel(deck: Deck()))
    }
}
