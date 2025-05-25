import Foundation

class XService: ObservableObject {
    static let shared = XService()
    
    private init() {}
    
    // MARK: - Main Public Method
    func fetchDailyInsights() async throws -> DailyInsights {
        print("🔄 Starting real API data fetch...")
        
        // Get access token from AuthManager
        guard let accessToken = UserDefaults.standard.string(forKey: "x_access_token") else {
            print("❌ No access token found")
            throw XServiceError.noAccessToken
        }
        
        // Fetch user data to test API connectivity
        let userResponse = try await fetchUserData(accessToken: accessToken)
        
        // Return insights with API connectivity confirmation
        let insights = DailyInsights(
            tweetsLiked: 0,
            activeHours: 0,
            uniqueAccounts: 0,
            peakHour: "API Connected ✅",
            savedTweets: 0,
            topAccount: TopAccount(
                username: "@\(userResponse.data.username)",
                profileImageUrl: userResponse.data.profile_image_url ?? "",
                engagementCount: 1
            )
        )
        
        print("✅ Successfully connected to API for user: @\(userResponse.data.username)")
        return insights
    }
    
    private func fetchUserData(accessToken: String) async throws -> XUserResponse {
        let endpoint = "https://api.twitter.com/2/users/me"
        
        // Build URL with query parameters
        var components = URLComponents(string: endpoint)!
        components.queryItems = [
            URLQueryItem(name: "user.fields", value: "username,name,profile_image_url")
        ]
        
        guard let url = components.url else {
            throw XServiceError.invalidURL
        }
        
        // Create request with authentication
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("🌐 Making API call to: \(url)")
        
        // Make the API call
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Check response status
        if let httpResponse = response as? HTTPURLResponse {
            print("📡 API Response Status: \(httpResponse.statusCode)")
            
            if httpResponse.statusCode != 200 {
                print("❌ API Error - Status: \(httpResponse.statusCode)")
                if let errorString = String(data: data, encoding: .utf8) {
                    print("Error Response: \(errorString)")
                }
                throw XServiceError.apiError(httpResponse.statusCode)
            }
        }
        
        // Parse the response
        do {
            let decoder = JSONDecoder()
            let userResponse = try decoder.decode(XUserResponse.self, from: data)
            return userResponse
        } catch {
            print("❌ JSON Parsing Error: \(error)")
            throw XServiceError.parsingError
        }
    }
    
    // MARK: - API Calls
    private func fetchLikedTweets(accessToken: String) async throws -> DailyInsights {
        let endpoint = "https://api.twitter.com/2/users/me"
        
        // Build URL with query parameters
        var components = URLComponents(string: endpoint)!
        components.queryItems = [
//            URLQueryItem(name: "tweet.fields", value: "created_at,author_id,public_metrics"),
//            URLQueryItem(name: "expansions", value: "author_id"),
            URLQueryItem(name: "user.fields", value: "username,name,profile_image_url")
//            URLQueryItem(name: "max_results", value: "100") // Get up to 100 recent likes
        ]
        
        guard let url = components.url else {
            throw XServiceError.invalidURL
        }
        
        // Create request with authentication
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("🌐 Making API call to: \(url)")
        
        // Make the API call
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Check response status
        if let httpResponse = response as? HTTPURLResponse {
            print("📡 API Response Status: \(httpResponse.statusCode)")
            
            if httpResponse.statusCode != 200 {
                print("❌ API Error - Status: \(httpResponse.statusCode)")
                if let errorString = String(data: data, encoding: .utf8) {
                    print("Error Response: \(errorString)")
                }
                throw XServiceError.apiError(httpResponse.statusCode)
            }
        }
        
        // Parse the response
        do {
            let decoder = JSONDecoder()
            let userResponse = try decoder.decode(XUserResponse.self, from: data)
            print("✅ Successfully got user data for: @\(userResponse.data.username)")

            // For now, return mock insights since we're just testing connectivity
            return DailyInsights(
                tweetsLiked: 0,
                activeHours: 0,
                uniqueAccounts: 0,
                peakHour: "API Connected ✅",
                savedTweets: 0,
                topAccount: TopAccount(
                    username: "@\(userResponse.data.username)",
                    profileImageUrl: userResponse.data.profile_image_url ?? "",
                    engagementCount: 1
                )
            )
        } catch {
            print("❌ JSON Parsing Error: \(error)")
            throw XServiceError.parsingError
        }
    }
    
