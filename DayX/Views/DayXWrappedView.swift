//
//  DayXWrappedView.swift
//  DayX
//
//  Created by Austin Burgess on 5/26/25.
//

import SwiftUI

struct DayXWrappedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isLoading = true
    @State private var sentimentAnalysis: TweetSentimentAnalysis?
    @State private var viralAnalysis: ViralPredictionAnalysis?
    @State private var currentPage = 0
    
    // Random day data - selected once when view loads
    @State private var selectedDayData: (tweets: [HardcodedTweet], activity: DayXActivity) = ([], DayXActivity(date: "", likedTweetIDs: [], retweetedTweetIDs: [], repliedToTweetIDs: [], quotedTweetIDs: [], newAccountsFollowed: [], peakActivityHour: 0, totalEngagements: 0))
    
    var body: some View {
        NavigationView {
            ZStack {
                // Gradient background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.8),
                        Color.purple.opacity(0.6),
                        Color.pink.opacity(0.4)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                if isLoading {
                    VStack(spacing: 20) {
                        ProgressView()
                            .scaleEffect(1.5)
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        
                        Text("Analyzing your X psychology...")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("Running AI sentiment analysis")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                } else {
                    TabView(selection: $currentPage) {
                        // Page 1: Your X Day
                        DayXOverviewPage(activity: selectedDayData.activity, sentimentAnalysis: sentimentAnalysis)
                            .tag(0)
                        
                        // Page 2: Your Mood Analysis
                        if let sentimentAnalysis = sentimentAnalysis {
                            DayXSentimentPage(analysis: sentimentAnalysis, tweets: selectedDayData.tweets)
                                .tag(1)
                        }
                        
                        // Page 3: Hidden Gem
                        DayXHiddenGemPage(tweets: selectedDayData.tweets)
                            .tag(2)
                        
                        // Page 4: Here's to You🥂 (Insights Part 1)
                        DayXInsightsPart1Page(tweets: selectedDayData.tweets)
                            .tag(3)
                        
                        // Page 5: Here's to You🥂 (Insights Part 2)
                        DayXInsightsPart2Page(tweets: selectedDayData.tweets)
                            .tag(4)
                        
                        // Page 6: Top Viral Tweets
                        DayXTopTweetsPage(tweets: selectedDayData.tweets, viralAnalysis: viralAnalysis)
                            .tag(5)
                        
                        // Page 7: Your X Day Wrapped (All Tweets)
                        DayXAllTweetsPage(tweets: selectedDayData.tweets)
                            .tag(6)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
            }
            .navigationTitle("X Wrapped")
            .navigationBarTitleDisplayMode(.large)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.white)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Share") {
                        // TODO: Implement share functionality
                    }
                    .foregroundColor(.white)
                }
            }
        }
        .onAppear {
            // Select random day data once when view appears
            selectedDayData = HardcodedTwitterData.getRandomDayData()
            loadAnalytics()
        }
    }
    
    private func loadAnalytics() {
        isLoading = true
        
        Task {
            // Simulate processing time for dramatic effect
            try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
            
            // Run AI analysis on selected day's tweets
            let sentimentAnalyzer = TwitterSentimentAnalyzer()
            let sentimentResults = sentimentAnalyzer.analyzeTweets(selectedDayData.tweets)
            
            let viralEngine = ViralPredictionEngine()
            let viralResults = viralEngine.analyzeViralPredictions(from: selectedDayData.tweets)
            
            await MainActor.run {
                sentimentAnalysis = sentimentResults
                viralAnalysis = viralResults
                isLoading = false
            }
        }
    }
}

// MARK: - Individual Pages

struct DayXOverviewPage: View {
    let activity: DayXActivity
    let sentimentAnalysis: TweetSentimentAnalysis?
    
    private func formatTime(_ hour: Int) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        var components = DateComponents()
        components.hour = hour
        components.minute = 0
        
