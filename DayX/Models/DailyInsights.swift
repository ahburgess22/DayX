import Foundation

// MARK: - Enhanced Daily Insights Models

struct DailyInsights {
    let tweetsLiked: Int
    let activeHours: Int
    let uniqueAccounts: Int
    let peakActivityTime: String
    let topEngagedAccount: TopAccount?
    let mode: InsightsMode
    let additionalMetrics: AdditionalMetrics?
    
    init(tweetsLiked: Int,
         activeHours: Int,
         uniqueAccounts: Int,
         peakActivityTime: String,
         topEngagedAccount: TopAccount?,
         mode: InsightsMode = .live,
         additionalMetrics: AdditionalMetrics? = nil) {
        self.tweetsLiked = tweetsLiked
        self.activeHours = activeHours
        self.uniqueAccounts = uniqueAccounts
        self.peakActivityTime = peakActivityTime
        self.topEngagedAccount = topEngagedAccount
        self.mode = mode
        self.additionalMetrics = additionalMetrics
    }
}

enum InsightsMode {
    case live
    case demo
}

struct TopAccount {
    let username: String
    let interactionCount: Int
    let accountType: AccountType?
    
    init(username: String, interactionCount: Int, accountType: AccountType? = nil) {
        self.username = username
        self.interactionCount = interactionCount
        self.accountType = accountType
    }
}

enum AccountType {
    case tech
    case news
    case entertainment
    case educational
    
    var icon: String {
        switch self {
        case .tech: return "laptopcomputer"
        case .news: return "newspaper"
        case .entertainment: return "tv"
        case .educational: return "graduationcap"
        }
    }
    
    var description: String {
        switch self {
        case .tech: return "Tech Industry"
        case .news: return "News & Media"
        case .entertainment: return "Entertainment"
        case .educational: return "Educational"
        }
    }
}

struct AdditionalMetrics {
    let bookmarksToday: Int
    let retweetsToday: Int
    let repliesGiven: Int
    let repliesReceived: Int
    let streakDays: Int
    let learningScore: Double // 0.0 to 1.0
    let engagementScore: Double // 0.0 to 1.0
    let diversityScore: Double // 0.0 to 1.0 (how diverse the content types are)
    
    var learningGrade: String {
        switch learningScore {
        case 0.9...1.0: return "A+"
        case 0.8..<0.9: return "A"
        case 0.7..<0.8: return "B+"
        case 0.6..<0.7: return "B"
        case 0.5..<0.6: return "C+"
        default: return "C"
        }
    }
    
    var engagementLevel: String {
        switch engagementScore {
        case 0.8...1.0: return "Highly Engaged"
        case 0.6..<0.8: return "Active"
        case 0.4..<0.6: return "Moderate"
        case 0.2..<0.4: return "Light"
        default: return "Minimal"
        }
    }
    
    var diversityLevel: String {
        switch diversityScore {
        case 0.8...1.0: return "Very Diverse"
        case 0.6..<0.8: return "Diverse"
        case 0.4..<0.6: return "Moderate"
        case 0.2..<0.4: return "Focused"
        default: return "Specialized"
        }
    }
}

// MARK: - Live API Enhancements

extension DailyInsights {
    static func createLiveInsights(user: XUser) -> DailyInsights {
        return DailyInsights(
            tweetsLiked: 0,
            activeHours: 0,
            uniqueAccounts: 1,
            peakActivityTime: "Connected ✅",
            topEngagedAccount: TopAccount(
                username: user.username,
                interactionCount: 0,
                accountType: .tech
            ),
            mode: .live,
            additionalMetrics: AdditionalMetrics(
                bookmarksToday: 0,
                retweetsToday: 0,
                repliesGiven: 0,
                repliesReceived: 0,
                streakDays: 1,
                learningScore: 1.0, // Max score for having real API connection
                engagementScore: 1.0, // Max score for authentication success
                diversityScore: 0.5
            )
        )
    }
}

// MARK: - Demo Data Generation Extensions

extension DailyInsights {
    static func createDemoInsights() -> DailyInsights {
        let currentHour = Calendar.current.component(.hour, from: Date())
        let dayOfWeek = Calendar.current.component(.weekday, from: Date())
        
        // Generate realistic demo metrics
        let tweetsLiked = generateDemoTweetCount(hour: currentHour, weekday: dayOfWeek)
        let activeHours = generateDemoActiveHours(weekday: dayOfWeek, currentHour: currentHour)
        let uniqueAccounts = Int.random(in: 12...18)
        let peakTime = generateDemoPeakTime()
        let topAccount = generateDemoTopAccount()
        let additionalMetrics = generateDemoAdditionalMetrics()
        
        return DailyInsights(
            tweetsLiked: tweetsLiked,
            activeHours: activeHours,
            uniqueAccounts: uniqueAccounts,
            peakActivityTime: peakTime,
            topEngagedAccount: topAccount,
            mode: .demo,
            additionalMetrics: additionalMetrics
        )
    }
    
