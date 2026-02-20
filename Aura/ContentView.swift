//
//  ContentView.swift
//  Aura
//
//  Created by Rose Visuals on 17/02/2026.
//

import SwiftUI

struct AuraColors {
    static let purple = Color(red: 0x89/255, green: 0x05/255, blue: 0xD5/255) // #8905D5
    static let deep = Color(red: 0x04/255, green: 0x03/255, blue: 0x28/255)   // #040328
}

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

struct AuraGradientBackground: View {
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [AuraColors.deep, AuraColors.purple.opacity(0.6)]),
            center: .center,
            startRadius: 30,
            endRadius: 700
        )
        .ignoresSafeArea()
    }
}

extension Notification.Name {
    static let advanceOnboarding = Notification.Name("advanceOnboarding")
}

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

private struct SlideOnboardingView: View {
    let pages: [AnyView]
    @State private var index: Int = 0
    @State private var dragOffset: CGFloat = 0

    private let swipeThreshold: CGFloat = 80

    var body: some View {
        ZStack {
            pages[index]
                .id(index)
        }
        .onReceive(NotificationCenter.default.publisher(for: .advanceOnboarding)) { _ in
            goToNext()
        }
        .animation(.easeInOut(duration: 0.35), value: index)
//        .overlay(alignment: .bottom) {
//            HStack {
//                Button("Back") { goToPrevious() }
//                    .opacity(index > 0 ? 1 : 0)
//                    .disabled(index == 0)
//
//                Spacer()
//
//                Button(index < pages.count - 1 ? "Next" : "Done") {
//                    goToNext()
//                }
//                .disabled(index >= pages.count - 1)
//            }
//            .foregroundStyle(.white)
//            .padding()
//        }
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

private struct OnboardingPageOne: View {
    var body: some View {
        VStack() {
            HStack() {
                Image("aura")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                Text("Aura")
                    .font(.largeTitle.bold())
                    .padding(.leading,-23)
            }
            .foregroundStyle(.white)

        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                NotificationCenter.default.post(name: .advanceOnboarding, object: nil)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private struct OnboardingPageTwo: View {
    var body: some View {
        VStack(spacing: 5) {
            VStack(spacing: 5) {
                Image("world")
                    .resizable()
                    .scaledToFit()
                    .frame (width:400, height:400)

                Text("Go Global")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,20)
                
                HStack{
                    Text("with")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,20)
                        
                    Text("Aura")
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color(red: 0x89/255, green: 0x05/255, blue: 0xD5/255))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.leading,-340)
                }
                Text("Send, receive and manage your money instantly")
                    .font(.body)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading,8)
                Text("No delays, no stress, no guesswork")
                    .font(.body)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading,-88)
                
          
            }
            
            .padding()
            .padding()
            VStack() {
                Button(action: {
                    NotificationCenter.default.post(name: .advanceOnboarding, object: nil)
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: 370, maxHeight:50)
                        .background(Color(red: 0x89/255, green: 0x05/255, blue: 0xD5/255))
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

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
   
}

private struct OnboardingPageThree: View {
    var body: some View {
        VStack(spacing: 5) {
            VStack( spacing:5) {
                Image("bitcoin")
                    .resizable()
                    .scaledToFit()
                    .frame (width:400, height:400)
                    

                Text("Swap Crypto")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,20)
                
                HStack{
                    Text("to")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,20)
                        
                    Text("Ugx")
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color(red: 0x89/255, green: 0x05/255, blue: 0xD5/255))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.leading,-420)
                }
                Text("Send, receive and manage your money instantly")
                    .font(.body)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading,8)
                Text("No delays, no stress, no guesswork")
                    .font(.body)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading,-88)
                
            }
            .padding()
            .padding()
            VStack( spacing: 10) {
                Button(action: {
                    NotificationCenter.default.post(name: .advanceOnboarding, object: nil)
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: 370, maxHeight:50)
                        .background(Color(red: 0x89/255, green: 0x05/255, blue: 0xD5/255))
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private struct OnboardingPageFour: View {
    var body: some View {
        VStack(spacing: 5) {
            VStack( spacing:5) {
                Image("walletcard")
                    .resizable()
                    .scaledToFit()
                    .frame (width:320, height:320)
                

                Text("Create Your")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,-16)
                Text("USD & UGX")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,-16)
                
                HStack{
//                    Text("to")
//                        .font(.largeTitle.bold())
//                        .foregroundStyle(.white)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading,20)
                        
                    Text("Virtual Cards")
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color(red: 0x89/255, green: 0x05/255, blue: 0xD5/255))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.leading,-170)
                }
                Text("Send, receive and manage your money instantly")
                    .font(.body)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading,-16)
                Text("No delays, no stress, no guesswork")
                    .font(.body)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading,-90)
                
            }
            .padding()
            .padding()
            VStack( spacing: 10) {
                Button(action: {
                    NotificationCenter.default.post(name: .advanceOnboarding, object: nil)
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: 370, maxHeight:50)
                        .background(Color(red: 0x89/255, green: 0x05/255, blue: 0xD5/255))
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
private struct OnboardingPageFive: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var isSecure: Bool = true
    @State private var goToHome: Bool = false

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

                            // Login button -> navigates
                            // Present HomeView when goToHome toggles true (iOS 16+ API)
                            .navigationDestination(isPresented: $goToHome) {
                                HomeView()
                            }

                            Button {
                                // perform login
                                goToHome = true
                            } label: {
                                Text("Login")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, minHeight: 52)
                                    .background(AuraColors.purple, in: RoundedRectangle(cornerRadius: 40))
                            }
                            .padding(.top, 8)

                            // Divider
                            HStack {
                                Rectangle().fill(.white.opacity(0.15)).frame(height: 0.5)
                                Text("or create account with")
                                    .font(.footnote)
                                    .foregroundStyle(.white.opacity(0.7))
                                Rectangle().fill(.white.opacity(0.15)).frame(height: 1)
                            }

                            // Apple button (visual)
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
                        .padding(.horizontal, 24)
                        .padding(.vertical, 24)
                    }
                    Spacer(minLength: 24)
                }
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        ZStack {
            AuraGradientBackground()
            VStack(spacing: 16) {
                // Top bar
                HStack( spacing: -8) {
                    Image("aura")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 58, height: 58)
                    Text("Aura")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    VStack(spacing: 10) {
                        HStack( spacing: 8 ) {
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
                        
//                        .background(.white.opacity(0.1), in: Capsule())
                    }
                    Spacer()
                    Image(systemName: "bell")
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
               

                //                BalanceCard()
                QuickActionsRow()
                PromoBanner()
                RecentTransactionsSection()

                Spacer(minLength: 0)
                AuraTabBar()
            }
        }
    }
}

