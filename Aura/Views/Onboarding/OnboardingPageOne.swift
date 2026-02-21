//
//  OnboardingPageOne.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct OnboardingPageOne: View {
    @State private var logoScale: CGFloat = 0.5
    @State private var logoOpacity: Double = 0
    @State private var textOffset: CGFloat = 20
    @State private var textOpacity: Double = 0

    var body: some View {
        VStack {
            HStack {
                Image("aura")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)

                Text("Aura")
                    .font(.largeTitle.bold())
                    .padding(.leading, -23)
                    .offset(x: textOffset)
                    .opacity(textOpacity)
            }
            .foregroundStyle(.white)
        }
        .onAppear {
            // Animate logo
            withAnimation(.spring(response: 0.8, dampingFraction: 0.6).delay(0.2)) {
                logoScale = 1.0
                logoOpacity = 1.0
            }

            // Animate text
            withAnimation(.easeOut(duration: 0.6).delay(0.5)) {
                textOffset = 0
                textOpacity = 1.0
            }

            // Advance to next page
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                NotificationCenter.default.post(name: .advanceOnboarding, object: nil)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ZStack {
        AuraGradientBackground()
        OnboardingPageOne()
    }
}
