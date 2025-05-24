import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        NavigationView {
            if authManager.isAuthenticated {
                DashboardView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthManager())
    }
}