        if let date = Calendar.current.date(from: components) {
            return formatter.string(from: date)
        }
        return "\(hour):00"
    }
    
    private func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "MMMM d, yyyy"
            return displayFormatter.string(from: date)
        }
        return dateString
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                VStack(spacing: 8) {
                    Text("Your X Day")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(formatDate(activity.date))
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.top, 40)
                
                VStack(spacing: 20) {
                    StatsCard(title: "Tweets Liked", value: "\(activity.totalEngagements)", subtitle: "total interactions", color: .pink)
                    
                    StatsCard(title: "Peak Activity", value: formatTime(activity.peakActivityHour), subtitle: "most active hour", color: .orange)
                    
                    if let sentiment = sentimentAnalysis {
                        StatsCard(title: "Dominant Mood", value: sentiment.dominantMood.emoji, subtitle: sentiment.dominantMood.description, color: .blue)
                    }
                }
                
                Text("Swipe to explore your X psychology →")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.top, 20)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct DayXSentimentPage: View {
    let analysis: TweetSentimentAnalysis
    let tweets: [HardcodedTweet]
    
    // Find a tweet that reflects the dominant mood - FIXED LOGIC
    private var exampleTweet: HardcodedTweet? {
        switch analysis.dominantMood {
        case .positive:
            // Look for positive tweets first
            return tweets.first { tweet in
                let text = tweet.text.lowercased()
                return text.contains("amazing") || text.contains("incredible") || text.contains("beautiful") ||
                       text.contains("perfect") || text.contains("excellent") || text.contains("grateful") ||
                       text.contains("mastery") || text.contains("🔥") || text.contains("✨") ||
                       text.contains("❤️") || text.contains("💪") || text.contains("🌟")
            } ?? tweets.first { $0.authorUsername == "Cristiano" } // Fallback to Cristiano's positive tweet
        case .negative:
            // Look for roasting/critical tweets - prioritize specific negative language
            return tweets.first { tweet in
                let text = tweet.text.lowercased()
                return text.contains("fall off") || text.contains("merchant") || text.contains("sassy")
            } ?? tweets.first { tweet in
                let text = tweet.text.lowercased()
                return text.contains("😭") && text.contains("lmao")
            } ?? tweets.first { $0.authorUsername == "HaterReport_" }
        case .neutral:
            return tweets.first { $0.likeCount < 5000 }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Your Mood Analysis")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                // Mood description
                Text(analysis.moodDescription)
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Sentiment breakdown
                VStack(spacing: 15) {
                    ForEach(SentimentCategory.allCases, id: \.self) { category in
                        let count = analysis.categoryBreakdown[category] ?? 0
                        let percentage = count * 100 / analysis.categoryBreakdown.values.reduce(0, +)
                        
                        SentimentBar(
                            category: category,
                            count: count,
                            percentage: percentage
                        )
                    }
                }
                .padding(.horizontal)
                
                // Tweet reflecting mood (no "Example" text)
                if let exampleTweet = exampleTweet {
                    VStack(spacing: 12) {
                        TweetDisplayCard(tweet: exampleTweet)
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
}

struct DayXHiddenGemPage: View {
    let tweets: [HardcodedTweet]
    
    private var hiddenGem: HardcodedTweet? {
        tweets.min(by: { $0.likeCount < $1.likeCount })
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Hidden Gem")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Text("💎")
                    .font(.system(size: 80))
                
                Text("Your Most Lowkey Like")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("While everyone was chasing viral content, you showed love to the smaller moments")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                if let gem = hiddenGem {
                    VStack(spacing: 12) {
                        TweetDisplayCard(tweet: gem)
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
}

// Smart Tweet Selection Helper - UPDATED
struct TweetSelector {
    static func selectUniqueExampleTweets(from tweets: [HardcodedTweet]) -> (sports: HardcodedTweet?, viral: HardcodedTweet?, comedy: HardcodedTweet?, nba: HardcodedTweet?) {
        var usedTweetIds: Set<String> = []
        
        // 1. Sports engagement tweet (NBA/Basketball/Baseball focused) - UPDATED
        let sportsTweet = tweets.first { tweet in
            let text = tweet.text.lowercased()
            let author = tweet.authorUsername.lowercased()
            let isSports = author.contains("nba") || author.contains("mlb") || author.contains("baseball") ||
                          text.contains("kat") || text.contains("wolves") || text.contains("knicks") ||
                          text.contains("pacers") || text.contains("playoff") || text.contains("strikeout") ||
                          text.contains("basketball") || text.contains("🏀") || text.contains("⚾️") ||
                          text.contains("ohtani") || text.contains("perfect") && author.contains("fuzzy")
            return isSports && !usedTweetIds.contains(tweet.id)
        }
        if let sportsTweet = sportsTweet {
            usedTweetIds.insert(sportsTweet.id)
        }
        
        // 2. Viral tweet (50K+ engagement, not already used)
        let viralTweet = tweets.first { tweet in
            let isViral = (tweet.likeCount + tweet.retweetCount) >= 50000
            return isViral && !usedTweetIds.contains(tweet.id)
        }
        if let viralTweet = viralTweet {
            usedTweetIds.insert(viralTweet.id)
        }
        
        // 3. Comedy tweet (not already used) - UPDATED
        let comedyTweet = tweets.first { tweet in
            let text = tweet.text.lowercased()
            let author = tweet.authorUsername.lowercased()
            let isComedy = text.contains("😂") || text.contains("😭") || author.contains("druski") ||
                          text.contains("lmao") || text.contains("whiteBoy") || text.contains("hilarious") ||
                          text.contains("amazing") && author.contains("nocontexthumans")
            return isComedy && !usedTweetIds.contains(tweet.id)
        }
        if let comedyTweet = comedyTweet {
            usedTweetIds.insert(comedyTweet.id)
        }
        
        // 4. NBA specific tweet (different from sports tweet, not already used) - UPDATED
        let nbaTweet = tweets.first { tweet in
            let text = tweet.text.lowercased()
            let author = tweet.authorUsername.lowercased()
            let isNBA = (text.contains("mvp") && text.contains("sga")) ||
                       text.contains("thunder") || text.contains("minnesota") ||
                       (author.contains("nba") && (text.contains("game") || text.contains("and 1"))) ||
                       text.contains("playoff") ||
                       (text.contains("basketball") || text.contains("🏀")) ||
                       (author.contains("nba") || author.contains("hoops"))
            return isNBA && !usedTweetIds.contains(tweet.id)
        }
        
        return (sportsTweet, viralTweet, comedyTweet, nbaTweet)
    }
}

// AI Insights Part 1
struct DayXInsightsPart1Page: View {
    let tweets: [HardcodedTweet]
    
    private var selectedTweets: (sports: HardcodedTweet?, viral: HardcodedTweet?, comedy: HardcodedTweet?, nba: HardcodedTweet?) {
        TweetSelector.selectUniqueExampleTweets(from: tweets)
    }
    
    private var viralStats: (viral: Int, megaViral: Int) {
        let viral = tweets.filter { ($0.likeCount + $0.retweetCount) >= 50000 }.count
        let megaViral = tweets.filter { ($0.likeCount + $0.retweetCount) >= 200000 }.count
        return (viral, megaViral)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Here's to You🥂")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                VStack(alignment: .leading, spacing: 25) {
                    // Sports engagement insight
                    VStack(alignment: .leading, spacing: 12) {
                        InsightRow(icon: "🧠", text: "Your engagement peaks during sports events")
                        
                        if let sportsTweet = selectedTweets.sports {
                            TweetDisplayCard(tweet: sportsTweet)
                        }
                    }
                    
                    // Viral content insight
                    VStack(alignment: .leading, spacing: 12) {
                        InsightRow(icon: "📊", text: "You liked \(viralStats.viral) viral tweets (50K+ engagements) and \(viralStats.megaViral) mega viral tweets (200K+ engagements)")
                        
                        if let viralTweet = selectedTweets.viral {
                            TweetDisplayCard(tweet: viralTweet)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

// AI Insights Part 2
struct DayXInsightsPart2Page: View {
    let tweets: [HardcodedTweet]
    
    private var selectedTweets: (sports: HardcodedTweet?, viral: HardcodedTweet?, comedy: HardcodedTweet?, nba: HardcodedTweet?) {
        TweetSelector.selectUniqueExampleTweets(from: tweets)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Here's to You🥂")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                VStack(alignment: .leading, spacing: 25) {
                    // Content domination insight
                    VStack(alignment: .leading, spacing: 12) {
                        InsightRow(icon: "🎯", text: "Comedy and sports content dominate your likes")
                        
                        if let comedyTweet = selectedTweets.comedy {
                            TweetDisplayCard(tweet: comedyTweet)
                        }
                    }
                    
                    // NBA playoff insight - FIXED TO SHOW ANY SPORTS CONTENT
                    VStack(alignment: .leading, spacing: 12) {
                        InsightRow(icon: "🏀", text: "You engage 3x more with NBA playoff content than regular season")
                        
                        if let nbaTweet = selectedTweets.nba {
                            TweetDisplayCard(tweet: nbaTweet)
                        } else if let sportsTweet = selectedTweets.sports {
                            // Fallback to any sports tweet if no NBA specific tweet found
                            TweetDisplayCard(tweet: sportsTweet)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct DayXTopTweetsPage: View {
    let tweets: [HardcodedTweet]
    let viralAnalysis: ViralPredictionAnalysis?
    
    var topTweets: [HardcodedTweet] {
        tweets.sorted { $0.likeCount > $1.likeCount }.prefix(5).map { $0 }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Top Viral Tweets")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                ForEach(Array(topTweets.enumerated()), id: \.element.id) { index, tweet in
                    TopTweetCard(tweet: tweet, rank: index + 1)
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

// Your X Day Wrapped (All Tweets)
struct DayXAllTweetsPage: View {
    let tweets: [HardcodedTweet]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Your X Day Wrapped")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Text("All \(tweets.count) tweets you liked today")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                
                LazyVStack(spacing: 12) {
                    ForEach(tweets.sorted { $0.likeCount > $1.likeCount }, id: \.id) { tweet in
                        TweetDisplayCard(tweet: tweet)
                    }
                }
                .padding(.horizontal)
                
                // Portfolio footer
                VStack(spacing: 12) {
                    Divider()
                        .background(Color.white.opacity(0.3))
                    
                    VStack(spacing: 8) {
                        Text("X Wrapped - AI-Powered Twitter Psychology")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text("Built with real Twitter data, Natural Language sentiment analysis, and viral prediction algorithms. Demonstrates iOS development, AI integration, and sophisticated data analytics.")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                        
                        Text("Technologies: SwiftUI, Natural Language, Core ML, Advanced Analytics")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.7))
                            .fontWeight(.medium)
                    }
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
        }
    }
}

// MARK: - Supporting Views

struct StatsCard: View {
    let title: String
    let value: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Text(value)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(color)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(16)
    }
}

struct SentimentBar: View {
    let category: SentimentCategory
    let count: Int
    let percentage: Int
    
    private var color: Color {
        switch category {
        case .positive: return .green
        case .negative: return .red
        case .neutral: return .gray
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(category.emoji) \(category.description)")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer()
                Text("\(percentage)%")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.white.opacity(0.2))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(color)
                        .frame(width: geometry.size.width * CGFloat(percentage) / 100, height: 8)
                        .cornerRadius(4)
                }
            }
            .frame(height: 8)
        }
    }
}

// Universal Tweet Display Card
struct TweetDisplayCard: View {
    let tweet: HardcodedTweet
    
    private var user: HardcodedXUser? {
        HardcodedTwitterData.users.first { $0.username == tweet.authorUsername }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                // Profile pic
                if let user = user, let imageURL = URL(string: user.profileImageURL) {
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                    }
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                }
                
                Text("@\(tweet.authorUsername)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Text("\(tweet.likeCount)❤️")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Text(tweet.text)
                .font(.body)
                .foregroundColor(.white)
                .lineLimit(6)
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(12)
    }
}

struct TopTweetCard: View {
    let tweet: HardcodedTweet
    let rank: Int
    
    private var user: HardcodedXUser? {
        HardcodedTwitterData.users.first { $0.username == tweet.authorUsername }
    }
    
    // Medal colors based on rank
    private var cardBackgroundColor: Color {
        switch rank {
        case 1: return Color(hex: "FCDC5A").opacity(0.6) // Light gold
        case 2: return Color(hex: "D1D8DD").opacity(0.4) // Light silver
        case 3: return Color(hex: "CD7F32").opacity(0.3) // Light bronze
        default: return Color.black.opacity(0.3)
        }
    }
    
    private var rankNumberColor: Color {
        switch rank {
        case 1: return Color(hex: "ffd700") // Darker gold
        case 2: return Color(hex: "ebeceb") // Darker silver
        case 3: return Color(hex: "cd7f32") // Darker bronze
        default: return .white
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                // Rank with medal colors
                Text("#\(rank)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(rankNumberColor)
                
                // Profile pic
                if let user = user, let imageURL = URL(string: user.profileImageURL) {
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                    }
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                }
                
                Text("@\(tweet.authorUsername)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Text("\(tweet.likeCount)❤️")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Text(tweet.text)
                .font(.body)
                .foregroundColor(.white)
                .lineLimit(4)
        }
        .padding()
        .background(cardBackgroundColor)
        .cornerRadius(12)
    }
}

struct InsightRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(icon)
                .font(.title2)
            
            Text(text)
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
    }
}

// MARK: - Color Extension for Hex Colors

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    DayXWrappedView()
}
