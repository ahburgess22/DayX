import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            // App Icon and Title
            VStack(spacing: 20) {
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                
                Text("DayX")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Daily Insights for X")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Description
            VStack(spacing: 16) {
                Text("Get personalized daily insights about your X engagement patterns")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("• Daily activity summaries\n• Engagement analytics\n• Content insights")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            // Error Message
            if let errorMessage = authManager.errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            // Login Button
            Button(action: {
                authManager.login()
            }) {
                HStack {
                    if authManager.isLoading {
                        ProgressView()
                            .scaleEffect(0.8)
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "person.crop.circle.badge.checkmark")
                            .font(.title3)
                    }
                    
                    Text(authManager.isLoading ? "Connecting..." : "Connect with X")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.black)
                .cornerRadius(12)
                .padding(.horizontal, 40)
            }
            .disabled(authManager.isLoading)
            
            Text("Your data stays private and secure")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom, 40)
        }
        .padding()
        .background(Color(.systemBackground))
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthManager())
}
