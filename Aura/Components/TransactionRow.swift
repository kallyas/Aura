//
//  TransactionRow.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct TransactionRow: View {
    let avatar: String
    let name: String
    let amount: String
    let status: String
    let positive: Bool

    @State private var isPressed: Bool = false

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: avatar)
                .font(.system(size: 32))
                .foregroundStyle(.white)
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .foregroundStyle(.white)
                Text("12 Jan 2026, 11:20 AM")
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.6))
                HStack(spacing: 6) {
                    Circle().fill(.white.opacity(0.3)).frame(width: 3, height: 3)
                    Text(status)
                        .font(.caption2.weight(.semibold))
                        .foregroundStyle(positive ? .green : .red)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.white, in: Capsule())
                }
                .padding(.leading, -8)
            }
            Spacer()

            Text(amount)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(positive ? .green : .red)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.white.opacity(isPressed ? 0.12 : 0.06))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(.white.opacity(isPressed ? 0.2 : 0.1), lineWidth: 1)
        )
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
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
    }
}

#Preview {
    ZStack {
        AuraGradientBackground()
        VStack {
            TransactionRow(
                avatar: "person.crop.circle.fill",
                name: "Received from Rose",
                amount: "+$124.10",
                status: "Successful",
                positive: true
            )
            TransactionRow(
                avatar: "person.crop.circle.fill",
                name: "Sent to John",
                amount: "-$50.00",
                status: "Failed",
                positive: false
            )
        }
        .padding()
    }
}
