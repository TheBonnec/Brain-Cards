//
//  DeckView.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 10/02/2022.
//

import SwiftUI

struct DeckView: View {
    
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(entity: Card.entity(), sortDescriptors: []) private var cards: FetchedResults<Card>
    
    @Binding var showDeckView: Bool
    
    var deck: Deck
    
    
    
    var body: some View {
        VStack {
            topBar
                .vTop()
        }
    }
    
    
    
    var topBar: some View {
        HStack {
            // Main Menu Button
            Button {
                self.showDeckView = false
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.cyan)
                    
                    Text("Main menu")
                        .foregroundColor(.cyan)
                }
            }

            Spacer()
            
            // Setting Button
            Button {
                print("Setting Button Clicked")
            } label: {
                Image(systemName: "gearshape.fill")
                    .font(Font.title2.weight(.medium))
                    .frame(width: 40, height: 40)
                    .foregroundColor(.cyan)
                    .background(Color(uiColor: .systemBackground))
                    .cornerRadius(6)
                    .bcShadow2()
            }

            // Run Button
            Button {
                print("Run Button Clicked")
            } label: {
                Text("Run")
                    .font(Font.title2.weight(.medium))
                    .frame(height: 40)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
                    .background(Color.cyan)
                    .cornerRadius(6)
                    .bcShadow2()
            }
        }
        .padding(16)
    }
    
    
    
    var titleBar: some View {
        HStack {
            // Deck's Logo
            LinearGradient(gradient: Gradient(colors: [Color(deck.iconColor)]), startPoint: .bottomTrailing, endPoint: .topLeading)
                .mask({
                    Image(systemName: deck.icon)
                        .resizable()
                        .scaledToFit()
                        .font(Font.title.weight(.semibold))
            })
            .frame(width: 40, height: 40)
            
            
            // Deck's Title
            Text(deck.name)
                .font(Font.title.weight(.bold))
            
            // Deck's progression
        }
    }
}





struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(showDeckView: .constant(true), deck: Deck())
    }
}
