//
//  DeckView.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 10/02/2022.
//

import SwiftUI

struct DeckDetailView: View {
    
    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var tabBarVM: TabBarVM
    @FetchRequest(entity: Card.entity(), sortDescriptors: []) private var cards: FetchedResults<Card>
    
    @Binding var showDeckView: Bool
    var deck: Deck
    
    
    
    var body: some View {
        ZStack {
            // Background Color
            Color(uiColor: .brainCardsBackground)
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 0) {
                    topBar
                    titleBar
                }
                .vTop()
            }
        }
    }
    
    
    
    var topBar: some View {
        HStack {
            // Main Menu Button
            Button {
                self.showDeckView = false
                self.tabBarVM.toogleTabBar()
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(uiColor: deck.iconColor))
                    
                    Text("Main menu")
                        .foregroundColor(Color(uiColor: deck.iconColor))
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
                    .foregroundColor(Color(uiColor: deck.iconColor))
                    .background(Color(uiColor: .brainCardsBackground2))
                    .cornerRadius(6)
                    .bcShadow2()
            }

            // Run Button
            Button {
                print("Run Button Clicked")
            } label: {
                Text("Run")
                    .font(Font.title3.weight(.medium))
                    .frame(height: 40)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
                    .background(Color(uiColor: deck.iconColor))
                    .cornerRadius(6)
                    .bcShadow2()
            }
        }
        .padding([.horizontal, .top], 16)
    }
    
    
    
    
    
    var titleBar: some View {
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
                ProgressRing(progression: 0, ringColor: Color(deck.iconColor))
                    .frame(width: 60, height: 60, alignment: .center)
                
                Text(String(format: "%.f", 0))
                    .font(Font.title2)
                    .foregroundColor(Color(uiColor: .gray))
            }
        }
        .padding([.horizontal, .top], 16)
    }
}










struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckDetailView(showDeckView: .constant(true), deck: Deck())
    }
}
