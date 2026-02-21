//
//  ContentView.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            AuraGradientBackground()
                .ignoresSafeArea()

            SlideOnboardingView(pages: [
                AnyView(OnboardingPageOne()),
                AnyView(OnboardingPageTwo()),
                AnyView(OnboardingPageThree()),
                AnyView(OnboardingPageFour()),
                AnyView(OnboardingPageFive())
            ])
        }
    }
}

#Preview {
    ContentView()
}
