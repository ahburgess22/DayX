//
//  HardcodedTwitterData.swift
//  DayX
//
//  Created by Austin Burgess on 5/26/25.
//

import Foundation

class HardcodedTwitterData {
    
    // MARK: - Your Real Twitter Users
    
    static let users: [HardcodedXUser] = [
        HardcodedXUser(id: "1", username: "LegionHoops", displayName: "Legion Hoops", profileImageURL: "https://pbs.twimg.com/profile_images/1458336928252628996/3kFMzxin_400x400.jpg", followerCount: 2800000, followingCount: 1200, isVerified: true, bio: "Your #1 source for basketball highlights and news", location: "United States"),
        HardcodedXUser(id: "2", username: "opdaIy", displayName: "One Piece Daily", profileImageURL: "https://pbs.twimg.com/profile_images/1683765468899713025/HvJDC2Re_400x400.jpg", followerCount: 580000, followingCount: 200, isVerified: false, bio: "Daily One Piece content", location: nil),
        HardcodedXUser(id: "3", username: "crazyclips_", displayName: "Crazy Clips", profileImageURL: "https://pbs.twimg.com/profile_images/1684658065184882688/_86y0302_400x400.png", followerCount: 1200000, followingCount: 800, isVerified: false, bio: "Viral clips that hit different", location: nil),
        HardcodedXUser(id: "4", username: "90sDBZ", displayName: "90s Dragon Ball Z", profileImageURL: "https://pbs.twimg.com/profile_images/1797390925305450496/zk4crOtO_400x400.jpg", followerCount: 890000, followingCount: 150, isVerified: false, bio: "Classic DBZ moments", location: nil),
        HardcodedXUser(id: "5", username: "TalkinBaseball_", displayName: "Talkin' Baseball", profileImageURL: "https://pbs.twimg.com/profile_images/1431227413598453761/Tu4qggZp_400x400.jpg", followerCount: 750000, followingCount: 300, isVerified: true, bio: "Baseball highlights and news", location: "United States"),
        HardcodedXUser(id: "6", username: "BricksCenter", displayName: "BricksCenter", profileImageURL: "https://pbs.twimg.com/profile_images/1811503344822972416/-PFj1Qe3_400x400.jpg", followerCount: 920000, followingCount: 400, isVerified: false, bio: "NBA memes and highlights", location: nil),
        HardcodedXUser(id: "7", username: "BleacherReport", displayName: "Bleacher Report", profileImageURL: "https://pbs.twimg.com/profile_images/1881361622498672640/ri14kGEY_400x400.jpg", followerCount: 8500000, followingCount: 5000, isVerified: true, bio: "Sports highlights, news and culture", location: "United States"),
        HardcodedXUser(id: "8", username: "TheNBACentel", displayName: "NBACentel", profileImageURL: "https://pbs.twimg.com/profile_images/1815579008647507970/fKMch7t7_400x400.jpg", followerCount: 1800000, followingCount: 500, isVerified: false, bio: "NBA highlights and memes", location: nil),
        HardcodedXUser(id: "9", username: "MLB", displayName: "MLB", profileImageURL: "https://pbs.twimg.com/profile_images/1914908644170244096/UVwkcbxt_400x400.jpg", followerCount: 12000000, followingCount: 2000, isVerified: true, bio: "Official Major League Baseball", location: "United States"),
        HardcodedXUser(id: "10", username: "HaterReport_", displayName: "Hater Report", profileImageURL: "https://pbs.twimg.com/profile_images/1847859293502033920/yhod2BoC_400x400.jpg", followerCount: 650000, followingCount: 300, isVerified: false, bio: "Sports takes and memes", location: nil),
        HardcodedXUser(id: "11", username: "druski", displayName: "DRUSKI", profileImageURL: "https://pbs.twimg.com/profile_images/1910131084118863872/uff5k5L-_400x400.jpg", followerCount: 3200000, followingCount: 800, isVerified: true, bio: "Comedian", location: "Atlanta, GA"),
        HardcodedXUser(id: "12", username: "RLHoitzII", displayName: "Richard L. Hoitz, Jr.", profileImageURL: "https://pbs.twimg.com/profile_images/1581080295285063680/S5y8KAqa_400x400.jpg", followerCount: 145000, followingCount: 1200, isVerified: false, bio: "Thoughts and observations", location: nil),
        HardcodedXUser(id: "13", username: "untitledanim8", displayName: "Untitled Animation", profileImageURL: "https://pbs.twimg.com/profile_images/1837844251125620736/upvPA8p0_400x400.jpg", followerCount: 89000, followingCount: 450, isVerified: false, bio: "Pokemon art and animation", location: nil),
        HardcodedXUser(id: "14", username: "11point7", displayName: "11point7 College Baseball", profileImageURL: "https://pbs.twimg.com/profile_images/1485707878535155719/r0KjDQE1_400x400.jpg", followerCount: 125000, followingCount: 800, isVerified: false, bio: "College baseball highlights", location: nil),
        HardcodedXUser(id: "15", username: "UsherNBA", displayName: "Brett Usher", profileImageURL: "https://pbs.twimg.com/profile_images/1424821815294103575/adpb7KzZ_400x400.jpg", followerCount: 89000, followingCount: 600, isVerified: false, bio: "NBA content creator", location: nil),
        HardcodedXUser(id: "16", username: "biggestgranddad", displayName: "MMIV", profileImageURL: "https://pbs.twimg.com/profile_images/1909436432214622208/2q8f1gKw_400x400.jpg", followerCount: 95000, followingCount: 1100, isVerified: false, bio: "Sports commentary", location: nil),
        HardcodedXUser(id: "17", username: "Anthonyjunior_2", displayName: "AnthonyJR", profileImageURL: "https://pbs.twimg.com/profile_images/1636083150139932672/GhzThGhS_400x400.jpg", followerCount: 280000, followingCount: 900, isVerified: false, bio: "Commentary and memes", location: nil),
        HardcodedXUser(id: "18", username: "PitchingNinja", displayName: "Rob Friedman", profileImageURL: "https://pbs.twimg.com/profile_images/1512159253041143814/uFu0y635_400x400.jpg", followerCount: 450000, followingCount: 1200, isVerified: true, bio: "Baseball analytics and highlights", location: nil),
        HardcodedXUser(id: "19", username: "TheoVon", displayName: "Theo Von", profileImageURL: "https://pbs.twimg.com/profile_images/1494113550251347975/F6TI6s6l_400x400.jpg", followerCount: 1200000, followingCount: 300, isVerified: true, bio: "Comedian and podcaster", location: "Nashville, TN"),
        HardcodedXUser(id: "20", username: "kirawontmiss", displayName: "kira👾", profileImageURL: "https://pbs.twimg.com/profile_images/1636443983990669326/xm-YehdR_400x400.jpg", followerCount: 890000, followingCount: 700, isVerified: false, bio: "Music and culture", location: nil),
        HardcodedXUser(id: "21", username: "FearedBuck", displayName: "FearBuck", profileImageURL: "https://pbs.twimg.com/profile_images/1767253449295470592/1mP-x_PT_400x400.jpg", followerCount: 320000, followingCount: 500, isVerified: false, bio: "Gaming and streaming content", location: nil),
        HardcodedXUser(id: "22", username: "fbl_sam", displayName: "sam 🫥", profileImageURL: "https://pbs.twimg.com/profile_images/1883552654363693056/QtceOnyy_400x400.jpg", followerCount: 180000, followingCount: 800, isVerified: false, bio: "Sports takes", location: nil),
        HardcodedXUser(id: "23", username: "HoopMixOnly", displayName: "Hoops", profileImageURL: "https://pbs.twimg.com/profile_images/1905235832459415552/LQ332Q60_400x400.jpg", followerCount: 420000, followingCount: 300, isVerified: false, bio: "Basketball content", location: nil),
        HardcodedXUser(id: "24", username: "Szuzuk1", displayName: "Cules", profileImageURL: "https://pbs.twimg.com/profile_images/1857272391652524032/8R2UiXy__400x400.jpg", followerCount: 45000, followingCount: 600, isVerified: false, bio: "Soccer content", location: nil),
        HardcodedXUser(id: "25", username: "G10_AFC", displayName: "G10", profileImageURL: "https://pbs.twimg.com/profile_images/1925665850431795201/0z03PDVt_400x400.jpg", followerCount: 12000, followingCount: 400, isVerified: false, bio: "Sports commentary", location: nil),
        HardcodedXUser(id: "26", username: "HoodiiBron", displayName: "✧.*", profileImageURL: "https://pbs.twimg.com/profile_images/1640790781475835904/1sjvVPRE_400x400.jpg", followerCount: 8500, followingCount: 300, isVerified: false, bio: "NBA content", location: nil),
        HardcodedXUser(id: "27", username: "UnderdogMLB", displayName: "Underdog MLB", profileImageURL: "https://pbs.twimg.com/profile_images/1834652492098895872/gbQgOjG0_400x400.jpg", followerCount: 280000, followingCount: 400, isVerified: false, bio: "MLB content and analytics", location: nil),
        HardcodedXUser(id: "28", username: "BarstoolPhilly", displayName: "Barstool Philly", profileImageURL: "https://pbs.twimg.com/profile_images/1778955186221780992/GJQHbfCF_400x400.jpg", followerCount: 190000, followingCount: 800, isVerified: true, bio: "Philadelphia sports", location: "Philadelphia, PA"),
        HardcodedXUser(id: "29", username: "SwatBaseball", displayName: "Swarthmore Baseball", profileImageURL: "https://pbs.twimg.com/profile_images/1034866291616743424/hwZk7bmV_400x400.jpg", followerCount: 2800, followingCount: 150, isVerified: false, bio: "Official Swarthmore College Baseball", location: "Swarthmore, PA"),
        HardcodedXUser(id: "30", username: "JoeBinder", displayName: "Joe Binder", profileImageURL: "https://pbs.twimg.com/profile_images/1895890349169508352/RyJ_JdXj_400x400.jpg", followerCount: 45000, followingCount: 900, isVerified: false, bio: "Sports analyst", location: nil),
        HardcodedXUser(id: "31", username: "JeffPassan", displayName: "Jeff Passan", profileImageURL: "https://pbs.twimg.com/profile_images/1634328286930010112/SAKTy_pK_400x400.jpg", followerCount: 2100000, followingCount: 1800, isVerified: true, bio: "ESPN MLB Insider", location: "United States"),
        HardcodedXUser(id: "32", username: "Furnacepicks", displayName: "FurnacePicks", profileImageURL: "https://pbs.twimg.com/profile_images/1898549953300967424/WaP6aYrR_400x400.jpg", followerCount: 89000, followingCount: 500, isVerified: false, bio: "Sports betting content", location: nil),
        HardcodedXUser(id: "33", username: "EasyCantMiss", displayName: "Easy", profileImageURL: "https://pbs.twimg.com/profile_images/1919864996554563584/-vudSdWm_400x400.jpg", followerCount: 145000, followingCount: 700, isVerified: false, bio: "Memes and commentary", location: nil),
        HardcodedXUser(id: "34", username: "bigDavo_7", displayName: "BIG Davo", profileImageURL: "https://pbs.twimg.com/profile_images/1654138211453796354/XbKzBjLD_400x400.jpg", followerCount: 78000, followingCount: 400, isVerified: false, bio: "Sports content", location: nil)
    ]
    
