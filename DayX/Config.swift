import Foundation

struct XConfig {
    static let clientId = "c1VHbkZ3d3ZrcEt3QUQwUl85ZjQ6MTpjaQ"
    static let clientSecret = "dx3N8pzeYNKl1DgitHs-tVaIocEUBrgc-WQ5-a3jsl1K9IFzGo"
    static let redirectURI = "DayX://callback"
    static let scope = "tweet.read users.read"
    
    // OAuth 2.0 URLs
    static let authURL = "https://x.com/i/oauth2/authorize"
    static let tokenURL = "https://api.x.com/2/oauth2/token"
    
    // API Base URL
    static let apiBaseURL = "https://api.x.com/2"
    
    // Legacy OAuth 1.0a credentials (if needed)
    static let apiKey = "XJhK5UCV5HTKdKkyeZvRRLWv2"
    static let apiKeySecret = "dLJtI3IF5WSBcmt0pkLGPx3kWRGtAvC3JRs1YUaOZ5jkLKrlNy"
    static let bearerToken = "AAAAAAAAAAAAAAAAAAAAAN%2Fr1wEAAAAAs9Ijt81Tl67FpD8w218Gve%2BXbdc%3DBOCcspkCH36i2PProWMIT8ha2ZF94siriF3toX607tOUre3Cxr"
}
