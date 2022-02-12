//
//  BCTabBarVM.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 10/02/2022.
//

import Foundation
import SwiftUI
import Combine


class TabBarVM: ObservableObject {
    @Published var showTabBar: Bool = true
    
    func toogleTabBar() {
        self.showTabBar.toggle()
    }
}



enum BCTabBarEnum: String {
    case home = "house.fill"
    case store = "bag.fill.badge.plus"
    case statistics = "chart.bar.fill"
    case account = "person.crop.circle.fill"
}
