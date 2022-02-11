//
//  BCTabBar.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 10/02/2022.
//

import SwiftUI
import Combine


struct BCTabBar: View {
    
    @EnvironmentObject var contentViewVM: ContentViewVM
    var tabBarElements: [String] = ["house.fill", "chart.bar.fill", "person.crop.circle.fill"]
    
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabBarElements, id: \.self) {element in
                Image(systemName: element)
                    .hCenter()
                    .vCenter()
                    .font(Font.title3.weight(.semibold))
                    .foregroundColor(contentViewVM.tabBarState.rawValue == element ? .cyan : .gray)
                    .background(contentViewVM.tabBarState.rawValue == element ? Color.cyan.opacity(0.1) : nil)
                    .cornerRadius(7)
            }
        }
        .hCenter()
        .frame(height: 52)  // Value is set to 52 because there's a padding of 4 inside (4 on top and 4 on bottom)
        .padding(4)     // Inside padding
        .background(Color(uiColor: .systemBackground))
        .cornerRadius(10)
        .padding(16)    // Outside padding
        .bcShadow()
    }
}





struct BCTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BCTabBar()
    }
}
