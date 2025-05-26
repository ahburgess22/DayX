import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var showingDemo = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.8),
                        Color.purple.opacity(0.8)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    // App branding
                    VStack(spacing: 16) {
                        Image(systemName: "chart.line.uptrend.xyaxis.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.white)
                        
                        Text("DayX")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Your Daily X Wrapped")
                            .font(.title2)
                            .foregroundColor(.white.opacity(0.9))
                            .multilineTextAlignment(.center)
                    }
                    
                    Spacer()
                    
                    // Action buttons section
                    VStack(spacing: 20) {
                        // Demo button (primary)
                        Button(action: {
                            showingDemo = true
                        }) {
                            HStack(spacing: 12) {
                                Image(systemName: "waveform.and.magnifyingglass")
                                    .font(.title2)
                                Text("View Demo Analytics")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.orange.opacity(0.8),
                                        Color.red.opacity(0.8)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(16)
                            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        }
                        
                        // Live auth button (secondary)
                        Button(action: {
                            Task {
                                await signInWithX()
                            }
                        }) {
                            HStack(spacing: 12) {
                                if isLoading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                        .scaleEffect(0.8)
                                } else {
                                    Image(systemName: "checkmark.shield.fill")
                                        .font(.title2)
                                }
                                
                                Text(isLoading ? "Connecting..." : "Connect with X")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(
                                Color.white.opacity(0.2)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                            )
                            .cornerRadius(16)
                        }
                        .disabled(isLoading)
                        
                        // Feature comparison
                        VStack(spacing: 8) {
                            HStack {
                                Text("Demo:")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white.opacity(0.9))
                                Text("Full analytics showcase")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                                Spacer()
                            }
                            
                            HStack {
                                Text("Live:")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white.opacity(0.9))
                                Text("Real OAuth + Profile data")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                    
                    // Footer
                    VStack(spacing: 8) {
                        Text("Built with SwiftUI + OAuth 2.0")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                        
                        Text("By Austin Burgess")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationBarHidden(true)
        }
        .fullScreenCover(isPresented: $showingDemo) {
            DemoDashboardView()
        }
        .alert("Authentication Error", isPresented: .constant(errorMessage != nil)) {
            Button("OK") {
                errorMessage = nil
            }
        } message: {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            }
        }
    }
    
    private func signInWithX() async {
        isLoading = true
        errorMessage = nil
        
        do {
            try await authManager.login()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthManager())
}
