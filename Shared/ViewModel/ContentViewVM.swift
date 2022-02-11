//
//  BCTabBarVM.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 10/02/2022.
//

import Foundation
import SwiftUI
import Combine


class ContentViewVM: ObservableObject {
    @Published var tabBarState: BCTabBarEnum = .home
    @Published var showTabBar: Bool = true
    
    func updateTabBarState(newValue: BCTabBarEnum) {
        self.tabBarState = newValue
    }
    
    func toogleTabBar() {
        self.showTabBar.toggle()
    }
}



enum BCTabBarEnum: String {
    case home = "house.fill"
    case statistics = "chart.bar.fill"
    case account = "person.crop.circle.fill"
}
