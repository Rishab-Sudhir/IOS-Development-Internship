//
//  GradientViewExtension.swift


import SwiftUI

extension View {
    func linearGradient(colors: [Color], starts: UnitPoint, ends: UnitPoint) -> some View {
        background(
            LinearGradient(gradient: Gradient(colors: colors), startPoint: starts, endPoint: ends)
        )
    }
}
