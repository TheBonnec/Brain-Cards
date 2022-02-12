//
//  CreationMenu.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 12/02/2022.
//

import SwiftUI

struct CreationMenu<Content: View>: View {
    
    @Binding var showMenu: Bool
    var title: String
    
    var actionsWhenClosing: () -> Void
    var contentView: () -> Content
    
    
    var body: some View {
        ZStack {
            // Blur Background
            BlurEffect(style: .systemUltraThinMaterial)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    // View title
                    Text(title)
                        .font(Font.title3.weight(.semibold))
                        .hLeading()
                    
                    // Close page button
                    Button {
                        self.actionsWhenClosing()
                        self.showMenu = false
                    } label: {
                        Image(systemName: "xmark")
                            .font(Font.body.weight(.bold))
                            .foregroundColor(.red)
                            .frame(width: 30, height: 30)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(5)
                    }
                }
                
                contentView()
            }
            .padding(16)
            .background(Color(uiColor: .brainCardsBackground4))
            .cornerRadius(10)
            .bcShadow2()
            .padding(16)
        }
    }
}






struct CreationMenu_Previews: PreviewProvider {
    static var previews: some View {
        CreationMenu(showMenu: .constant(true), title: "New Deck") {
            print("Closed button clicked")
        } contentView: {
            Text("Hello World")
        }

    }
}
