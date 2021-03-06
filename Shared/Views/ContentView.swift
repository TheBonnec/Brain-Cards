//
//  ContentView.swift
//  Shared
//
//  Created by Thomas Le Bonnec on 21/01/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var tabBarVM: TabBarVM
    @State var tabBarState: BCTabBarEnum = .home
    

    var body: some View {
        ZStack {
            // Main view
            switch tabBarState {
            case .home: HomeView(viewModel: HomeViewVM(context: context))
            case .store: Text("Store")
            case .statistics: Text("Statistics")
            case .account: Text("Account")
            }
            
            // Tab Bar
            if tabBarVM.showTabBar {
                BCTabBar(tabBarState: $tabBarState)
                    .vBottom()
            }
        }
    }

}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
