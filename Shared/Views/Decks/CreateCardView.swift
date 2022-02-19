//
//  CreateCardView.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 13/02/2022.
//

import SwiftUI
import CoreData


struct CreateCardView: View {
    
    @Environment(\.managedObjectContext) private var context
    @StateObject var viewModel: CreateCardViewVM
    
    @Binding var showCreateCardView: Bool
    
    init(deck: DeckViewModel, context: NSManagedObjectContext, showCreateCardView: Binding<Bool>) {
        self._viewModel = StateObject(wrappedValue: CreateCardViewVM(deck: deck, context: context))
        self._showCreateCardView = showCreateCardView
    }
    
    
    
    var body: some View {
        // Calling the base model of the view
        CreationMenu(showMenu: $showCreateCardView, title: "New Card") {
            Void()
        } contentView: {
            VStack {
                // 1st element name field
                TextField("1st element", text: $viewModel.cardContent1)
                    .background(Color(uiColor: .brainCardsBackground4))
                    .padding(.top, 12)
                
                // 2nd element name field
                TextField("2nd element", text: $viewModel.cardContent2)
                    .background(Color(uiColor: .brainCardsBackground4))
                    .padding(.top, 8)
                
                // Create button
                Button {
                    self.viewModel.save()
                    self.showCreateCardView.toggle()
                } label: {
                    Text("Create")
                        .foregroundColor(.white)
                        .hCenter()
                        .frame(height: 40)
                        .background(Color(uiColor: viewModel.deck.iconColor))
                        .cornerRadius(8)
                }
                .padding(.top, 24)
            }
        }

    }
}





struct CreateCardView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        CreateCardView(deck: DeckViewModel(deck: Deck()), context: context, showCreateCardView: .constant(true))
    }
}
