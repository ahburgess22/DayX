import Foundation

struct XUser: Codable, Identifiable {
    let id: String
    let username: String
    let displayName: String
    let profileImageURL: String?
    
    // Computed property for display
    var displayUsername: String {
        return "@\(username)"
    }
}
