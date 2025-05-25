//
//  DailyInsights.swift
//  DayX
//
//  Created by Austin Burgess on 5/24/25.
//

import Foundation

struct DailyInsights {
    let tweetsLiked: Int
    let activeHours: Int
    let uniqueAccounts: Int
    let peakHour: String
    let savedTweets: Int
    let topAccount: TopAccount?
}

struct TopAccount {
    let username: String
    let profileImageUrl: String
    let engagementCount: Int
}
