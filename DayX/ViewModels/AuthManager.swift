import SwiftUI

class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var accessToken: String?
    @Published var userInfo: XUser?
    
    func authenticateWithX(completion: @escaping (Bool) -> Void) {
        // TODO: Implement X OAuth flow
        // For now, simulate authentication
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isAuthenticated = true
            self.accessToken = "mock_token"
            completion(true)
        }
    }
    
    func logout() {
        isAuthenticated = false
        accessToken = nil
        userInfo = nil
    }
}
