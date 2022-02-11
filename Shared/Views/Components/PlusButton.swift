//
//  PlusButton.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 10/02/2022.
//

import SwiftUI


struct PlusButton: View {
    
    var action: () -> Void
    
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus")
                .font(Font.title2.weight(.medium))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(Color.cyan)
                .cornerRadius(6)
                .bcShadow()
                .padding(16)
                .hTrailing()
        }

    }
}





struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton(action: {
            print("Hello World")
        })
    }
}