    // MARK: - Data Processing
    private func filterTweetsFromToday(_ tweets: [XTweet]) -> [XTweet] {
        let calendar = Calendar.current
        let today = Date()
        
        return tweets.filter { tweet in
            guard let createdAtString = tweet.created_at,
                  let tweetDate = parseTwitterDate(createdAtString) else {
                return false
            }
            
            return calendar.isDate(tweetDate, inSameDayAs: today)
        }
    }
    
    private func parseTwitterDate(_ dateString: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: dateString)
    }
    
    private func processLikedTweetsToInsights(_ tweets: [XTweet]) -> DailyInsights {
        // If no tweets, return empty insights
        guard !tweets.isEmpty else {
            return DailyInsights(
                tweetsLiked: 0,
                activeHours: 0,
                uniqueAccounts: 0,
                peakHour: "No activity today",
                savedTweets: 0,
                topAccount: nil
            )
        }
        
        // Basic metrics
        let tweetsLiked = tweets.count
        let uniqueAccounts = Set(tweets.compactMap { $0.author_id }).count
        
        // Calculate active hours (simplified - hours where likes occurred)
        let activeHours = calculateActiveHours(from: tweets)
        
        // Find peak activity time
        let peakHour = findPeakActivityTime(from: tweets)
        
        // Find top account (most liked from)
        let topAccount = findTopAccount(from: tweets)
        
        return DailyInsights(
            tweetsLiked: tweetsLiked,
            activeHours: activeHours,
            uniqueAccounts: uniqueAccounts,
            peakHour: peakHour,
            savedTweets: 0, // Will implement later
            topAccount: topAccount
        )
    }
    
    private func calculateActiveHours(from tweets: [XTweet]) -> Int {
        let hours = Set(tweets.compactMap { tweet -> Int? in
            guard let createdAtString = tweet.created_at,
                  let date = parseTwitterDate(createdAtString) else { return nil }
            return Calendar.current.component(.hour, from: date)
        })
        return hours.count
    }
    
    private func findPeakActivityTime(from tweets: [XTweet]) -> String {
        let hourCounts = Dictionary(grouping: tweets) { tweet -> Int in
            guard let createdAtString = tweet.created_at,
                  let date = parseTwitterDate(createdAtString) else { return 0 }
            return Calendar.current.component(.hour, from: date)
        }.mapValues { $0.count }
        
        guard let peakHour = hourCounts.max(by: { $0.value < $1.value })?.key else {
            return "Unknown"
        }
        
        // Convert to readable time
        let formatter = DateFormatter()
        formatter.dateFormat = "h a"
        let date = Calendar.current.date(bySettingHour: peakHour, minute: 0, second: 0, of: Date()) ?? Date()
        return formatter.string(from: date)
    }
    
    private func findTopAccount(from tweets: [XTweet]) -> TopAccount? {
        let authorCounts = Dictionary(grouping: tweets) { $0.author_id ?? "unknown" }
            .mapValues { $0.count }
        
        guard let topAuthorId = authorCounts.max(by: { $0.value < $1.value })?.key,
              topAuthorId != "unknown" else {
            return nil
        }
        
        let engagementCount = authorCounts[topAuthorId] ?? 0
        
        // For now, return basic info - we'll enhance this with user data from the includes
        return TopAccount(
            username: "@user_\(topAuthorId)",
            profileImageUrl: "",
            engagementCount: engagementCount
        )
    }
}

// MARK: - Error Handling
enum XServiceError: Error, LocalizedError {
    case noAccessToken
    case invalidURL
    case apiError(Int)
    case parsingError
    
    var errorDescription: String? {
        switch self {
        case .noAccessToken:
            return "No access token available. Please log in again."
        case .invalidURL:
            return "Invalid API URL configuration."
        case .apiError(let statusCode):
            return "API request failed with status code: \(statusCode)"
        case .parsingError:
            return "Failed to parse API response."
        }
    }
}
