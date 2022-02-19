//
//  CreateDeckView.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 09/02/2022.
//

import SwiftUI

struct CreateDeckView: View {
    
    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var tabBarVM: TabBarVM
    @StateObject var createDeckViewVM: CreateDeckViewVM
    
    @Binding var showCreateDeckView: Bool
    
    var iconGridItems: [GridItem] = [
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40))
    ]
    var colorGridItems: [GridItem] = [
        GridItem(.fixed(40))
    ]
    var iconsList: [String] = ["pencil", "trash.fill", "folder.fill", "paperplane.fill", "tray.fill", "archivebox.fill", "doc.fill", "doc.plaintext.fill", "calendar", "book.closed.fill", "bookmark.fill", "brain", "car.fill", "character.book.closed.fill"]
    var colorsList: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemMint, .systemCyan, .systemBlue, .systemIndigo, .systemPurple, .systemPink, .systemBrown, .systemGray]
    
    
    
    
    var body: some View {
        CreationMenu(showMenu: $showCreateDeckView, title: "New Deck") {
            self.tabBarVM.toogleTabBar()
        } contentView: {
            VStack {
                // Deck's name field
                TextField("Deck's name", text: $createDeckViewVM.name)
                    .padding(.top, 12)
                
                // Icon selector
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: iconGridItems, spacing: 8 ) {
                        ForEach(iconsList, id: \.self) { icon in
                            Image(systemName: icon)
                                .font(Font.body.weight(.semibold))
                                .foregroundColor(self.createDeckViewVM.icon == icon ? Color(uiColor: createDeckViewVM.iconColor) : .gray)
                                .frame(width: 40, height: 40)
                                .background(self.createDeckViewVM.icon == icon ? Color(uiColor: createDeckViewVM.iconColor).opacity(0.15) : nil)
                                .cornerRadius(5)
                                .onTapGesture {
                                    self.createDeckViewVM.icon = icon
                                }
                        }
                    }
                }
                .padding(.all, 8)
                .background(Color(uiColor: .brainCardsBackground2))
                .frame(height: 152)
                .cornerRadius(8)
                .padding(.top, 8)
                
                // Color selector
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: colorGridItems, spacing: 8) {
                        ForEach(colorsList, id: \.self) { iconColor in
                            Image(systemName: iconColor == self.createDeckViewVM.iconColor ? "circle.inset.filled" : "circle.fill")
                                .font(Font.body.weight(.semibold))
                                .foregroundColor(Color(uiColor: iconColor))
                                .frame(width: 40, height: 40)
                                .onTapGesture {
                                    self.createDeckViewVM.iconColor = iconColor
                                }
                        }
                    }
                }
                .padding(.all, 8)
                .background(Color(uiColor: .brainCardsBackground2))
                .frame(height: 56)
                .cornerRadius(8)
                .padding(.top, 8)
                .padding(.bottom, 16)
                
                // Create button
                Button {
                    self.createDeckViewVM.save()
                    self.tabBarVM.toogleTabBar()
                    self.showCreateDeckView = false
                } label: {
                    Text("Create")
                        .foregroundColor(.white)
                        .hCenter()
                        .frame(height: 40)
                        .background(Color.cyan)
                        .cornerRadius(8)
                }
            }
        }

    }
}





struct CreateDeckView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        CreateDeckView(createDeckViewVM: CreateDeckViewVM(context: context), showCreateDeckView: .constant(true))
    }
}
