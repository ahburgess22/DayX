//
//  TwitterAPIModels.swift
//  DayX
//
//  Created by Austin Burgess on 5/25/25.
//

import Foundation

// MARK: - Liked Tweets API Response
struct XLikedTweetsResponse: Codable {
    let data: [XTweet]?
    let includes: XIncludes?
    let meta: XMeta?
}

struct XTweet: Codable {
    let id: String
    let text: String
    let author_id: String?
    let created_at: String?
    let public_metrics: XPublicMetrics?
}

struct XPublicMetrics: Codable {
    let retweet_count: Int
    let like_count: Int
    let reply_count: Int
    let quote_count: Int
}

struct XIncludes: Codable {
    let users: [XAPIUser]?
}

struct XAPIUser: Codable {
    let id: String
    let username: String
    let name: String
    let profile_image_url: String?
}

struct XMeta: Codable {
    let result_count: Int
    let next_token: String?
}

struct XUserResponse: Codable {
    let data: XAPIUser
}
