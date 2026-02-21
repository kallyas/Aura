//
//  HomeView.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct HomeView: View {
    // Entrance animations
    @State private var headerOpacity: Double = 0
    @State private var headerOffset: CGFloat = -20
    @State private var actionsOpacity: Double = 0
    @State private var actionsScale: CGFloat = 0.8
    @State private var bannerOpacity: Double = 0
    @State private var bannerOffset: CGFloat = 30
    @State private var transactionsOpacity: Double = 0
    @State private var transactionsOffset: CGFloat = 40
    @State private var tabBarOpacity: Double = 0
    @State private var tabBarOffset: CGFloat = 50

    var body: some View {
        ZStack {
            AuraGradientBackground()
            VStack(spacing: 16) {
                // Top bar
                HStack(spacing: -8) {
                    Image("aura")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 58, height: 58)
                    Text("Aura")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    VStack(spacing: 10) {
                        HStack(spacing: 8) {
                            Circle()
                                .fill(.white.opacity(0.2))
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Image("uganda")
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                )
                            Text("UGX · Ugandan shillings")
                                .font(.caption2.weight(.semibold))
                                .foregroundStyle(.white.opacity(0.9))
                        }
                        .padding(.leading, -100)
                        .padding(.top, 100)
                    }
                    Spacer()
                    Image(systemName: "bell")
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .opacity(headerOpacity)
                .offset(y: headerOffset)

                QuickActionsRow()
                    .opacity(actionsOpacity)
                    .scaleEffect(actionsScale)

                PromoBanner()
                    .opacity(bannerOpacity)
                    .offset(x: bannerOffset)

                RecentTransactionsSection()
                    .opacity(transactionsOpacity)
                    .offset(y: transactionsOffset)

                Spacer(minLength: 0)

                AuraTabBar()
                    .opacity(tabBarOpacity)
                    .offset(y: tabBarOffset)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            // Staggered entrance animations
            withAnimation(.easeOut(duration: 0.5).delay(0.1)) {
                headerOpacity = 1
                headerOffset = 0
            }

            withAnimation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.2)) {
                actionsOpacity = 1
                actionsScale = 1
            }

            withAnimation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.35)) {
                bannerOpacity = 1
                bannerOffset = 0
            }

            withAnimation(.easeOut(duration: 0.5).delay(0.5)) {
                transactionsOpacity = 1
                transactionsOffset = 0
            }

            withAnimation(.spring(response: 0.5, dampingFraction: 0.8).delay(0.65)) {
                tabBarOpacity = 1
                tabBarOffset = 0
            }
        }
    }
}

#Preview {
    HomeView()
}
