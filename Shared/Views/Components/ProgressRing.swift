//
//  ProgressRing.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 08/02/2022.
//

import SwiftUI

struct ProgressRing: View {
    
    var progression: CGFloat
    var ringColor: Color
    
    
    var body: some View {
        ZStack {
            // Light gray circle
            Circle()
                .stroke(Color(uiColor: .brainCardsBackground), lineWidth: 7)
            
            // Colored Circle
            Circle()
                .trim(from: 0, to: progression/100)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [ringColor]),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: 7, lineCap: .round)
                ).rotationEffect(.degrees(-90))
            
            // First dot (to cover color glitch)
            Circle()
                .frame(width: 7, height: 7)
                .foregroundColor(ringColor)
                .offset(y: -30)
            
            // Second dot (to cover the first dot when progression = 100)
            Circle()
                .frame(width: 7, height: 7)
                .offset(y: -30)
                .foregroundColor(progression > 96 ? ringColor: ringColor.opacity(0))
                .rotationEffect(Angle.degrees(360 * Double(progression/100)))
                .shadow(color: progression > 96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)
        }
        .frame(width: 60, height: 60, alignment: .center)
    }
}





struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing(progression: 71, ringColor: Color.blue)
    }
}