    private static func generateDemoTweetCount(hour: Int, weekday: Int) -> Int {
        var base = 25
        
        // More activity during typical working hours
        if hour >= 9 && hour <= 17 {
            base += Int.random(in: 5...15)
        }
        
        // Weekend boost
        if weekday == 1 || weekday == 7 {
            base += Int.random(in: 8...12)
        }
        
        // Evening social media time
        if hour >= 19 && hour <= 22 {
            base += Int.random(in: 10...20)
        }
        
        return base + Int.random(in: -5...15)
    }
    
    private static func generateDemoActiveHours(weekday: Int, currentHour: Int) -> Int {
        if weekday == 1 || weekday == 7 { // Weekend
            return Int.random(in: 3...6)
        } else if currentHour < 12 { // Morning
            return Int.random(in: 1...3)
        } else if currentHour < 18 { // Afternoon
            return Int.random(in: 2...4)
        } else { // Evening
            return Int.random(in: 3...5)
        }
    }
    
    private static func generateDemoPeakTime() -> String {
        let peakTimes = [
            "9:30 AM", "11:15 AM", "1:45 PM", "2:30 PM",
            "4:15 PM", "7:20 PM", "8:45 PM", "10:30 PM"
        ]
        return peakTimes.randomElement() ?? "2:30 PM"
    }
    
    private static func generateDemoTopAccount() -> TopAccount {
        let techAccounts = [
            ("paulg", AccountType.tech, Int.random(in: 4...8)),
            ("gdb", AccountType.tech, Int.random(in: 3...7)),
            ("sama", AccountType.tech, Int.random(in: 5...9)),
            ("karpathy", AccountType.tech, Int.random(in: 6...10)),
            ("levelsio", AccountType.tech, Int.random(in: 3...8)),
            ("naval", AccountType.tech, Int.random(in: 4...9)),
            ("dhh", AccountType.tech, Int.random(in: 5...9)),
            ("spolsky", AccountType.tech, Int.random(in: 3...7)),
            ("patio11", AccountType.tech, Int.random(in: 4...8)),
            ("gruber", AccountType.tech, Int.random(in: 5...8))
        ]
        
        let selectedAccount = techAccounts.randomElement() ?? ("swiftlang", AccountType.tech, 5)
        return TopAccount(
            username: selectedAccount.0,
            interactionCount: selectedAccount.2,
            accountType: selectedAccount.1
        )
    }
    
    private static func generateDemoAdditionalMetrics() -> AdditionalMetrics {
        return AdditionalMetrics(
            bookmarksToday: Int.random(in: 3...8),
            retweetsToday: Int.random(in: 2...6),
            repliesGiven: Int.random(in: 1...5),
            repliesReceived: Int.random(in: 0...3),
            streakDays: Int.random(in: 3...15),
            learningScore: Double.random(in: 0.7...0.95),
            engagementScore: Double.random(in: 0.6...0.9),
            diversityScore: Double.random(in: 0.5...0.8)
        )
    }
}

// MARK: - Computed Properties for Display

extension DailyInsights {
    var displayTitle: String {
        switch mode {
        case .live:
            return "Live X Data"
        case .demo:
            return "Demo Analytics"
        }
    }
    
    var statusIcon: String {
        switch mode {
        case .live:
            return "checkmark.circle.fill"
        case .demo:
            return "waveform.and.magnifyingglass"
        }
    }
    
    var statusColor: String {
        switch mode {
        case .live:
            return "green"
        case .demo:
            return "blue"
        }
    }
    
    var description: String {
        switch mode {
        case .live:
            return "Real OAuth + Profile Data. Limited by API tier restrictions."
        case .demo:
            return "Comprehensive analytics showcase with realistic data patterns."
        }
    }
}

// MARK: - Formatting Helpers

extension AdditionalMetrics {
    var formattedLearningScore: String {
        return String(format: "%.0f%%", learningScore * 100)
    }
    
    var formattedEngagementScore: String {
        return String(format: "%.0f%%", engagementScore * 100)
    }
    
    var formattedDiversityScore: String {
        return String(format: "%.0f%%", diversityScore * 100)
    }
}
