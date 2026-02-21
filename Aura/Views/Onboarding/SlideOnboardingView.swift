//
//  SlideOnboardingView.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct SlideOnboardingView: View {
    let pages: [AnyView]
    @State private var index: Int = 0

    var body: some View {
        ZStack {
            ForEach(0..<pages.count, id: \.self) { pageIndex in
                if pageIndex == index {
                    pages[pageIndex]
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing).combined(with: .opacity),
                            removal: .move(edge: .leading).combined(with: .opacity)
                        ))
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .advanceOnboarding)) { _ in
            goToNext()
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: index)
    }

    private func goToNext() {
        guard index < pages.count - 1 else { return }
        index += 1
    }

    private func goToPrevious() {
        guard index > 0 else { return }
        index -= 1
    }
}

#Preview {
    ZStack {
        AuraGradientBackground()
        SlideOnboardingView(pages: [
            AnyView(Text("Page 1").foregroundStyle(.white)),
            AnyView(Text("Page 2").foregroundStyle(.white)),
            AnyView(Text("Page 3").foregroundStyle(.white))
        ])
    }
}
