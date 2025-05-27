import Foundation
import NaturalLanguage

class XService: ObservableObject {
    
    // 🚨 TEMPORARY: Set to true to avoid rate limits while testing
    private let skipLiveAPI = false
    
    func fetchDailyInsights(demoMode: Bool = false) async throws -> DailyInsights {
        if demoMode || skipLiveAPI {
            return await generateDemoInsights()
        } else {
            return try await fetchLiveInsights()
        }
    }
    
    // MARK: - Live API Integration
    
    private func fetchLiveInsights() async throws -> DailyInsights {
        // Fetch real user profile to confirm connectivity
        let userProfile = try await fetchUserProfile()
        
        // Store user in AuthManager for UI display
        await MainActor.run {
            // You might need to store this user data in AuthManager if not already done
        }
        
        // Create live insights with basic data (API constraints mean limited insights)
        return DailyInsights(
            tweetsLiked: 0, // Can't access without paid tier
            activeHours: 0, // Can't calculate without tweet data
            uniqueAccounts: 1, // At least the user themselves
            peakActivityTime: "Connected ✅", // Success indicator
            topEngagedAccount: TopAccount(username: userProfile.username, interactionCount: 0)
        )
    }
    
    private func fetchUserProfile() async throws -> XUser {
        guard let accessToken = UserDefaults.standard.string(forKey: "x_access_token") else {
            throw XAPIError.noAccessToken
        }
        
        let url = URL(string: "https://api.twitter.com/2/users/me")!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        print("🔄 Making API call to: \(url)")
        print("🔑 Using access token: \(accessToken.prefix(20))...")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw XAPIError.invalidResponse
        }
        
        print("📡 API Response Status: \(httpResponse.statusCode)")
        
