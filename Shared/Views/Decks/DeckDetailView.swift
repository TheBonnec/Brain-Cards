//
//  DeckView.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 10/02/2022.
//

import SwiftUI
import CoreData



struct DeckDetailView: View {
    
    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var tabBarVM: TabBarVM
    @StateObject var viewModel: DeckViewVM
    
    @Binding var showDeckView: Bool
    @State var displayTitleBar: Bool = true
    @State var showCreateCardView: Bool = false
    @State var titleBarOffset: CGFloat = .zero
    
    
    init (showDeckView: Binding<Bool>, context: NSManagedObjectContext, deck: DeckViewModel) {
        self._showDeckView = showDeckView
        self._viewModel = StateObject(wrappedValue: DeckViewVM(context: context, deck: deck))
    }
    
    
    
    var body: some View {
        ZStack {
            contentView
            
            if showCreateCardView {
                CreateCardView(deck: viewModel.deck, context: context, showCreateCardView: $showCreateCardView)
            }
        }
    }
    
    
    
    var contentView: some View {
        ZStack {
            // Background Color
            Color(uiColor: .brainCardsBackground)
                .ignoresSafeArea()
            
            // Cards scroll view
            VStack {
                // Title bar
                DeckDetailViewTitleBar(deck: viewModel.deck)
                    .padding(16)
                    .opacity(self.displayTitleBar ? 1 : 0)
                    .offset(y: self.titleBarOffset - 56)
                
                
                GeometryReader { geometry in
                    ScrollView {
                        // Cards list
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16) {
                            ForEach(viewModel.cards, id: \.self) {card in
                                CardCellView(card: card)
                            }
                        }
                        
                        .padding(.top, 53)
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .onChange(of: geometry.frame(in: .global).minY) { newValue in
                            self.titleBarOffset = newValue
                            print(newValue)
                            withAnimation {
                                if newValue > 69 {
                                    self.displayTitleBar = true
                                } else {
                                    self.displayTitleBar = false
                                }
                            }
                        }
                    }
                }
            }
            .vTop()
            
            
            // Top bar
            VStack {
                DeckDetailViewTopBar(showDeckView: $showDeckView, deck: viewModel.deck)
                
                // Small title bar (displayed when the title bar is too high)
                if !displayTitleBar {
                    HStack {
                        Image(systemName: viewModel.deck.icon)
                            .font(Font.body.weight(.semibold))
                            .foregroundColor(Color(uiColor: viewModel.deck.iconColor))
                        
                        Text(viewModel.deck.name)
                            .font(Font.body.weight(.semibold))
                    }
                }
            }
            .padding([.horizontal, .bottom], 16)
            .padding(.top, 12)
            .background(displayTitleBar ? Color(uiColor: .brainCardsBackground).ignoresSafeArea().opacity(1) : Color(uiColor: .brainCardsBackground).ignoresSafeArea().opacity(0))
            .background(BlurEffect(style: .systemChromeMaterial).ignoresSafeArea())
            .vTop()
            
            
            // Create card button
            PlusButton(bgColor: Color(uiColor: viewModel.deck.iconColor)) {
                self.showCreateCardView.toggle()
            }
        }
        
    }
    
    
    
    
    
    func test(geometry: GeometryProxy) -> Bool {
        print(geometry.frame(in: .global).minY)
        return displayTitleBar
    }
}





struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        DeckDetailView(showDeckView: .constant(true), context: context, deck: DeckViewModel(deck: Deck()))
    }
}
