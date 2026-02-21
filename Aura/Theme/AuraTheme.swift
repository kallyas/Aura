//
//  AuraTheme.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct AuraColors {
    static let purple = Color(red: 0x89/255, green: 0x05/255, blue: 0xD5/255) // #8905D5
    static let deep = Color(red: 0x04/255, green: 0x03/255, blue: 0x28/255)   // #040328
}

struct AuraGradientBackground: View {
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [AuraColors.deep, AuraColors.purple.opacity(0.6)]),
            center: .center,
            startRadius: 30,
            endRadius: 700
        )
        .ignoresSafeArea()
    }
}

#Preview {
    AuraGradientBackground()
}