        switch httpResponse.statusCode {
        case 200:
            let apiResponse = try JSONDecoder().decode(XAPIUserResponse.self, from: data)
            print("✅ API Response decoded successfully")
            print("📊 User data: \(apiResponse.data)")
            
            let user = XUser(
                id: apiResponse.data.id,
                username: apiResponse.data.username,
                displayName: apiResponse.data.name,
                profileImageURL: apiResponse.data.profileImageUrl
            )
            print("✅ Successfully created user: @\(user.username) (\(user.displayName))")
            return user
            
        case 400:
            throw XAPIError.badRequest
        case 401:
            throw XAPIError.unauthorized
        case 403:
            throw XAPIError.forbidden
        case 429:
            throw XAPIError.rateLimitExceeded
        default:
            throw XAPIError.unknownError(httpResponse.statusCode)
        }
    }
    
    // MARK: - DayX Wrapped Analytics (NEW!)
    
    func generateDayXWrappedInsights() async -> DayXWrappedInsights {
        // Simulate processing time for dramatic effect
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        
        let tweets = HardcodedTwitterData.tweets
        let activity = HardcodedTwitterData.dailyActivity
        
        // Run sentiment analysis
        let sentimentAnalyzer = TwitterSentimentAnalyzer()
        let sentimentAnalysis = sentimentAnalyzer.analyzeTweets(tweets)
        
        // Run viral prediction analysis
        let viralEngine = ViralPredictionEngine()
        let viralAnalysis = viralEngine.analyzeViralPredictions(from: tweets)
        
        // Generate content breakdown based on real data
        let contentBreakdown = generateContentBreakdownFromRealData(tweets: tweets)
        
        // Generate engagement patterns
        let engagementPatterns = generateEngagementPatternsFromRealData(tweets: tweets, activity: activity)
        
        return DayXWrappedInsights(
            totalTweetsLiked: activity.totalEngagements,
            sentimentAnalysis: sentimentAnalysis,
            viralAnalysis: viralAnalysis,
            contentBreakdown: contentBreakdown,
            engagementPatterns: engagementPatterns,
            topAccounts: generateTopAccountsFromRealData(tweets: tweets),
            peakActivityHour: activity.peakActivityHour,
            dailyScore: calculateDailyScore(sentiment: sentimentAnalysis, viral: viralAnalysis)
        )
    }
    
    private func generateContentBreakdownFromRealData(tweets: [HardcodedTweet]) -> [ContentCategory] {
        var sportsCount = 0
        var comedyCount = 0
        var newsCount = 0
        var animeCount = 0
        var generalCount = 0
        
        for tweet in tweets {
            let text = tweet.text.lowercased()
            let author = tweet.authorUsername.lowercased()
            
            if author.contains("nba") || author.contains("mlb") || author.contains("sports") ||
               author.contains("basketball") || author.contains("baseball") ||
               text.contains("game") || text.contains("playoff") || text.contains("mvp") {
                sportsCount += 1
            } else if text.contains("😂") || text.contains("😭") || text.contains("lmao") ||
                     author.contains("druski") || author.contains("meme") {
                comedyCount += 1
            } else if author.contains("dbz") || author.contains("anime") || text.contains("pokemon") ||
                     text.contains("vegeta") || text.contains("gohan") {
                animeCount += 1
            } else if text.contains("breaking") || text.contains("report") || author.contains("news") {
                newsCount += 1
            } else {
                generalCount += 1
            }
        }
        
        let total = tweets.count
        return [
            ContentCategory(name: "Sports & Games", percentage: (sportsCount * 100) / total, color: "blue"),
            ContentCategory(name: "Comedy & Memes", percentage: (comedyCount * 100) / total, color: "orange"),
            ContentCategory(name: "Anime & Gaming", percentage: (animeCount * 100) / total, color: "purple"),
            ContentCategory(name: "News & Updates", percentage: (newsCount * 100) / total, color: "green"),
            ContentCategory(name: "General Content", percentage: (generalCount * 100) / total, color: "gray")
        ].filter { $0.percentage > 0 }.sorted { $0.percentage > $1.percentage }
    }
    
    private func generateEngagementPatternsFromRealData(tweets: [HardcodedTweet], activity: DayXActivity) -> EngagementPatterns {
        // Analyze engagement timing from tweet timestamps
        var hourlyEngagement: [Int: Int] = [:]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        for tweet in tweets {
            if let date = dateFormatter.date(from: tweet.createdAt) {
                let hour = Calendar.current.component(.hour, from: date)
                hourlyEngagement[hour, default: 0] += 1
            }
        }
        
        let peakHour = hourlyEngagement.max(by: { $0.value < $1.value })?.key ?? 19
        let avgEngagementPerHour = hourlyEngagement.values.reduce(0, +) / max(hourlyEngagement.count, 1)
        
        return EngagementPatterns(
            peakHour: peakHour,
            averageEngagementPerHour: avgEngagementPerHour,
            hourlyBreakdown: hourlyEngagement,
            mostActiveTimeframe: "\(peakHour):00 - \(peakHour + 1):00",
            engagementConsistency: calculateEngagementConsistency(hourlyEngagement)
        )
    }
    
    private func generateTopAccountsFromRealData(tweets: [HardcodedTweet]) -> [TopEngagedAccount] {
        var accountEngagement: [String: Int] = [:]
        
        for tweet in tweets {
            accountEngagement[tweet.authorUsername, default: 0] += 1
        }
        
        return accountEngagement
            .sorted { $0.value > $1.value }
            .prefix(5)
            .map { TopEngagedAccount(username: $0.key, interactionCount: $0.value, accountType: determineAccountType($0.key)) }
    }
    
    private func determineAccountType(_ username: String) -> String {
        let username = username.lowercased()
        if username.contains("nba") || username.contains("mlb") || username.contains("sports") {
            return "Sports"
        } else if username.contains("report") || username.contains("news") {
            return "News"
        } else if username.contains("meme") || username == "druski" {
            return "Comedy"
        } else {
            return "Content Creator"
        }
    }
    
    private func calculateEngagementConsistency(_ hourlyData: [Int: Int]) -> Double {
        let values = Array(hourlyData.values)
        guard values.count > 1 else { return 0.5 }
        
        let mean = Double(values.reduce(0, +)) / Double(values.count)
        let variance = values.map { pow(Double($0) - mean, 2) }.reduce(0, +) / Double(values.count)
        let standardDeviation = sqrt(variance)
        
        // Lower standard deviation = higher consistency
        return max(0, 1.0 - (standardDeviation / mean))
    }
    
    private func calculateDailyScore(sentiment: TweetSentimentAnalysis, viral: ViralPredictionAnalysis) -> Int {
        var score = 50 // Base score
        
        // Add points for positive sentiment
        if sentiment.dominantMood == .positive {
            score += 20
        } else if sentiment.dominantMood == .neutral {
            score += 10
        }
        
        // Add points for viral predictions
        score += viral.tasteMakingScore / 10
        
        // Bonus for high engagement
        score += min(viral.viralHitCount * 5, 30)
        
        return min(score, 100)
    }
    
    // MARK: - Demo Mode Analytics (Existing)
    
    public func generateDemoInsights() async -> DailyInsights {
        // Simulate API call delay for realistic experience
        try? await Task.sleep(nanoseconds: 1_500_000_000) // 1.5 seconds
        
        // Generate realistic demo data
        let currentHour = Calendar.current.component(.hour, from: Date())
        let dayOfWeek = Calendar.current.component(.weekday, from: Date())
        
        // Dynamic tweets liked based on time of day and day of week
        let baseTweetsLiked = generateRealisticTweetCount(hour: currentHour, weekday: dayOfWeek)
        
        // Dynamic active hours (more on weekends, varies by time)
        let activeHours = generateRealisticActiveHours(weekday: dayOfWeek, currentHour: currentHour)
        
        // Unique accounts engaged with
        let uniqueAccounts = Int.random(in: 12...18)
        
        // Peak activity time based on realistic patterns
        let peakTime = generatePeakActivityTime()
        
        // Top engaged account with realistic tech industry usernames
        let topAccount = generateTopEngagedAccount()
        
        return DailyInsights(
            tweetsLiked: baseTweetsLiked,
            activeHours: activeHours,
            uniqueAccounts: uniqueAccounts,
            peakActivityTime: peakTime,
            topEngagedAccount: topAccount
        )
    }
    
    public func generateRealisticTweetCount(hour: Int, weekday: Int) -> Int {
        var base = 25
        
        // More activity during typical working hours
        if hour >= 9 && hour <= 17 {
            base += Int.random(in: 5...15)
        }
        
        // Weekend boost
        if weekday == 1 || weekday == 7 { // Sunday or Saturday
            base += Int.random(in: 8...12)
        }
        
        // Evening social media time
        if hour >= 19 && hour <= 22 {
            base += Int.random(in: 10...20)
        }
        
        // Add some randomness
        return base + Int.random(in: -5...15)
    }
    
    public func generateRealisticActiveHours(weekday: Int, currentHour: Int) -> Int {
        if weekday == 1 || weekday == 7 { // Weekend
            return Int.random(in: 3...6)
        } else if currentHour < 12 { // Morning/early day
            return Int.random(in: 1...3)
        } else if currentHour < 18 { // Afternoon
            return Int.random(in: 2...4)
        } else { // Evening
            return Int.random(in: 3...5)
        }
    }
    
    public func generatePeakActivityTime() -> String {
        let peakTimes = [
            "9:30 AM", "11:15 AM", "1:45 PM", "2:30 PM",
            "4:15 PM", "7:20 PM", "8:45 PM", "10:30 PM"
        ]
        return peakTimes.randomElement() ?? "2:30 PM"
    }
    
    public func generateTopEngagedAccount() -> TopAccount {
        let techAccounts = [
            ("paulg", Int.random(in: 4...8)),
            ("gdb", Int.random(in: 3...7)),
            ("sama", Int.random(in: 5...9)),
            ("karpathy", Int.random(in: 6...10)),
            ("levelsio", Int.random(in: 3...8)),
            ("naval", Int.random(in: 4...9)),
            ("dhh", Int.random(in: 5...9)),
            ("spolsky", Int.random(in: 3...7)),
            ("patio11", Int.random(in: 4...8))
        ]
        
        let selectedAccount = techAccounts.randomElement() ?? ("swiftlang", 5)
        return TopAccount(username: selectedAccount.0, interactionCount: selectedAccount.1)
    }
}

