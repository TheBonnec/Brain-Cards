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
    @StateObject var viewModel: HomeViewVM

    @State var showCreateDeckView: Bool = false
    @State var showDeckDetailView: Bool = false
    @State var deckToPass: DeckViewModel? = nil
    
    
    
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
            
            // New Deck View
            if showCreateDeckView {
                CreateDeckView(createDeckViewVM: CreateDeckViewVM(context: context), showCreateDeckView: $showCreateDeckView)
            }
            
            // Deck Detail View
            if showDeckDetailView && deckToPass != nil {
                DeckDetailView(showDeckView: $showDeckDetailView, context: context, deck: deckToPass!)
            }
        }
    }
    
    
    
    var decksListView: some View {
        NavigationView {
            ZStack {
                // Background Color
                Color(uiColor: .brainCardsBackground)
                    .ignoresSafeArea()
                
                // Items view
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.decks) { deck in
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
            .navigationTitle(Text("Home"))
        }
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        HomeView(viewModel: HomeViewVM(context: context), deckToPass: DeckViewModel(deck: Deck()))
    }
}
