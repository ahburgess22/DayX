import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        Group {
            if authManager.isLoggedIn {
                DashboardView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            authManager.checkStoredAuth()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthManager())
}