//struct BalanceCard: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("UGX")
//                .font(.footnote.weight(.semibold))
//                .foregroundStyle(.white.opacity(0.8))
//            Text("300,500.00")
//                .font(.system(size: 34, weight: .bold, design: .rounded))
//                .foregroundStyle(.white)
//            HStack(spacing: 16) {
//                BalanceAction(icon: "plus", title: "Add money")
//                BalanceAction(icon: "arrow.up.right", title: "Send money")
//                BalanceAction(icon: "doc.text", title: "Bills")
//                BalanceAction(icon: "qrcode.viewfinder", title: "Scan to Pay")
//            }
//            .padding(.top, 4)
//        }
//        .padding(20)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(
//            .white.opacity(0.08), in: RoundedRectangle(cornerRadius: 24, style: .continuous)
//        )
//        .overlay(
//            RoundedRectangle(cornerRadius: 24)
//                .stroke(.white.opacity(0.12), lineWidth: 1)
//        )
//        .padding(.horizontal, 20)
//    }
//}

struct BalanceAction: View {
    let icon: String
    let title: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button { } label: {
                ZStack {
                    Circle().fill(.white).frame(width: 52, height: 52)
                    Image(systemName: icon)
                        .foregroundStyle(AuraColors.purple)
                }
            }
            .buttonStyle(.plain)
            Text(title)
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.9))
        }
        .padding(.bottom,20)
    }
}

