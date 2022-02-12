//
//  BCTabBar.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 10/02/2022.
//

import SwiftUI
import Combine


struct BCTabBar: View {
    
    @Binding var tabBarState: BCTabBarEnum
    @EnvironmentObject var tabBarVM: TabBarVM
    var tabBarElements: [BCTabBarEnum] = [.home, .store, .statistics, .account]
    
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabBarElements, id: \.self) {element in
                Image(systemName: element.rawValue)
                    .hCenter()
                    .vCenter()
                    .font(Font.title3.weight(.semibold))
                    .foregroundColor(tabBarState == element ? .cyan : .gray)     // gray or cyan if selected
                    .background(tabBarState == element ? Color.cyan.opacity(0.1) : Color(uiColor: .brainCardsBackground4).opacity(0))
                    .cornerRadius(7)    // Corns the background
                    .onTapGesture {
                        self.tabBarState = element
                    }
            }
        }
        .hCenter()      // Place the hole bar at the center
        .frame(height: 52)  // Value is set to 52 because there's a padding of 4 inside (4 on top and 4 on bottom)
        .padding(4)
        .background(Color(uiColor: .brainCardsBackground4))
        .cornerRadius(10)
        .padding(16)    // Outside padding
        .bcShadow()
    }
}





struct BCTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BCTabBar(tabBarState: .constant(.home))
    }
}
