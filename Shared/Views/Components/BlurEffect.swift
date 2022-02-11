//
//  BlurEffect.swift
//  Brain Cards
//
//  Created by Thomas Le Bonnec on 09/02/2022.
//

import Foundation
import SwiftUI


struct BlurEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        let effect = UIVisualEffectView(effect: UIBlurEffect(style: style))
        effect.alpha = 1
        return effect
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