// MARK: - Demo Analytics Extensions

extension XService {
    
    func fetchDemoContentBreakdown() -> [ContentCategory] {
        return [
            ContentCategory(name: "Tech & Development", percentage: Int.random(in: 40...50), color: "blue"),
            ContentCategory(name: "Industry News", percentage: Int.random(in: 25...35), color: "green"),
            ContentCategory(name: "Memes & Humor", percentage: Int.random(in: 10...20), color: "orange"),
            ContentCategory(name: "Sports & Entertainment", percentage: Int.random(in: 5...15), color: "purple")
        ]
    }
    
    func fetchDemoEngagementTrends() -> EngagementTrends {
        let changePercentage = Int.random(in: -15...35)
        let isPositive = changePercentage > 0
        
        return EngagementTrends(
            percentageChange: changePercentage,
            isPositive: isPositive,
            peakTimeStart: Int.random(in: 13...16), // 1-4 PM
            peakTimeEnd: Int.random(in: 15...18),   // 3-6 PM
            comparisonPeriod: "yesterday"
        )
    }
    
    func fetchDemoWeeklyComparison() -> [DayActivityData] {
        let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        return days.map { day in
            DayActivityData(
                day: day,
                tweetsLiked: Int.random(in: 15...45),
                timeSpent: Int.random(in: 2...6)
            )
        }
    }
}

