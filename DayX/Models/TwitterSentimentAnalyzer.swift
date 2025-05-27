//
//  TwitterSentimentAnalyzer.swift
//  DayX
//
//  Created by Austin Burgess on 5/26/25.
//

import Foundation
import NaturalLanguage

class TwitterSentimentAnalyzer {
    
    // MARK: - Sentiment Analysis
    
    func analyzeSentiment(for text: String) -> SentimentResult {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = text
        
        let (sentiment, _) = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore)
        
        let score = Double(sentiment?.rawValue ?? "0") ?? 0.0
        
        let category: SentimentCategory
        if score > 0.1 {
            category = .positive
        } else if score < -0.1 {
            category = .negative
        } else {
            category = .neutral
        }
        
        let confidence = abs(score)
        let positiveScore = max(0, score)
        let negativeScore = max(0, -score)
        
        return SentimentResult(
            category: category,
            confidence: confidence,
            positiveScore: positiveScore,
            negativeScore: negativeScore
        )
    }
    
    func analyzeTweets(_ tweets: [HardcodedTweet]) -> TweetSentimentAnalysis {
        var sentimentResults: [String: SentimentResult] = [:]
        var categoryBreakdown: [SentimentCategory: Int] = [.positive: 0, .negative: 0, .neutral: 0]
        var totalScore: Double = 0
        
        for tweet in tweets {
            let sentiment = analyzeSentiment(for: tweet.text)
            sentimentResults[tweet.id] = sentiment
            categoryBreakdown[sentiment.category, default: 0] += 1
            
            // Calculate weighted score based on engagement
            let engagementWeight = Double(tweet.likeCount + tweet.retweetCount) / 10000.0
            let weightedScore = (sentiment.positiveScore - sentiment.negativeScore) * min(engagementWeight, 2.0)
            totalScore += weightedScore
        }
        
        return TweetSentimentAnalysis(
            sentimentResults: sentimentResults,
            categoryBreakdown: categoryBreakdown,
            overallMoodScore: totalScore / Double(tweets.count),
            dominantMood: getDominantMood(from: categoryBreakdown),
            moodDescription: generateMoodDescription(score: totalScore / Double(tweets.count), breakdown: categoryBreakdown)
        )
    }
    
    // MARK: - Mood Analysis
    
    private func getDominantMood(from breakdown: [SentimentCategory: Int]) -> SentimentCategory {
        return breakdown.max(by: { $0.value < $1.value })?.key ?? .neutral
    }
    
    private func generateMoodDescription(score: Double, breakdown: [SentimentCategory: Int]) -> String {
        let total = breakdown.values.reduce(0, +)
        let positivePercent = (breakdown[.positive] ?? 0) * 100 / total
        let negativePercent = (breakdown[.negative] ?? 0) * 100 / total
        
        if score > 0.3 {
            return "Highly positive day - you were drawn to uplifting and exciting content!"
        } else if score > 0.1 {
            return "Generally positive vibes - \(positivePercent)% of your likes were upbeat content"
        } else if score < -0.3 {
            return "Tough day reflected in your timeline - lots of critical or negative content"
        } else if score < -0.1 {
            return "Mixed feelings - \(negativePercent)% negative, \(positivePercent)% positive content"
        } else {
            return "Balanced mood - you engaged with a mix of different emotional content"
        }
    }
}

// MARK: - Data Models

enum SentimentCategory: CaseIterable {
    case positive, negative, neutral
    
    var emoji: String {
        switch self {
        case .positive: return "😊"
        case .negative: return "😔"
        case .neutral: return "😐"
        }
    }
    
    var color: String {
        switch self {
        case .positive: return "green"
        case .negative: return "red"
        case .neutral: return "gray"
        }
    }
    
    var description: String {
        switch self {
        case .positive: return "Positive"
        case .negative: return "Negative"
        case .neutral: return "Neutral"
        }
    }
}

struct SentimentResult {
    let category: SentimentCategory
    let confidence: Double
    let positiveScore: Double
    let negativeScore: Double
}

struct TweetSentimentAnalysis {
    let sentimentResults: [String: SentimentResult]
    let categoryBreakdown: [SentimentCategory: Int]
    let overallMoodScore: Double
    let dominantMood: SentimentCategory
    let moodDescription: String
}
