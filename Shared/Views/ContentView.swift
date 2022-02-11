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
    @EnvironmentObject var contentViewVM: ContentViewVM
    

    var body: some View {
        ZStack {
            // Main view
            HomeView()
            
            // Tab Bar
            if contentViewVM.showTabBar {
                BCTabBar()
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




extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    func vTop() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .top)
    }
    func vBottom() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
    func vCenter() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .center)
    }
    
    
    
    func bcShadow() -> some View {
        self
            .shadow(color: Color(uiColor: .black).opacity(0.2), radius: 13)
    }
    func bcShadow2() -> some View {
        self
            .shadow(color: Color(uiColor: .black).opacity(0.1), radius: 8)
    }
}
