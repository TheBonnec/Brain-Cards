//
//  HomeView.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 08/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var tabBarVM: TabBarVM
    @StateObject var homeViewVM: HomeViewVM = HomeViewVM()
    @FetchRequest(entity: Deck.entity(), sortDescriptors: []) private var decks: FetchedResults<Deck>

    @State var showCreateDeckView: Bool = false
    @State var showDeckDetailView: Bool = false
    @State var deckToPass: Deck = Deck()
    
    
    
    var body: some View {
        ZStack {
            // Decks List View
            decksListView
            
            // New Deck Button
            PlusButton {
                self.tabBarVM.toogleTabBar()
                self.showCreateDeckView = true
            }
            .padding(.bottom, tabBarVM.showTabBar ? 76 : 0)    // The button will be positioned higher is the Tab Bar is shown
            .vBottom()
            
            // New Deck View
            if showCreateDeckView {
                CreateDeckView(homeViewVM: homeViewVM, showCreateDeckView: $showCreateDeckView)
            }
            
            // Deck Detail View
            if showDeckDetailView {
                DeckDetailView(showDeckView: $showDeckDetailView, deck: deckToPass)
            }
        }
    }
    
    
    
    var decksListView: some View {
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
                                        withAnimation {
                                            self.showDeckDetailView = true
                                            self.deckToPass = deck
                                            self.tabBarVM.toogleTabBar()
                                        }
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .padding(.bottom, 132)
                    }
                }
            }
            .navigationTitle(Text("Home"))
        }
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
