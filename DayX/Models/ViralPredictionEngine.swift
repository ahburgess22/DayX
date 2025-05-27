//
//  ViralPredictionEngine.swift
//  DayX
//
//  Created by Austin Burgess on 5/26/25.
//


//
//  ViralPredictionEngine.swift
//  DayX
//
//  Created by Austin Burgess on 5/26/25.
//

import Foundation

class ViralPredictionEngine {
    
    // MARK: - Viral Prediction Analysis
    
    func analyzeViralPredictions(from tweets: [HardcodedTweet]) -> ViralPredictionAnalysis {
        var viralHits: [ViralHit] = []
        var tasteMakingScore = 0
        var totalPredictionAccuracy = 0.0
        
        for tweet in tweets {
            if let viralStatus = determineViralStatus(for: tweet) {
                viralHits.append(viralStatus)
                
                if viralStatus.isViralHit {
                    tasteMakingScore += viralStatus.tasteMakingPoints
                }
                
                totalPredictionAccuracy += viralStatus.predictionAccuracy
            }
        }
        
        let averageAccuracy = viralHits.isEmpty ? 0 : totalPredictionAccuracy / Double(viralHits.count)
        
        return ViralPredictionAnalysis(
            viralHits: viralHits.sorted { $0.finalEngagement > $1.finalEngagement },
            tasteMakingScore: tasteMakingScore,
            predictionAccuracy: averageAccuracy,
            viralHitCount: viralHits.filter { $0.isViralHit }.count,
            topViralPick: viralHits.max { $0.viralMultiplier < $1.viralMultiplier },
            rankingDescription: generateTasteMakingRanking(score: tasteMakingScore)
        )
    }
    
    private func determineViralStatus(for tweet: HardcodedTweet) -> ViralHit? {
        let finalEngagement = tweet.likeCount + tweet.retweetCount
        
        // Determine if it's viral based on engagement thresholds
        let viralThreshold = 50000
        let megaViralThreshold = 200000
        
        if finalEngagement < 1000 {
            return nil // Too small to analyze
        }
        
        let isViralHit = finalEngagement >= viralThreshold
        let isMegaViral = finalEngagement >= megaViralThreshold
        
        // Calculate viral multiplier (how much it grew)
        let estimatedStartingEngagement = max(100, finalEngagement / (isMegaViral ? 1000 : (isViralHit ? 500 : 10)))
        let viralMultiplier = Double(finalEngagement) / Double(estimatedStartingEngagement)
        
        // Calculate taste making points
        var tasteMakingPoints = 0
        if isMegaViral {
            tasteMakingPoints = 50
        } else if isViralHit {
            tasteMakingPoints = 25
        } else if finalEngagement > 10000 {
            tasteMakingPoints = 10
        }
        
        // Add bonus points for early detection (based on account size vs engagement)
        let user = HardcodedTwitterData.users.first { $0.username == tweet.authorUsername }
        if let user = user {
            let engagementRatio = Double(finalEngagement) / Double(user.followerCount)
            if engagementRatio > 0.05 { // High engagement relative to follower count
                tasteMakingPoints += 15
            }
        }
        
        let predictionAccuracy = min(viralMultiplier / 100.0, 1.0)
        
        return ViralHit(
            tweetId: tweet.id,
            tweetText: tweet.text,
            authorUsername: tweet.authorUsername,
            finalEngagement: finalEngagement,
            estimatedStartingEngagement: estimatedStartingEngagement,
            viralMultiplier: viralMultiplier,
            isViralHit: isViralHit,
            isMegaViral: isMegaViral,
            tasteMakingPoints: tasteMakingPoints,
            predictionAccuracy: predictionAccuracy,
            category: determineViralCategory(for: tweet)
        )
    }
    
    private func determineViralCategory(for tweet: HardcodedTweet) -> ViralCategory {
        let text = tweet.text.lowercased()
        
        if text.contains("nba") || text.contains("basketball") || text.contains("game") || text.contains("playoff") {
            return .sports
        } else if text.contains("😂") || text.contains("😭") || text.contains("lmao") || text.contains("funny") {
            return .comedy
        } else if text.contains("breaking") || text.contains("news") || text.contains("report") {
            return .news
        } else if text.contains("music") || text.contains("song") || text.contains("artist") {
            return .music
        } else {
            return .general
        }
    }
    
    private func generateTasteMakingRanking(score: Int) -> String {
        switch score {
        case 0..<50:
            return "Casual Browser - You stick to the mainstream"
        case 50..<150:
            return "Good Eye - You catch some gems early"
        case 150..<300:
            return "Trend Spotter - You have solid taste-making skills"
        case 300..<500:
            return "Viral Prophet - You consistently spot hits before they explode"
        case 500..<750:
            return "Taste Making Legend - Your likes predict the future"
        default:
            return "Twitter Oracle - You have supernatural viral detection powers"
        }
    }
}

// MARK: - Data Models

struct ViralPredictionAnalysis {
    let viralHits: [ViralHit]
    let tasteMakingScore: Int
    let predictionAccuracy: Double
    let viralHitCount: Int
    let topViralPick: ViralHit?
    let rankingDescription: String
}

struct ViralHit {
    let tweetId: String
    let tweetText: String
    let authorUsername: String
    let finalEngagement: Int
    let estimatedStartingEngagement: Int
    let viralMultiplier: Double
    let isViralHit: Bool
    let isMegaViral: Bool
    let tasteMakingPoints: Int
    let predictionAccuracy: Double
    let category: ViralCategory
}

enum ViralCategory: CaseIterable {
    case sports, comedy, news, music, general
    
    var emoji: String {
        switch self {
        case .sports: return "🏀"
        case .comedy: return "😂"
        case .news: return "📰"
        case .music: return "🎵"
        case .general: return "💬"
        }
    }
    
    var description: String {
        switch self {
        case .sports: return "Sports"
        case .comedy: return "Comedy"
        case .news: return "News"
        case .music: return "Music"
        case .general: return "General"
        }
    }
}