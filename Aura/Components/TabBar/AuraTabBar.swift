//
//  AuraTabBar.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct AuraTabBar: View {
    @State private var selected: Int = 0

    var body: some View {
        HStack {
            TabItem(icon: "house.fill", title: "Home", selected: selected == 0) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selected = 0
                }
            }
            TabItem(icon: "creditcard.fill", title: "Cards", selected: selected == 1) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selected = 1
                }
            }
            TabItem(icon: "bitcoinsign.circle.fill", title: "Crypto", selected: selected == 2) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selected = 2
                }
            }
            TabItem(icon: "clock.fill", title: "History", selected: selected == 3) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selected = 3
                }
            }
            TabItem(icon: "person.crop.circle.fill", title: "Profile", selected: selected == 4) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selected = 4
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(.white.opacity(0.06), in: Capsule())
        .overlay(
            Capsule().stroke(.white.opacity(0.12), lineWidth: 1)
        )
        .padding(.horizontal, 24)
        .padding(.bottom, 96)
    }
}

private struct TabItem: View {
    let icon: String
    let title: String
    let selected: Bool
    let action: () -> Void

    @State private var isPressed: Bool = false

    var body: some View {
        Button {
            isPressed = true
            action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: selected ? 22 : 20))
                    .foregroundStyle(selected ? .white : .white.opacity(0.5))
                Text(title)
                    .font(.caption2)
                    .foregroundStyle(selected ? .white : .white.opacity(0.5))
            }
            .frame(maxWidth: .infinity)
            .scaleEffect(isPressed ? 0.85 : (selected ? 1.05 : 1.0))
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selected)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ZStack {
        AuraGradientBackground()
        VStack {
            Spacer()
            AuraTabBar()
        }
    }
}