// MARK: - DayX Wrapped Models (NEW!)

struct DayXWrappedInsights {
    let totalTweetsLiked: Int
    let sentimentAnalysis: TweetSentimentAnalysis
    let viralAnalysis: ViralPredictionAnalysis
    let contentBreakdown: [ContentCategory]
    let engagementPatterns: EngagementPatterns
    let topAccounts: [TopEngagedAccount]
    let peakActivityHour: Int
    let dailyScore: Int
}

struct EngagementPatterns {
    let peakHour: Int
    let averageEngagementPerHour: Int
    let hourlyBreakdown: [Int: Int]
    let mostActiveTimeframe: String
    let engagementConsistency: Double
}

struct TopEngagedAccount {
    let username: String
    let interactionCount: Int
    let accountType: String
}

// MARK: - Supporting Models (Existing)

struct ContentCategory {
    let name: String
    let percentage: Int
    let color: String
}

struct EngagementTrends {
    let percentageChange: Int
    let isPositive: Bool
    let peakTimeStart: Int
    let peakTimeEnd: Int
    let comparisonPeriod: String
}

struct DayActivityData {
    let day: String
    let tweetsLiked: Int
    let timeSpent: Int
}

struct XAPIUserResponse: Codable {
    let data: XAPIUserData
}

struct XAPIUserData: Codable {
    let id: String
    let name: String
    let username: String
    let profileImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, username
        case profileImageUrl = "profile_image_url"
    }
}

// MARK: - Error Handling

enum XAPIError: Error, LocalizedError {
    case noAccessToken
    case invalidResponse
    case badRequest
    case unauthorized
    case forbidden
    case rateLimitExceeded
    case unknownError(Int)
    
    var errorDescription: String? {
        switch self {
        case .noAccessToken:
            return "No access token found. Please sign in again."
        case .invalidResponse:
            return "Invalid response from X API."
        case .badRequest:
            return "Bad request. Please check your input."
        case .unauthorized:
            return "Unauthorized. Your token may have expired."
        case .forbidden:
            return "Access forbidden. You may not have permission for this resource."
        case .rateLimitExceeded:
            return "Rate limit exceeded. Please wait before trying again."
        case .unknownError(let code):
            return "Unknown error occurred (Status: \(code)). Please try again."
        }
    }
}
