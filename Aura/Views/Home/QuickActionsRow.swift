//
//  QuickActionsRow.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct QuickActionsRow: View {
    var body: some View {
        HStack(spacing: 18) {
            BalanceAction(icon: "plus", title: "Add money")
            BalanceAction(icon: "arrow.up.right", title: "Send money")
            BalanceAction(icon: "doc.text", title: "Bills")
            BalanceAction(icon: "qrcode.viewfinder", title: "Scan to Pay")
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ZStack {
        AuraGradientBackground()
        QuickActionsRow()
    }
}
