//
//  BalanceAction.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct BalanceAction: View {
    let icon: String
    let title: String

    @State private var isPressed: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button {
                // Haptic feedback simulation with animation
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    isPressed = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        isPressed = false
                    }
                }
            } label: {
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 52, height: 52)
                        .shadow(color: AuraColors.purple.opacity(isPressed ? 0.4 : 0), radius: 8, x: 0, y: 4)
                    Image(systemName: icon)
                        .foregroundStyle(AuraColors.purple)
                        .font(.system(size: 20, weight: .medium))
                }
            }
            .scaleEffect(isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
            .buttonStyle(.plain)

            Text(title)
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.9))
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    ZStack {
        AuraGradientBackground()
        HStack {
            BalanceAction(icon: "plus", title: "Add money")
            BalanceAction(icon: "arrow.up.right", title: "Send money")
        }
    }
}