struct QuickActionsRow: View {
    var body: some View {
        HStack(spacing: 18) {
            BalanceAction(icon: "plus", title: "Add money")
            BalanceAction(icon: "arrow.up.right", title: "Send money")
            BalanceAction(icon: "doc.text", title: "Bills")
            BalanceAction(icon: "qrcode.viewfinder", title: "Scan to Pay")
        }
        .padding(.horizontal, 20)
//        .padding(.bottom,20)
    }
}

struct PromoBanner: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: -8) {
                    Image("aura")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 58, height: 58)

                    Text("Aura")
                        .font(.headline.bold())
                        .foregroundStyle(.white)
                }
                .padding(.leading, -20)
                .padding(.top,-15)
                Text("Be an Aura Agent with our POS")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.white)

//                HStack(spacing: 6) {
//                    Image(systemName: "waveform.path.ecg")
//                        .foregroundStyle(.white.opacity(0.8))
//                    Text("— — —")
//                        .foregroundStyle(.white.opacity(0.8))
//                }
            }
            
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.0))
                .frame(width: 140, height: 140)
                .overlay(
                    Image("promo")
                        .font(.system(size: 28))
                        .foregroundStyle(.white)
                )
        }
        .padding(16)
        .background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white.opacity(0.12), lineWidth: 1)
        )
        .padding(.horizontal, 20)
        
      Spacer()
    }
  
}

struct RecentTransactionsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recent Transactions")
                .font(.headline.weight(.semibold))
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
//                .padding(.top,10)

            VStack(spacing: 10) {
                TransactionRow(avatar: "person.crop.circle.fill", name: "Received from Rose", amount: "+$124.10", status: "Successful", positive: true)
                TransactionRow(avatar: "person.crop.circle.fill", name: "Received from Rose", amount: "+$124.10", status: "Successful", positive: true)
                TransactionRow(avatar: "person.crop.circle.fill", name: "Received from Rose", amount: "+$124.10", status: "Successful", positive: true)
            }
            .padding(.horizontal, 20)
//            .padding(.top, 10)
        }
    }
}

struct TransactionRow: View {
    let avatar: String
    let name: String
    let amount: String
    let status: String
    let positive: Bool

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
        .background(.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(.white.opacity(0.1), lineWidth: 1)
        )
    }
}

struct AuraTabBar: View {
    @State private var selected: Int = 0
    var body: some View {
        HStack {
            TabItem(icon: "house.fill", title: "Home", selected: selected == 0) { selected = 0 }
            TabItem(icon: "creditcard.fill", title: "Cards", selected: selected == 1) { selected = 1 }
            TabItem(icon: "bitcoinsign.circle.fill", title: "Crypto", selected: selected == 2) { selected = 2 }
            TabItem(icon: "clock.fill", title: "History", selected: selected == 3) { selected = 3 }
            TabItem(icon: "person.crop.circle.fill", title: "Profile", selected: selected == 4) { selected = 4 }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(.white.opacity(0.06), in: Capsule())
        .overlay(
            Capsule().stroke(.white.opacity(0.12), lineWidth: 1)
        )
        .padding(.horizontal, 24)
        .padding(.bottom, 96)
    }
}

struct TabItem: View {
    let icon: String
    let title: String
    let selected: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .foregroundStyle(selected ? .white : .white.opacity(0.5))
                Text(title)
                    .font(.caption2)
                    .foregroundStyle(selected ? .white : .white.opacity(0.5))
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}

private struct AuraBackground: View {
    var body: some View {
        let centerColor = Color(red: 0x04/255, green: 0x03/255, blue: 0x28/255) // #040328
        let outerColor = Color(red: 0x89/255, green: 0x05/255, blue: 0xD5/255)  // #8905D5

        return RadialGradient(
            gradient: Gradient(colors: [centerColor, outerColor]),
            center: .center,
            startRadius: 30,
            endRadius: 700
        )
    }
}

#Preview {
    ContentView()
}

