import Foundation
import SwiftUI
import AuthenticationServices
import CryptoKit

@MainActor
class AuthManager: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isLoading = false
    @Published var user: XAPIUser?
    @Published var accessToken: String?
    @Published var errorMessage: String?
    
    private var authSession: ASWebAuthenticationSession?
    private var codeVerifier: String?
    private var contextProvider: AuthContextProvider?
    
    func login() {
        print("🚀 LOGIN: Starting login process")
        isLoading = true
        errorMessage = nil
        
        // Generate PKCE code verifier and challenge
        codeVerifier = generateCodeVerifier()
        let codeChallenge = codeVerifier! // Use plain method for now
        print("🔐 LOGIN: Generated PKCE - verifier: \(codeVerifier!.prefix(10))..., challenge: \(codeChallenge.prefix(10))...")
        
        // Build authorization URL
        var components = URLComponents(string: XConfig.authURL)!
        components.queryItems = [
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "client_id", value: XConfig.clientId),
            URLQueryItem(name: "redirect_uri", value: XConfig.redirectURI),
            URLQueryItem(name: "scope", value: XConfig.scope),
            URLQueryItem(name: "state", value: generateState()),
            URLQueryItem(name: "code_challenge", value: codeChallenge),
            URLQueryItem(name: "code_challenge_method", value: "plain")
        ]
        
        guard let authURL = components.url else {
            print("❌ LOGIN: Failed to create authorization URL")
            DispatchQueue.main.async {
                self.isLoading = false
                self.errorMessage = "Failed to create authorization URL"
            }
            return
        }
        
        print("🔗 LOGIN: Auth URL created: \(authURL)")
        
        // Create and store the context provider
        contextProvider = AuthContextProvider()
        
        // Start OAuth session
        authSession = ASWebAuthenticationSession(
            url: authURL,
            callbackURLScheme: "dayx"
        ) { [weak self] callbackURL, error in
            print("📱 CALLBACK: ASWebAuthenticationSession completed")
            print("📱 CALLBACK: Callback URL: \(callbackURL?.absoluteString ?? "nil")")
            print("📱 CALLBACK: Error: \(error?.localizedDescription ?? "nil")")
            
            if let error = error {
                print("❌ CALLBACK: Error received: \(error)")
                print("❌ CALLBACK: Error code: \((error as NSError).code)")
                print("❌ CALLBACK: Error domain: \((error as NSError).domain)")
                print("❌ CALLBACK: Error description: \(error.localizedDescription)")
            }
            if let callbackURL = callbackURL {
                print("✅ CALLBACK: URL received: \(callbackURL)")
            }
            DispatchQueue.main.async {
                self?.handleAuthCallback(callbackURL: callbackURL, error: error)
            }
        }
        
        // Set the presentation context provider BEFORE starting
        authSession?.presentationContextProvider = contextProvider
        authSession?.prefersEphemeralWebBrowserSession = true
        
        print("🎬 LOGIN: Starting ASWebAuthenticationSession")
        let started = authSession?.start()
        print("🎬 LOGIN: ASWebAuthenticationSession start result: \(started ?? false)")
    }
    
    private func handleAuthCallback(callbackURL: URL?, error: Error?) {
        print("🔄 HANDLE_CALLBACK: Starting callback handling")
        isLoading = false
        
        if let error = error {
            print("❌ HANDLE_CALLBACK: Error present")
            if (error as? ASWebAuthenticationSessionError)?.code == .canceledLogin {
                print("🚫 HANDLE_CALLBACK: User cancelled login")
                errorMessage = "Login was cancelled"
            } else {
                print("💥 HANDLE_CALLBACK: Other error: \(error.localizedDescription)")
                errorMessage = "Authentication failed: \(error.localizedDescription)"
            }
            return
        }
        
        guard let callbackURL = callbackURL else {
            print("❌ HANDLE_CALLBACK: No callback URL received")
            errorMessage = "No callback URL received"
            return
        }
        
        print("🔗 HANDLE_CALLBACK: Processing URL: \(callbackURL)")
        
        guard let components = URLComponents(url: callbackURL, resolvingAgainstBaseURL: false) else {
            print("❌ HANDLE_CALLBACK: Failed to parse URL components")
            errorMessage = "Failed to parse callback URL"
            return
        }
        
        print("🔍 HANDLE_CALLBACK: URL components: \(components)")
        print("🔍 HANDLE_CALLBACK: Query items: \(components.queryItems ?? [])")
        
        guard let code = components.queryItems?.first(where: { $0.name == "code" })?.value else {
            print("❌ HANDLE_CALLBACK: No authorization code found")
            errorMessage = "Failed to extract authorization code"
            return
        }
        
        print("✅ HANDLE_CALLBACK: Authorization code extracted: \(code.prefix(10))...")
        
        // Exchange code for access token
        exchangeCodeForToken(code: code)
    }
    
    private func exchangeCodeForToken(code: String) {
        print("🔄 TOKEN_EXCHANGE: Starting token exchange")
        guard let codeVerifier = codeVerifier else {
            print("❌ TOKEN_EXCHANGE: Missing code verifier")
            errorMessage = "Missing code verifier"
            return
        }
        
        guard let url = URL(string: XConfig.tokenURL) else {
            print("❌ TOKEN_EXCHANGE: Invalid token URL")
            errorMessage = "Invalid token URL"
            return
        }
        
        print("🔗 TOKEN_EXCHANGE: Token URL: \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let bodyParams = [
            "code": code,
            "grant_type": "authorization_code",
            "client_id": XConfig.clientId,
            "redirect_uri": XConfig.redirectURI,
            "code_verifier": codeVerifier
        ]
        
        let bodyString = bodyParams.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
        request.httpBody = bodyString.data(using: .utf8)
        
        print("📦 TOKEN_EXCHANGE: Request body: \(bodyString)")
        
        // Add Basic Auth header
        let credentials = "\(XConfig.clientId):\(XConfig.clientSecret)"
        let credentialsData = credentials.data(using: .utf8)!
        let base64Credentials = credentialsData.base64EncodedString()
        request.setValue("Basic \(base64Credentials)", forHTTPHeaderField: "Authorization")
        
        print("🔐 TOKEN_EXCHANGE: Auth header set")
        print("🚀 TOKEN_EXCHANGE: Making token request")
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            print("📡 TOKEN_RESPONSE: Received response")
            if let httpResponse = response as? HTTPURLResponse {
                print("📊 TOKEN_RESPONSE: Status code: \(httpResponse.statusCode)")
            }
            DispatchQueue.main.async {
                self?.handleTokenResponse(data: data, response: response, error: error)
            }
        }.resume()
    }
    
    private func handleTokenResponse(data: Data?, response: URLResponse?, error: Error?) {
        print("🔄 TOKEN_RESPONSE: Handling token response")
        
        if let error = error {
            print("❌ TOKEN_RESPONSE: Network error: \(error.localizedDescription)")
            errorMessage = "Token exchange failed: \(error.localizedDescription)"
            return
        }
        
        guard let data = data else {
            print("❌ TOKEN_RESPONSE: No data received")
            errorMessage = "No data received from token exchange"
            return
        }
        
        print("📄 TOKEN_RESPONSE: Data received: \(data.count) bytes")
        if let responseString = String(data: data, encoding: .utf8) {
            print("📄 TOKEN_RESPONSE: Raw response: \(responseString)")
        }
        
        do {
            let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
            print("✅ TOKEN_RESPONSE: Successfully decoded token")
            accessToken = tokenResponse.access_token
            
            // Store token securely (in a real app, use Keychain)
            UserDefaults.standard.set(tokenResponse.access_token, forKey: "x_access_token")
            print("💾 TOKEN_RESPONSE: Token stored")
            
            // Fetch user info
            fetchUserInfo()
            
        } catch {
            print("❌ TOKEN_RESPONSE: Failed to decode: \(error)")
            errorMessage = "Failed to parse token response: \(error.localizedDescription)"
        }
    }
    
    private func fetchUserInfo() {
        guard let accessToken = accessToken else {
            errorMessage = "No access token available"
            return
        }
        
        guard let url = URL(string: "\(XConfig.apiBaseURL)/users/me") else {
            errorMessage = "Invalid user info URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.handleUserInfoResponse(data: data, response: response, error: error)
            }
        }.resume()
    }
    
    private func handleUserInfoResponse(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            errorMessage = "Failed to fetch user info: \(error.localizedDescription)"
            return
        }
        
        guard let data = data else {
            errorMessage = "No user data received"
            return
        }
        
        do {
            let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
            self.user = XAPIUser(
                id: userResponse.data.id,
                username: userResponse.data.username,
                name: userResponse.data.name,
                profile_image_url: userResponse.data.profile_image_url
            )
            
            isLoggedIn = true
            errorMessage = nil
            
        } catch {
            errorMessage = "Failed to parse user info: \(error.localizedDescription)"
        }
    }
    
    func logout() {
        isLoggedIn = false
        user = nil
        accessToken = nil
        UserDefaults.standard.removeObject(forKey: "x_access_token")
    }
    
    func checkStoredAuth() {
        if let storedToken = UserDefaults.standard.string(forKey: "x_access_token") {
            accessToken = storedToken
            fetchUserInfo()
        }
    }
    
    // MARK: - PKCE Helper Methods
    
    private func generateCodeVerifier() -> String {
        // Generate a simple, long random string with allowed characters
        let allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~"
        let length = 64 // Use a longer verifier
        return String((0..<length).map { _ in allowedChars.randomElement()! })
    }
    
    private func generateCodeChallenge(from verifier: String) -> String {
        let data = Data(verifier.utf8)
        let hash = SHA256.hash(data: data)
        return Data(hash).base64URLEncodedString()
    }
    
    private func generateState() -> String {
        let allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        let length = 16
        return String((0..<length).map { _ in allowedChars.randomElement()! })
    }
}

// MARK: - Supporting Types

struct TokenResponse: Codable {
    let access_token: String
    let token_type: String
    let expires_in: Int?
    let refresh_token: String?
    let scope: String?
}

struct UserResponse: Codable {
    let data: UserData
    
    struct UserData: Codable {
        let id: String
        let name: String
        let username: String
        let profile_image_url: String?
    }
}

class AuthContextProvider: NSObject, ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        print("🪟 CONTEXT: Getting presentation anchor")
        
        // Try to get the key window first
        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            print("✅ CONTEXT: Found key window: \(keyWindow)")
            return keyWindow
        }
        
        // Fallback to first window in window scene
        guard let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first else {
            print("❌ CONTEXT: No window scene found")
            return ASPresentationAnchor()
        }
        
        guard let window = windowScene.windows.first else {
            print("❌ CONTEXT: No window found in scene")
            return ASPresentationAnchor()
        }
        
        print("✅ CONTEXT: Found window in scene: \(window)")
        return window
    }
}

// MARK: - Data Extension for Base64URL

extension Data {
    func base64URLEncodedString() -> String {
        return base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}
