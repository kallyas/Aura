//
//  CheckboxToggleStyle.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    var tint: Color = .accentColor

    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack(spacing: 10) {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(configuration.isOn ? .clear : .white.opacity(0.4), lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(configuration.isOn ? tint : .clear)
                        )
                        .frame(width: 22, height: 22)
                    if configuration.isOn {
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(.white)
                    }
                }
                configuration.label
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 20) {
        Toggle("Remember me", isOn: .constant(true))
            .toggleStyle(CheckboxToggleStyle(tint: AuraColors.purple))
        Toggle("Remember me", isOn: .constant(false))
            .toggleStyle(CheckboxToggleStyle(tint: AuraColors.purple))
    }
    .padding()
    .background(AuraColors.deep)
}
