//
//  OnboardingPageTwo.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct OnboardingPageTwo: View {
    @State private var imageOffset: CGFloat = -50
    @State private var imageOpacity: Double = 0
    @State private var textOpacity: Double = 0
    @State private var buttonsOffset: CGFloat = 30
    @State private var buttonsOpacity: Double = 0

    var body: some View {
        VStack(spacing: 5) {
            VStack(spacing: 5) {
                Image("world")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .offset(y: imageOffset)
                    .opacity(imageOpacity)

                Group {
                    Text("Go Global")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)

                    HStack {
                        Text("with")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)

                        Text("Aura")
                            .font(.largeTitle.bold())
                            .foregroundStyle(AuraColors.purple)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.leading, -340)
                    }

                    Text("Send, receive and manage your money instantly")
                        .font(.body)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.leading, 8)

                    Text("No delays, no stress, no guesswork")
                        .font(.body)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.leading, -88)
                }
                .opacity(textOpacity)
            }
            .padding()
            .padding()

            VStack {
                Button(action: {
                    NotificationCenter.default.post(name: .advanceOnboarding, object: nil)
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: 370, maxHeight: 50)
                        .background(AuraColors.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                }
                .padding()

                Button(action: {
                    NotificationCenter.default.post(name: .advanceOnboarding, object: nil)
                }) {
                    Text("Skip")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: 370, maxHeight: 50)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.purple, lineWidth: 2)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                }
            }
            .offset(y: buttonsOffset)
            .opacity(buttonsOpacity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            // Animate image dropping in
            withAnimation(.spring(response: 0.7, dampingFraction: 0.7).delay(0.1)) {
                imageOffset = 0
                imageOpacity = 1
            }

            // Animate text fading in
            withAnimation(.easeOut(duration: 0.5).delay(0.3)) {
                textOpacity = 1
            }

            // Animate buttons sliding up
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.5)) {
                buttonsOffset = 0
                buttonsOpacity = 1
            }
        }
    }
}

#Preview {
    ZStack {
        AuraGradientBackground()
        OnboardingPageTwo()
    }
}