    // MARK: - Your Real Twitter Timeline
    
    static let tweets: [HardcodedTweet] = [
        HardcodedTweet(id: "1", authorUsername: "LegionHoops", text: "The extender comes through once again.", createdAt: "2025-05-26T14:30:00Z", likeCount: 28000, retweetCount: 1200, replyCount: 450, viewCount: 890000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "2", authorUsername: "opdaIy", text: "Gol D. Roger", createdAt: "2025-05-26T12:15:00Z", likeCount: 1600, retweetCount: 766, replyCount: 120, viewCount: 45000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "3", authorUsername: "crazyclips_", text: "A man took his blind friend to a place where he could drive freely without any worries ❤️", createdAt: "2025-05-26T11:45:00Z", likeCount: 8100, retweetCount: 226, replyCount: 89, viewCount: 156000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "4", authorUsername: "90sDBZ", text: "Vegeta", createdAt: "2025-05-26T10:20:00Z", likeCount: 250, retweetCount: 24, replyCount: 18, viewCount: 8900, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "5", authorUsername: "TalkinBaseball_", text: "MY GOODNESS TARIK SKUBAL", createdAt: "2025-05-26T20:45:00Z", likeCount: 8300, retweetCount: 402, replyCount: 156, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "6", authorUsername: "BricksCenter", text: "Why KAT trying to talk in a deep voice 😭😭😭", createdAt: "2025-05-26T19:30:00Z", likeCount: 9500, retweetCount: 318, replyCount: 234, viewCount: 145000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "7", authorUsername: "BleacherReport", text: "Bron didn't hold back during Bryce's HS graduation 🤣🔥", createdAt: "2025-05-26T15:20:00Z", likeCount: 34000, retweetCount: 1500, replyCount: 890, viewCount: 567000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "8", authorUsername: "TheNBACentel", text: "Wolves arena chanting: \"FREE THROW MERCHANT\" at SGA 💀😭", createdAt: "2025-05-26T21:15:00Z", likeCount: 31000, retweetCount: 1300, replyCount: 567, viewCount: 445000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "9", authorUsername: "MLB", text: "122.9 off the bat 😳 Oneil Cruz sent this baseball for a SWIM", createdAt: "2025-05-26T18:45:00Z", likeCount: 13000, retweetCount: 1300, replyCount: 234, viewCount: 289000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "10", authorUsername: "HaterReport_", text: "Karl-Anthony Twons in the 4th quarter with the Knicks season on the line", createdAt: "2025-05-26T22:30:00Z", likeCount: 11000, retweetCount: 630, replyCount: 345, viewCount: 178000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "11", authorUsername: "druski", text: "Always that 1 😂", createdAt: "2025-05-26T16:45:00Z", likeCount: 67000, retweetCount: 6100, replyCount: 1200, viewCount: 890000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "12", authorUsername: "RLHoitzII", text: "Imagine giggling in the dark with 8 of your closest bros here", createdAt: "2025-05-26T13:20:00Z", likeCount: 247000, retweetCount: 12000, replyCount: 3400, viewCount: 1200000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "13", authorUsername: "untitledanim8", text: "gen 3 artwork by the artist @ArkhaiPxls #pokemon", createdAt: "2025-05-26T09:30:00Z", likeCount: 1000, retweetCount: 129, replyCount: 45, viewCount: 23000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: ["pokemon"], mentions: ["ArkhaiPxls"]),
        HardcodedTweet(id: "14", authorUsername: "11point7", text: "Georgia Tech is PISSED", createdAt: "2025-05-26T17:15:00Z", likeCount: 1700, retweetCount: 57, replyCount: 89, viewCount: 34000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "15", authorUsername: "UsherNBA", text: "14-15 Kevin Love outlet passes", createdAt: "2025-05-26T14:45:00Z", likeCount: 18000, retweetCount: 2100, replyCount: 345, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "16", authorUsername: "biggestgranddad", text: "Such a niche highlight tape lmao", createdAt: "2025-05-26T15:30:00Z", likeCount: 38000, retweetCount: 1400, replyCount: 567, viewCount: 445000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "17", authorUsername: "MLB", text: "Hey Chicago, what do you say? You're on top of the NL Central today!", createdAt: "2025-05-26T19:15:00Z", likeCount: 5300, retweetCount: 231, replyCount: 78, viewCount: 89000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "18", authorUsername: "Anthonyjunior_2", text: "This Soulja Boy fall off needs to be studied on a deeper scale 😭😭😭😭", createdAt: "2025-05-26T12:45:00Z", likeCount: 86000, retweetCount: 4500, replyCount: 1800, viewCount: 567000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "19", authorUsername: "PitchingNinja", text: "Can we eject Phil Cuzzi for this call? [Javy Baez ejected for having a better eye than Cuzzi]", createdAt: "2025-05-26T20:30:00Z", likeCount: 4000, retweetCount: 340, replyCount: 145, viewCount: 67000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "20", authorUsername: "TheoVon", text: "thanks boo but imma at least do a lil bronzer outta respect", createdAt: "2025-05-26T11:15:00Z", likeCount: 27000, retweetCount: 253, replyCount: 456, viewCount: 178000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "21", authorUsername: "kirawontmiss", text: "SZA and Kendrick Lamar performing👀", createdAt: "2025-05-26T16:20:00Z", likeCount: 47000, retweetCount: 2300, replyCount: 678, viewCount: 345000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "22", authorUsername: "HaterReport_", text: "BREAKING: The NBA has activate The Series Extender protocol: Scott Foster will officiate Game 3 between the Pacers and Knicks LMAOO Adam Silver knows EXACTLY what he's doing 😂", createdAt: "2025-05-26T18:15:00Z", likeCount: 53000, retweetCount: 3300, replyCount: 890, viewCount: 456000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "23", authorUsername: "BricksCenter", text: "Britany Grinder left the interview to yell at the refs 😭 \"BE F*CKING BETTER\"", createdAt: "2025-05-26T19:45:00Z", likeCount: 40000, retweetCount: 1500, replyCount: 567, viewCount: 289000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "24", authorUsername: "kirawontmiss", text: "whenever i'm having a bad day i just look at this image", createdAt: "2025-05-26T10:45:00Z", likeCount: 224000, retweetCount: 11000, replyCount: 2300, viewCount: 1100000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "25", authorUsername: "FearedBuck", text: "Kai Cenat reveals he turned down offers from Amazon Prime, Netflix, and Tubi, who all wanted to bring Streamer University to their platforms 👀", createdAt: "2025-05-26T14:15:00Z", likeCount: 109000, retweetCount: 3600, replyCount: 1456, viewCount: 678000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "26", authorUsername: "fbl_sam", text: "Knicks win game 3!!!!", createdAt: "2025-05-26T22:45:00Z", likeCount: 32000, retweetCount: 2800, replyCount: 456, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "27", authorUsername: "TheNBACentel", text: "The WNBA has drug tested Angel Reese following her 13-point explosion, per sources.", createdAt: "2025-05-26T17:30:00Z", likeCount: 65000, retweetCount: 2500, replyCount: 890, viewCount: 445000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "28", authorUsername: "HoopMixOnly", text: "Team USA or Team World in a series?", createdAt: "2025-05-26T13:45:00Z", likeCount: 29000, retweetCount: 1200, replyCount: 567, viewCount: 189000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "29", authorUsername: "MLB", text: "Absurd movement on this pitch during Shohei Ohtani's live BP 🔥", createdAt: "2025-05-26T15:45:00Z", likeCount: 5300, retweetCount: 231, replyCount: 89, viewCount: 78000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "30", authorUsername: "BleacherReport", text: "Indiana's parking prices for Game 3 😭😭 (via @KylaBRussell)", createdAt: "2025-05-26T16:00:00Z", likeCount: 34000, retweetCount: 1500, replyCount: 456, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: ["KylaBRussell"]),
        HardcodedTweet(id: "31", authorUsername: "Szuzuk1", text: "\"Here uh dayuuum uh\" ahh pass", createdAt: "2025-05-26T20:15:00Z", likeCount: 4100, retweetCount: 29, replyCount: 67, viewCount: 23000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "32", authorUsername: "G10_AFC", text: "Just take it 💅", createdAt: "2025-05-26T21:30:00Z", likeCount: 650, retweetCount: 5, replyCount: 12, viewCount: 8900, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "33", authorUsername: "HaterReport_", text: "KAT IS HILARIOUS BRUH Even his passes be SASSY lmaooo 🤣", createdAt: "2025-05-26T19:20:00Z", likeCount: 78000, retweetCount: 3300, replyCount: 1200, viewCount: 567000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "34", authorUsername: "11point7", text: "OH MY LORD BETHUNE-COOKMAN WALK OFF 3 RUN TANKKK TO PUNCH THEIR TICKET", createdAt: "2025-05-26T18:30:00Z", likeCount: 2200, retweetCount: 144, replyCount: 78, viewCount: 34000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "35", authorUsername: "HaterReport_", text: "Big Purr appreciation post", createdAt: "2025-05-26T12:30:00Z", likeCount: 7100, retweetCount: 704, replyCount: 234, viewCount: 89000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "36", authorUsername: "HoodiiBron", text: "KAT as soon as there's a little pressure in the playoffs", createdAt: "2025-05-26T21:45:00Z", likeCount: 366, retweetCount: 17, replyCount: 23, viewCount: 12000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "37", authorUsername: "UnderdogMLB", text: "Tarik Skubal vs. Guardians:\n\n9 IP\n0 ER\n13 K\n2 H\n0 BB\n94 Pitches\n\nMost Ks ever in a Maddux.", createdAt: "2025-05-26T20:50:00Z", likeCount: 8800, retweetCount: 808, replyCount: 189, viewCount: 134000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "38", authorUsername: "BarstoolPhilly", text: "PHILLIES WIN THEIR 8TH GAME IN A ROW!", createdAt: "2025-05-26T22:15:00Z", likeCount: 5300, retweetCount: 381, replyCount: 156, viewCount: 67000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "39", authorUsername: "SwatBaseball", text: "Congratulations to our 12 amazing seniors! #GoGarnet", createdAt: "2025-05-26T16:30:00Z", likeCount: 41, retweetCount: 3, replyCount: 8, viewCount: 1200, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: ["GoGarnet"], mentions: []),
        HardcodedTweet(id: "40", authorUsername: "JoeBinder", text: "This is what being \"fun bad\" is all about. Just gotta embrace it", createdAt: "2025-05-26T17:45:00Z", likeCount: 9200, retweetCount: 221, replyCount: 134, viewCount: 56000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        // Continue with remaining tweets...
        HardcodedTweet(id: "41", authorUsername: "MLB", text: "SEIYA SUZUKI GO-AHEAD 3-RUN BLAST!\n\nHe leads MLB with 49 RBI!", createdAt: "2025-05-26T19:00:00Z", likeCount: 9700, retweetCount: 996, replyCount: 234, viewCount: 145000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "42", authorUsername: "BricksCenter", text: "Kelsey Plum hit Angel Reese with the \"Too Small\" 😭😭", createdAt: "2025-05-26T18:00:00Z", likeCount: 42000, retweetCount: 1900, replyCount: 567, viewCount: 289000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "43", authorUsername: "JeffPassan", text: "Tarik Skubal just threw as good of a game as you're ever going to see. His start against Cleveland:\n\n9 IP, 2 H, 0 R, 0 BB, 13 K\n\n94 pitches, 72 strikes\n\nFinal pitch: 102.6 mph, the hardest of his career\n\n26 swings and misses\n\nFirst CG of his career", createdAt: "2025-05-26T21:00:00Z", likeCount: 45000, retweetCount: 3400, replyCount: 890, viewCount: 345000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "44", authorUsername: "MLB", text: "Shohei Ohtani's first 50 games:\n\n2024 vs. 2025 👀", createdAt: "2025-05-26T14:00:00Z", likeCount: 11000, retweetCount: 838, replyCount: 234, viewCount: 167000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "45", authorUsername: "BleacherReport", text: "PACERS HAVE EXPLODED FOR A 20-PT LEAD 🤯", createdAt: "2025-05-26T21:20:00Z", likeCount: 38000, retweetCount: 1200, replyCount: 456, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "46", authorUsername: "BleacherReport", text: "MINNESOTA DOMINATES AT HOME TO TAKE GAME 3 🐺🔥", createdAt: "2025-05-26T22:00:00Z", likeCount: 56000, retweetCount: 1900, replyCount: 678, viewCount: 389000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "47", authorUsername: "BleacherReport", text: "TWolves duo came to play in Game 3 💪\n\nAnt: 30 PTS, 12-17 FG, 9 REB, 6 AST\n\nRandle: 24 PTS, 9-14 FG, 4 REB, 3 AST", createdAt: "2025-05-26T22:30:00Z", likeCount: 12000, retweetCount: 472, replyCount: 189, viewCount: 134000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "48", authorUsername: "BleacherReport", text: "Elina Svitolina trying out a new style 🤣", createdAt: "2025-05-26T13:00:00Z", likeCount: 735, retweetCount: 28, replyCount: 45, viewCount: 12000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "49", authorUsername: "BleacherReport", text: "SGA was mic'd up breaking down why the Thunder lost Game 3 👀", createdAt: "2025-05-26T23:00:00Z", likeCount: 27000, retweetCount: 1100, replyCount: 345, viewCount: 189000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "50", authorUsername: "BleacherReport", text: "Nadal emotional seeing his footprint added to the #RolandGarros clay court 🧡🥹", createdAt: "2025-05-26T15:00:00Z", likeCount: 24000, retweetCount: 1300, replyCount: 456, viewCount: 167000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: ["RolandGarros"], mentions: []),
        HardcodedTweet(id: "51", authorUsername: "BleacherReport", text: "Oneil Cruz just hit the FASTEST ball in the Statcast era with a HR🤯🔥\n\n122.9 MPH 😱\n\n(via @Pirates)", createdAt: "2025-05-26T18:15:00Z", likeCount: 5400, retweetCount: 419, replyCount: 134, viewCount: 78000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: ["Pirates"]),
        HardcodedTweet(id: "52", authorUsername: "BleacherReport", text: "SGA IS YOUR 2024-25 NBA MVP 🏆⚡️\n\n32.7 PPG | 6.4 APG | 5.0 RPG\n\nOKC GOT ONE 🌟\n\n(via @ShamsCharania)", createdAt: "2025-05-26T20:00:00Z", likeCount: 53000, retweetCount: 8600, replyCount: 1200, viewCount: 456000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: ["ShamsCharania"]),
        HardcodedTweet(id: "53", authorUsername: "untitledanim8", text: "journey\n\nartwork by the artist @blueeyesnorton\n\n#pokemon", createdAt: "2025-05-26T11:00:00Z", likeCount: 2400, retweetCount: 299, replyCount: 67, viewCount: 34000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: ["pokemon"], mentions: ["blueeyesnorton"]),
        HardcodedTweet(id: "54", authorUsername: "BleacherReport", text: "Novak Djokovic, Roger Federer and Andy Murray surprised Rafael Nadal at his Roland-Garros farewell ceremony 🥹👏\n\n4 TENNIS LEGENDS. 🎾💯", createdAt: "2025-05-26T16:45:00Z", likeCount: 55000, retweetCount: 5500, replyCount: 890, viewCount: 389000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "55", authorUsername: "MLB", text: "Kyle Schwarber joins Aaron Judge atop the MLB HR leaderboard with No. 18 💣", createdAt: "2025-05-26T19:30:00Z", likeCount: 8000, retweetCount: 358, replyCount: 156, viewCount: 89000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "56", authorUsername: "kirawontmiss", text: "this take has me crying😭", createdAt: "2025-05-26T17:00:00Z", likeCount: 250000, retweetCount: 10000, replyCount: 2800, viewCount: 1300000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "57", authorUsername: "HaterReport_", text: "Thunder losing so bad Lu Dort trying to fight Anthony Edwards lmaooo\n\nANT A DAWG THOUGH", createdAt: "2025-05-26T21:40:00Z", likeCount: 17000, retweetCount: 708, replyCount: 345, viewCount: 134000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "58", authorUsername: "druski", text: "The WhiteBoy that's accepted by the Hood 😂", createdAt: "2025-05-26T13:30:00Z", likeCount: 329000, retweetCount: 45000, replyCount: 5600, viewCount: 1800000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "59", authorUsername: "MLB", text: "THIRTEEN STRIKEOUTS.\nBALLGAME.\n\nTARIK SKUBAL 😤", createdAt: "2025-05-26T21:10:00Z", likeCount: 16000, retweetCount: 1900, replyCount: 345, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "60", authorUsername: "90sDBZ", text: "Gohan", createdAt: "2025-05-26T12:00:00Z", likeCount: 2400, retweetCount: 182, replyCount: 89, viewCount: 23000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "61", authorUsername: "MLB", text: "Aaron Judge goes the other way for his league-leading 18th home run of the season! 👨‍⚖️", createdAt: "2025-05-26T20:20:00Z", likeCount: 1700, retweetCount: 230, replyCount: 67, viewCount: 34000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "62", authorUsername: "HaterReport_", text: "Dawg Jalen Brunson tried to pull off one of his CRAZIEST FLOPS we've seen LMFAOOO \n\nSGA YOU HAVE 24 HOURS TO RESPOND", createdAt: "2025-05-26T22:20:00Z", likeCount: 52000, retweetCount: 3300, replyCount: 890, viewCount: 389000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "63", authorUsername: "PitchingNinja", text: "Max Fried's Pickoff Move.", createdAt: "2025-05-26T18:20:00Z", likeCount: 7400, retweetCount: 347, replyCount: 123, viewCount: 67000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "64", authorUsername: "MLB", text: "2 HR\n6 RBI\n\nPCA is a man on a mission!", createdAt: "2025-05-26T17:20:00Z", likeCount: 5500, retweetCount: 375, replyCount: 134, viewCount: 56000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "65", authorUsername: "HaterReport_", text: "Cameron Brink pregame 👀", createdAt: "2025-05-26T19:50:00Z", likeCount: 48000, retweetCount: 1300, replyCount: 567, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "66", authorUsername: "Furnacepicks", text: "Julius Randle when I have USD on him", createdAt: "2025-05-26T21:25:00Z", likeCount: 37000, retweetCount: 2300, replyCount: 456, viewCount: 189000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "67", authorUsername: "EasyCantMiss", text: "\"Sir the Haliban just hit the second tower\"", createdAt: "2025-05-26T14:30:00Z", likeCount: 63000, retweetCount: 4600, replyCount: 1200, viewCount: 456000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "68", authorUsername: "bigDavo_7", text: "Talk about a deal", createdAt: "2025-05-26T16:15:00Z", likeCount: 43000, retweetCount: 1300, replyCount: 345, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "69", authorUsername: "MLB", text: "The @Angels haven't surged like this in over a decade! 📈\n\nThey're now back at .500 👀", createdAt: "2025-05-26T20:40:00Z", likeCount: 9300, retweetCount: 783, replyCount: 189, viewCount: 134000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: ["Angels"]),
        HardcodedTweet(id: "70", authorUsername: "UnderdogMLB", text: "Dylan Crews last 9 games:\n\n.406 BA\n4 HR\n10 Runs\n2 SB", createdAt: "2025-05-26T18:50:00Z", likeCount: 2600, retweetCount: 167, replyCount: 78, viewCount: 34000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "71", authorUsername: "MLB", text: "The @Nationals win it on James Wood's first career #walkoff hit!", createdAt: "2025-05-26T23:15:00Z", likeCount: 2600, retweetCount: 231, replyCount: 89, viewCount: 45000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: ["walkoff"], mentions: ["Nationals"]),
        HardcodedTweet(id: "72", authorUsername: "MLB", text: "Kyle Schwarber joins Aaron Judge atop the MLB HR leaderboard with No. 18 💣", createdAt: "2025-05-26T19:30:00Z", likeCount: 8000, retweetCount: 358, replyCount: 156, viewCount: 89000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: [])
    ]
    
    // MARK: - Your Daily Activity
    
    static let dailyActivity = DayXActivity(
        date: "2025-05-26",
        likedTweetIDs: Array(1...72).map { String($0) }, // You liked all 72 tweets
        retweetedTweetIDs: [], // No retweets in demo
        repliedToTweetIDs: [], // No replies in demo
        quotedTweetIDs: [], // No quotes in demo
        newAccountsFollowed: [], // No new follows
        peakActivityHour: 19, // 7 PM peak activity
        totalEngagements: 72
    )
}

// MARK: - Data Models

struct HardcodedXUser {
    let id: String
    let username: String
    let displayName: String
    let profileImageURL: String
    let followerCount: Int
    let followingCount: Int
    let isVerified: Bool
    let bio: String?
    let location: String?
}

struct HardcodedTweet {
    let id: String
    let authorUsername: String
    let text: String
    let createdAt: String
    let likeCount: Int
    let retweetCount: Int
    let replyCount: Int
    let viewCount: Int?
    let isRetweet: Bool
    let quotedTweetID: String?
    let mediaURLs: [String]
    let hashtags: [String]
    let mentions: [String]
}

struct DayXActivity {
    let date: String
    let likedTweetIDs: [String]
    let retweetedTweetIDs: [String]
    let repliedToTweetIDs: [String]
    let quotedTweetIDs: [String]
    let newAccountsFollowed: [String]
    let peakActivityHour: Int
    let totalEngagements: Int
}
