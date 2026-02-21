//
//  PromoBanner.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct PromoBanner: View {
    @State private var shimmerOffset: CGFloat = -200
    @State private var isPressed: Bool = false

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: -8) {
                    Image("aura")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 58, height: 58)

                    Text("Aura")
                        .font(.headline.bold())
                        .foregroundStyle(.white)
                }
                .padding(.leading, -20)
                .padding(.top, -15)

                Text("Be an Aura Agent with our POS")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.white)
            }

            Spacer()

            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.0))
                .frame(width: 140, height: 140)
                .overlay(
                    Image("promo")
                        .font(.system(size: 28))
                        .foregroundStyle(.white)
                )
        }
        .padding(16)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.08))

                // Shimmer effect
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [.clear, .white.opacity(0.1), .clear],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .offset(x: shimmerOffset)
                    .mask(RoundedRectangle(cornerRadius: 20))
            }
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white.opacity(isPressed ? 0.25 : 0.12), lineWidth: 1)
        )
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
        .padding(.horizontal, 20)
        .onAppear {
            // Continuous shimmer animation
            withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: false).delay(1)) {
                shimmerOffset = 400
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.2, dampingFraction: 0.6)) {
                isPressed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    isPressed = false
                }
            }
        }

        Spacer()
    }
}

#Preview {
    ZStack {
        AuraGradientBackground()
        PromoBanner()
    }
}
