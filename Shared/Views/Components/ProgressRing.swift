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
    var backgroundColor: Color
    var size: CGFloat
    var weight: CGFloat
    
    
    var body: some View {
        ZStack {
            // Light gray circle
            Circle()
                .stroke(backgroundColor, lineWidth: 7)
            
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
                    style: StrokeStyle(lineWidth: weight, lineCap: .round)
                ).rotationEffect(.degrees(-90))
            
            // First dot (to cover color glitch)
            Circle()
                .frame(width: weight, height: weight)
                .foregroundColor(ringColor)
                .offset(y: -size/2)
            
            // Second dot (to cover the first dot when progression = 100)
            Circle()
                .frame(width: weight, height: weight)
                .offset(y: -size/2)
                .foregroundColor(progression > 96 ? ringColor: ringColor.opacity(0))
                .rotationEffect(Angle.degrees(360 * Double(progression/100)))
                .shadow(color: progression > 96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)
        }
        .frame(width: size, height: size, alignment: .center)
        .padding(weight/2)
    }
}





struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing(progression: 71, ringColor: .blue, backgroundColor: .secondary, size: 60, weight: 7)
    }
}
