//
//  CreateDeckView.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 09/02/2022.
//

import SwiftUI

struct CreateDeckView: View {
    
    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var contentViewVM: ContentViewVM
    @ObservedObject var homeViewVM: HomeViewVM
    
    @Binding var showCreateDeckView: Bool
    @State var name: String = ""
    @State var icon: String = "pencil"
    @State var iconColor: UIColor = .systemCyan
    
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
        ZStack {
            // Blur Background
            BlurEffect(style: .systemUltraThinMaterial)
                .ignoresSafeArea()
            
            VStack {
                // View header
                HStack {
                    // Page title
                    Text("New Deck")
                        .font(Font.title3.weight(.semibold))
                        .hLeading()
                    
                    // Close page button
                    Button {
                        self.contentViewVM.toogleTabBar()
                        self.showCreateDeckView = false
                    } label: {
                        Image(systemName: "xmark")
                            .font(Font.body.weight(.bold))
                            .foregroundColor(.red)
                            .frame(width: 30, height: 30)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(5)
                    }

                }
                
                // Deck's name field
                TextField("Deck's name", text: $name)
                    .padding(.top, 12)
                
                // Icon selector
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: iconGridItems, spacing: 8 ) {
                        ForEach(iconsList, id: \.self) { icon in
                            Image(systemName: icon)
                                .font(Font.body.weight(.semibold))
                                .foregroundColor(self.icon == icon ? Color(uiColor: iconColor) : .gray)
                                .frame(width: 40, height: 40)
                                .background(self.icon == icon ? Color(uiColor: iconColor).opacity(0.15) : nil)
                                .cornerRadius(5)
                                .onTapGesture {
                                    self.icon = icon
                                }
                        }
                    }
                }
                .padding(.all, 8)
                .background(Color(uiColor: .brainCardsBackground))
                .frame(height: 152)
                .cornerRadius(8)
                .padding(.top, 8)
                
                // Color selector
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: colorGridItems, spacing: 8 ) {
                        ForEach(colorsList, id: \.self) { iconColor in
                            Image(systemName: iconColor == self.iconColor ? "circle.inset.filled" : "circle.fill")
                                .font(Font.body.weight(.semibold))
                                .foregroundColor(Color(uiColor: iconColor))
                                .frame(width: 40, height: 40)
                                .onTapGesture {
                                    self.iconColor = iconColor
                                }
                        }
                    }
                }
                .padding(.all, 8)
                .background(Color(uiColor: .brainCardsBackground))
                .frame(height: 56)
                .cornerRadius(8)
                .padding(.top, 8)
                .padding(.bottom, 16)
                
                // Create button
                Button {
                    self.homeViewVM.createDeck(context: context, name: name, icon: icon, iconColor: iconColor)
                    self.contentViewVM.toogleTabBar()
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
            .padding(16)
            .background(Color(uiColor: .systemBackground))
            .cornerRadius(10)
            .bcShadow2()
            .padding(16)
        }
    }
}





struct CreateDeckView_Previews: PreviewProvider {
    static var previews: some View {
        CreateDeckView(homeViewVM: HomeViewVM(), showCreateDeckView: .constant(true))
    }
}
