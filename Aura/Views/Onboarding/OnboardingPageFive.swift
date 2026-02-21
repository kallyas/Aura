//
//  OnboardingPageFive.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct OnboardingPageFive: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var isSecure: Bool = true
    @State private var goToHome: Bool = false
    @State private var isLoggingIn: Bool = false

    // Animation states
    @State private var headerOpacity: Double = 0
    @State private var headerOffset: CGFloat = -20
    @State private var formOpacity: Double = 0
    @State private var formOffset: CGFloat = 30
    @State private var buttonsOpacity: Double = 0
    @State private var buttonsOffset: CGFloat = 20

    var body: some View {
        NavigationStack {
            ZStack {
                AuraGradientBackground()
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    Spacer(minLength: 24)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            // Header
                            Group {
                                HStack(spacing: -8) {
                                    Image("aura")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                    Text("Aura")
                                        .font(.largeTitle.bold())
                                        .foregroundStyle(.white)
                                }
                                .padding(.top, 8)

                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Login to continue")
                                        .font(.largeTitle.bold())
                                        .foregroundStyle(.white)
                                    Text("Login to manage payments, savings and more seamlessly")
                                        .font(.subheadline)
                                        .foregroundStyle(.white.opacity(0.7))
                                }
                            }
                            .opacity(headerOpacity)
                            .offset(y: headerOffset)

                            // Form fields
                            Group {
                                // Email
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Email")
                                        .font(.footnote.weight(.semibold))
                                        .foregroundStyle(.white.opacity(0.8))

                                    HStack(spacing: 12) {
                                        Image(systemName: "envelope")
                                            .foregroundStyle(.white.opacity(0.7))
                                        TextField("rose@gmail.com", text: $email)
                                            .textContentType(.emailAddress)
                                            .keyboardType(.emailAddress)
                                            .autocapitalization(.none)
                                            .disableAutocorrection(true)
                                            .foregroundStyle(.white)
                                    }
                                    .padding()
                                    .background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 14))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(.white.opacity(0.12), lineWidth: 1)
                                    )
                                }

                                // Password
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Password")
                                        .font(.footnote.weight(.semibold))
                                        .foregroundStyle(.white.opacity(0.8))

                                    HStack(spacing: 12) {
                                        Image(systemName: "lock")
                                            .foregroundStyle(.white.opacity(0.7))
                                        Group {
                                            if isSecure {
                                                SecureField("••••••••", text: $password)
                                            } else {
                                                TextField("••••••••", text: $password)
                                            }
                                        }
                                        .foregroundStyle(.white)

                                        Button {
                                            isSecure.toggle()
                                        } label: {
                                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                                .foregroundStyle(.white.opacity(0.7))
                                        }
                                    }
                                    .padding()
                                    .background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 14))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(.white.opacity(0.12), lineWidth: 1)
                                    )
                                }

                                // Remember + Forgot
                                HStack {
                                    Toggle(isOn: $rememberMe) {
                                        Text("Remember me")
                                            .foregroundStyle(.white.opacity(0.9))
                                    }
                                    .toggleStyle(CheckboxToggleStyle(tint: AuraColors.purple))
                                    Spacer()
                                    Button("Forgot password?") {
                                        // action
                                    }
                                    .foregroundStyle(AuraColors.purple)
                                    .font(.footnote.weight(.semibold))
                                }
                            }
                            .opacity(formOpacity)
                            .offset(y: formOffset)

                            // Buttons
                            Group {
                                // Login button -> navigates
                                Button {
                                    isLoggingIn = true
                                    // Simulate login delay
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                                        isLoggingIn = false
                                        goToHome = true
                                    }
                                } label: {
                                    HStack(spacing: 12) {
                                        if isLoggingIn {
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                                .scaleEffect(0.9)
                                            Text("Logging in...")
                                                .font(.headline)
                                                .foregroundStyle(.white)
                                        } else {
                                            Text("Login")
                                                .font(.headline)
                                                .foregroundStyle(.white)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 52)
                                    .background(AuraColors.purple, in: RoundedRectangle(cornerRadius: 40))
                                }
                                .disabled(isLoggingIn)
                                .padding(.top, 8)

                                // Divider
                                HStack {
                                    Rectangle().fill(.white.opacity(0.15)).frame(height: 0.5)
                                    Text("or create account with")
                                        .font(.footnote)
                                        .foregroundStyle(.white.opacity(0.7))
                                    Rectangle().fill(.white.opacity(0.15)).frame(height: 1)
                                }

                                // Apple button
                                Button {
                                    // Sign in with Apple
                                } label: {
                                    HStack {
                                        Image(systemName: "apple.logo")
                                            .font(.headline)
                                        Text("Continue with Apple")
                                            .font(.headline)
                                    }
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity, minHeight: 52)
                                    .background(.white, in: RoundedRectangle(cornerRadius: 40))
                                }
                            }
                            .opacity(buttonsOpacity)
                            .offset(y: buttonsOffset)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 24)
                    }
                    Spacer(minLength: 24)
                }
            }
            .navigationDestination(isPresented: $goToHome) {
                HomeView()
            }
        }
        .onAppear {
            // Animate header
            withAnimation(.easeOut(duration: 0.5).delay(0.1)) {
                headerOpacity = 1
                headerOffset = 0
            }

            // Animate form
            withAnimation(.easeOut(duration: 0.5).delay(0.25)) {
                formOpacity = 1
                formOffset = 0
            }

            // Animate buttons
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.4)) {
                buttonsOpacity = 1
                buttonsOffset = 0
            }
        }
    }
}

#Preview {
    OnboardingPageFive()
}
