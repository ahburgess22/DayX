//
//  LoginView.swift
//  DayX
//
//  Created by Austin Burgess on 5/24/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var showingDemo = false
    @State private var showingDayXWrapped = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Gradient background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.8),
                        Color.purple.opacity(0.6),
                        Color.pink.opacity(0.4)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    // App branding
                    VStack(spacing: 16) {
                        Image(systemName: "waveform.and.magnifyingglass")
                            .font(.system(size: 80))
                            .foregroundColor(.white)
                        
                        Text("DayX")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Daily X Wrapped")
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    // Value proposition
                    VStack(spacing: 12) {
                        Text("Your Daily Twitter Psychology")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text("AI-powered insights into your daily Twitter engagement patterns, viral predictions, and mood analysis")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    // Action buttons
                    VStack(spacing: 16) {
                        // Primary: Demo Analytics
                        Button(action: {
                            showingDemo = true
                        }) {
                            HStack {
                                Image(systemName: "chart.bar.fill")
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
                                    gradient: Gradient(colors: [Color.orange, Color.red]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(16)
                        }
                        
                        // NEW: DayX Wrapped Button
                        Button(action: {
                            showingDayXWrapped = true
                        }) {
                            HStack {
                                Image(systemName: "brain.head.profile")
                                    .font(.title2)
                                Text("DayX Wrapped")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.purple, Color.pink]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(16)
                        }
                        
                        // Secondary: Live OAuth
                        Button(action: {
                            loginWithX()
                        }) {
                            HStack {
                                Image(systemName: "shield.checkered")
                                    .font(.title2)
                                Text("Connect with X")
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
                    }
                    .padding(.horizontal, 32)
                    
                    // Feature comparison
                    VStack(spacing: 8) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Demo Mode")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.orange)
                                Text("Full analytics showcase")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 4) {
                                Text("Live Mode")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                                Text("Real OAuth integration")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                        }
                        .padding(.horizontal, 32)
                    }
                    
                    Spacer()
                    
                    // Loading state
                    if isLoading {
                        VStack(spacing: 12) {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(1.2)
                            Text("Connecting to X...")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    
                    // Error message
                    if let errorMessage = errorMessage {
                        VStack(spacing: 8) {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.title2)
                                .foregroundColor(.yellow)
                            Text(errorMessage)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        .background(Color.red.opacity(0.2))
                        .cornerRadius(12)
                        .padding(.horizontal, 32)
                    }
                    
                    // Portfolio attribution
                    VStack(spacing: 4) {
                        Text("Portfolio Demo by Austin Burgess")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                        Text("Built with SwiftUI, OAuth 2.0, and Natural Language AI")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .sheet(isPresented: $showingDemo) {
            DemoDashboardView()
        }
        .sheet(isPresented: $showingDayXWrapped) {
            DayXWrappedView()
        }
    }
    
    private func loginWithX() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                authManager.login()
                // Success handled by AuthManager state change
            } catch {
                await MainActor.run {
                    errorMessage = error.localizedDescription
                    isLoading = false
                }
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthManager())
}
