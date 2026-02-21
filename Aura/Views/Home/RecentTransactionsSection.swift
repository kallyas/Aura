//
//  RecentTransactionsSection.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct RecentTransactionsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recent Transactions")
                .font(.headline.weight(.semibold))
                .foregroundStyle(.white)
                .padding(.horizontal, 20)

            VStack(spacing: 10) {
                TransactionRow(
                    avatar: "person.crop.circle.fill",
                    name: "Received from Rose",
                    amount: "+$124.10",
                    status: "Successful",
                    positive: true
                )
                TransactionRow(
                    avatar: "person.crop.circle.fill",
                    name: "Received from Rose",
                    amount: "+$124.10",
                    status: "Successful",
                    positive: true
                )
                TransactionRow(
                    avatar: "person.crop.circle.fill",
                    name: "Received from Rose",
                    amount: "+$124.10",
                    status: "Successful",
                    positive: true
                )
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ZStack {
        AuraGradientBackground()
        RecentTransactionsSection()
    }
}
