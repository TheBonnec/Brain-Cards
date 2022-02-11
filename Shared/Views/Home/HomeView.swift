//
//  HomeView.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 08/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var contentViewVM: ContentViewVM
    @StateObject var homeViewVM: HomeViewVM = HomeViewVM()
    @FetchRequest(fetchRequest: Deck.fetchRequest()) private var decks: FetchedResults<Deck>

    @State var showCreateDeckView: Bool = false
    
    
    var body: some View {
        ZStack {
            // Main View
            homeView
            
            // New Deck Button
            PlusButton {
                self.contentViewVM.toogleTabBar()
                self.showCreateDeckView = true
            }
            .padding(.bottom, contentViewVM.showTabBar ? 76 : 0)    // The button will be positioned higher is the Tab Bar is shown
            .vBottom()
            
            // New Deck View
            if showCreateDeckView {
                CreateDeckView(homeViewVM: homeViewVM, showCreateDeckView: $showCreateDeckView)
            }
        }
    }
    
    
    
    var homeView: some View {
        NavigationView {
            ZStack {
                // Background Color
                Color(uiColor: .brainCardsBackground)
                    .ignoresSafeArea()
                
                
                VStack(spacing: 16) {
                    // Items view
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(decks, id: \.self) { deck in
                                DeckCellView(deck: deck, progression: 40)
                                    .onTapGesture {
                                        homeViewVM.deleteDeck(context: context, deck: deck)
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .padding(.bottom, 132)
                    }
                }
            }
            .navigationTitle(Text("Brain Cards"))
        }
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
