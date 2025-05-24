import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 30) {
            // App Logo/Title
            VStack(spacing: 16) {
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                
                Text("Day X")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Your daily X insights")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Login Description
            VStack(spacing: 16) {
                Text("Connect your X account to get daily insights about your engagement patterns")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            // Login Button
            Button(action: {
                loginWithX()
            }) {
                HStack {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(0.8)
                    } else {
                        Image(systemName: "bird.fill")
                    }
                    
                    Text(isLoading ? "Connecting..." : "Connect with X")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(12)
            }
            .disabled(isLoading)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
    
    private func loginWithX() {
        isLoading = true
        authManager.authenticateWithX { success in
            DispatchQueue.main.async {
                isLoading = false
                if !success {
                    // Handle error - could show alert
                    print("Authentication failed")
                }
            }
        }
    }
}
