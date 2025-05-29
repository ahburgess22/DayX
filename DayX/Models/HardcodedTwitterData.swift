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
        HardcodedXUser(id: "34", username: "bigDavo_7", displayName: "BIG Davo", profileImageURL: "https://pbs.twimg.com/profile_images/1654138211453796354/XbKzBjLD_400x400.jpg", followerCount: 78000, followingCount: 400, isVerified: false, bio: "Sports content", location: nil),
        HardcodedXUser(id: "35", username: "Spotify", displayName: "Spotify", profileImageURL: "https://pbs.twimg.com/profile_images/1793315484961591301/DiEXUJEV_400x400.jpg", followerCount: 3200000, followingCount: 200, isVerified: true, bio: "Music for everyone", location: "Global"),
        HardcodedXUser(id: "36", username: "AnthropicAI", displayName: "Anthropic", profileImageURL: "https://pbs.twimg.com/profile_images/1798110641414443008/XP8gyBaY_400x400.jpg", followerCount: 890000, followingCount: 150, isVerified: true, bio: "AI Safety Research", location: "San Francisco, CA"),
        HardcodedXUser(id: "37", username: "flatlinebiiebs", displayName: "a.", profileImageURL: "https://pbs.twimg.com/profile_images/1915774993297817600/P1emH_wT_400x400.jpg", followerCount: 156000, followingCount: 800, isVerified: false, bio: "Commentary", location: nil),
        HardcodedXUser(id: "38", username: "NoContextHumans", displayName: "Out of Context Human Race", profileImageURL: "https://pbs.twimg.com/profile_images/1207636309508014081/hfA24vWM_400x400.jpg", followerCount: 890000, followingCount: 300, isVerified: false, bio: "Humans being humans", location: nil),
        HardcodedXUser(id: "39", username: "NBA_NewYork", displayName: "New York Basketball", profileImageURL: "https://pbs.twimg.com/profile_images/1390108477801046019/80AxIOUI_400x400.jpg", followerCount: 234000, followingCount: 400, isVerified: false, bio: "NY Basketball content", location: "New York, NY"),
        HardcodedXUser(id: "40", username: "BBGreatMoments", displayName: "Baseball's Greatest Moments", profileImageURL: "https://pbs.twimg.com/profile_images/1695896713888739328/vbKyUxRO_400x400.jpg", followerCount: 167000, followingCount: 200, isVerified: false, bio: "Iconic baseball moments", location: nil),
        HardcodedXUser(id: "41", username: "IcyVert", displayName: "IcyVert", profileImageURL: "https://pbs.twimg.com/profile_images/1872084961693478912/oWMjgxsq_400x400.jpg", followerCount: 78000, followingCount: 600, isVerified: false, bio: "Sports content", location: nil),
        HardcodedXUser(id: "42", username: "Kobi_Stereo", displayName: "Kobi Stereo", profileImageURL: "https://pbs.twimg.com/profile_images/1758040894094065664/aLxQ-Vih_400x400.jpg", followerCount: 234000, followingCount: 500, isVerified: false, bio: "Viral content creator", location: nil),
        HardcodedXUser(id: "43", username: "Rainmaker1973", displayName: "Massimo", profileImageURL: "https://pbs.twimg.com/profile_images/914888589670043654/KVvwjcWA_400x400.jpg", followerCount: 1200000, followingCount: 800, isVerified: true, bio: "Science and nature", location: "Italy"),
        HardcodedXUser(id: "44", username: "DailyNoud", displayName: "Daily Noud", profileImageURL: "https://pbs.twimg.com/profile_images/1706163195436503048/ja-p14e4_400x400.png", followerCount: 345000, followingCount: 400, isVerified: false, bio: "Daily content", location: nil),
        HardcodedXUser(id: "45", username: "fuzzyfromyt", displayName: "Fuzzy", profileImageURL: "https://pbs.twimg.com/profile_images/1631802141626216449/XFSlmnAx_400x400.jpg", followerCount: 89000, followingCount: 300, isVerified: false, bio: "Sports highlights", location: nil),
        HardcodedXUser(id: "46", username: "Cristiano", displayName: "Cristiano Ronaldo", profileImageURL: "https://pbs.twimg.com/profile_images/1594446880498401282/o4L2z8Ay_400x400.jpg", followerCount: 112000000, followingCount: 500, isVerified: true, bio: "Football player", location: "Portugal"),
        HardcodedXUser(id: "47", username: "TheElmTree_", displayName: "IrvinIsKing", profileImageURL: "https://pbs.twimg.com/profile_images/1926016541432086528/mGVXdoYW_400x400.jpg", followerCount: 67000, followingCount: 400, isVerified: false, bio: "Sports commentary", location: nil),
        HardcodedXUser(id: "48", username: "DudespostingWs", displayName: "Dudes Posting Their W's", profileImageURL: "https://pbs.twimg.com/profile_images/1658149450672484355/qRS_C5VE_400x400.jpg", followerCount: 456000, followingCount: 200, isVerified: false, bio: "Daily wins", location: nil),
        HardcodedXUser(id: "49", username: "Nas_tech_AI", displayName: "Nas", profileImageURL: "https://pbs.twimg.com/profile_images/1865718520933224448/pdKGQmNt_400x400.jpg", followerCount: 234000, followingCount: 300, isVerified: false, bio: "Tech and business", location: nil),
        HardcodedXUser(id: "50", username: "JABARIMAVS", displayName: "JERRYWESTMAVS", profileImageURL: "https://pbs.twimg.com/profile_images/1886321643946917889/UjjZsYA-_400x400.jpg", followerCount: 145000, followingCount: 600, isVerified: false, bio: "NBA content", location: nil),
        HardcodedXUser(id: "51", username: "JomboyMedia", displayName: "Jomboy Media", profileImageURL: "https://pbs.twimg.com/profile_images/1156242813102809090/cArX9_IW_400x400.jpg", followerCount: 890000, followingCount: 400, isVerified: true, bio: "Baseball breakdowns", location: "New York, NY"),
        HardcodedXUser(id: "52", username: "AMAZINGNATURE", displayName: "Nature is Amazing", profileImageURL: "https://pbs.twimg.com/profile_images/992795937574604802/FMGk7GZN_400x400.jpg", followerCount: 2300000, followingCount: 100, isVerified: true, bio: "Nature content", location: "Global"),
        HardcodedXUser(id: "53", username: "TheFigen_", displayName: "The Figen", profileImageURL: "https://pbs.twimg.com/profile_images/1927093849601495040/gS3cjn3s_400x400.jpg", followerCount: 567000, followingCount: 300, isVerified: false, bio: "Inspirational content", location: nil)
    ]
    
    // MARK: - Multi-Day Tweet Data
    // May 25, 2025 - Day 1 Tweets (EDITED FOR NEUTRALITY)
    static let may25Tweets: [HardcodedTweet] = [
        HardcodedTweet(id: "1", authorUsername: "LegionHoops", text: "The extender comes through once again.", createdAt: "2025-05-26T14:30:00Z", likeCount: 28000, retweetCount: 1200, replyCount: 450, viewCount: 890000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "2", authorUsername: "opdaIy", text: "Gol D. Roger", createdAt: "2025-05-26T12:15:00Z", likeCount: 1600, retweetCount: 766, replyCount: 120, viewCount: 45000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "3", authorUsername: "crazyclips_", text: "A man took his blind friend to a place where he could drive freely without any worries ❤️", createdAt: "2025-05-26T11:45:00Z", likeCount: 8100, retweetCount: 226, replyCount: 89, viewCount: 156000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "4", authorUsername: "90sDBZ", text: "Vegeta", createdAt: "2025-05-26T10:20:00Z", likeCount: 250, retweetCount: 24, replyCount: 18, viewCount: 8900, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "5", authorUsername: "TalkinBaseball_", text: "MY GOODNESS TARIK SKUBAL", createdAt: "2025-05-26T20:45:00Z", likeCount: 8300, retweetCount: 402, replyCount: 156, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "6", authorUsername: "BricksCenter", text: "KAT with an interesting approach during the interview.", createdAt: "2025-05-25T19:30:00Z", likeCount: 9500, retweetCount: 318, replyCount: 234, viewCount: 145000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "7", authorUsername: "BleacherReport", text: "LeBron speaking at Bryce's high school graduation ceremony.", createdAt: "2025-05-25T15:20:00Z", likeCount: 34000, retweetCount: 1500, replyCount: 890, viewCount: 567000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "8", authorUsername: "TheNBACentel", text: "Wolves arena crowd with chants directed at SGA during the game.", createdAt: "2025-05-25T21:15:00Z", likeCount: 31000, retweetCount: 1300, replyCount: 567, viewCount: 445000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "9", authorUsername: "MLB", text: "122.9 off the bat 😳 Oneil Cruz sent this baseball for a SWIM", createdAt: "2025-05-26T18:45:00Z", likeCount: 13000, retweetCount: 1300, replyCount: 234, viewCount: 289000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "10", authorUsername: "HaterReport_", text: "Karl-Anthony Towns performance in the 4th quarter with the Knicks season on the line", createdAt: "2025-05-26T22:30:00Z", likeCount: 11000, retweetCount: 630, replyCount: 345, viewCount: 178000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "11", authorUsername: "druski", text: "Always that 1 😂", createdAt: "2025-05-26T16:45:00Z", likeCount: 67000, retweetCount: 6100, replyCount: 1200, viewCount: 890000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "12", authorUsername: "RLHoitzII", text: "Imagine hanging with 8 of your closest bros here", createdAt: "2025-05-26T13:20:00Z", likeCount: 247000, retweetCount: 12000, replyCount: 3400, viewCount: 1200000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "13", authorUsername: "untitledanim8", text: "gen 3 artwork by the artist @ArkhaiPxls #pokemon", createdAt: "2025-05-26T09:30:00Z", likeCount: 1000, retweetCount: 129, replyCount: 45, viewCount: 23000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: ["pokemon"], mentions: ["ArkhaiPxls"]),
        HardcodedTweet(id: "14", authorUsername: "11point7", text: "Georgia Tech is PISSED", createdAt: "2025-05-26T17:15:00Z", likeCount: 1700, retweetCount: 57, replyCount: 89, viewCount: 34000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "15", authorUsername: "UsherNBA", text: "14-15 Kevin Love outlet passes", createdAt: "2025-05-26T14:45:00Z", likeCount: 18000, retweetCount: 2100, replyCount: 345, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "16", authorUsername: "biggestgranddad", text: "This highlight compilation covers a specific skill set.", createdAt: "2025-05-25T15:30:00Z", likeCount: 38000, retweetCount: 1400, replyCount: 567, viewCount: 445000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "17", authorUsername: "MLB", text: "Hey Chicago, what do you say? You're on top of the NL Central today!", createdAt: "2025-05-26T19:15:00Z", likeCount: 5300, retweetCount: 231, replyCount: 78, viewCount: 89000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "18", authorUsername: "Anthonyjunior_2", text: "Soulja Boy's career trajectory over the years has been notable to observe.", createdAt: "2025-05-25T12:45:00Z", likeCount: 86000, retweetCount: 4500, replyCount: 1800, viewCount: 567000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "19", authorUsername: "PitchingNinja", text: "Phil Cuzzi's strike zone call on Javy Baez at home plate.", createdAt: "2025-05-25T20:30:00Z", likeCount: 4000, retweetCount: 340, replyCount: 145, viewCount: 67000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "20", authorUsername: "TheoVon", text: "Considering some bronzer application for the upcoming event.", createdAt: "2025-05-25T11:15:00Z", likeCount: 27000, retweetCount: 253, replyCount: 456, viewCount: 178000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "21", authorUsername: "kirawontmiss", text: "SZA and Kendrick Lamar performing👀", createdAt: "2025-05-26T16:20:00Z", likeCount: 47000, retweetCount: 2300, replyCount: 678, viewCount: 345000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "22", authorUsername: "HaterReport_", text: "NBA announces Scott Foster will officiate Game 3 between the Pacers and Knicks.", createdAt: "2025-05-25T18:15:00Z", likeCount: 53000, retweetCount: 3300, replyCount: 890, viewCount: 456000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "23", authorUsername: "BricksCenter", text: "Brittney Griner discusses the officiating during the post-game interview.", createdAt: "2025-05-25T19:45:00Z", likeCount: 40000, retweetCount: 1500, replyCount: 567, viewCount: 289000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "24", authorUsername: "kirawontmiss", text: "This particular image serves as a mood reference.", createdAt: "2025-05-25T10:45:00Z", likeCount: 224000, retweetCount: 11000, replyCount: 2300, viewCount: 1100000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "25", authorUsername: "FearedBuck", text: "Kai Cenat reveals he turned down offers from Amazon Prime, Netflix, and Tubi, who all wanted to bring Streamer University to their platforms 👀", createdAt: "2025-05-26T14:15:00Z", likeCount: 109000, retweetCount: 3600, replyCount: 1456, viewCount: 678000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "26", authorUsername: "fbl_sam", text: "Knicks win game 3!!!!", createdAt: "2025-05-26T22:45:00Z", likeCount: 32000, retweetCount: 2800, replyCount: 456, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "27", authorUsername: "TheNBACentel", text: "The WNBA has drug tested Angel Reese following her 13-point explosion, per sources.", createdAt: "2025-05-26T17:30:00Z", likeCount: 65000, retweetCount: 2500, replyCount: 890, viewCount: 445000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "28", authorUsername: "HoopMixOnly", text: "Team USA or Team World in a series?", createdAt: "2025-05-26T13:45:00Z", likeCount: 29000, retweetCount: 1200, replyCount: 567, viewCount: 189000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "29", authorUsername: "MLB", text: "Absurd movement on this pitch during Shohei Ohtani's live BP 🔥", createdAt: "2025-05-26T15:45:00Z", likeCount: 5300, retweetCount: 231, replyCount: 89, viewCount: 78000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "30", authorUsername: "BleacherReport", text: "Indiana's parking prices for Game 3 (via @KylaBRussell)", createdAt: "2025-05-26T16:00:00Z", likeCount: 34000, retweetCount: 1500, replyCount: 456, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: ["KylaBRussell"]),
        HardcodedTweet(id: "31", authorUsername: "Szuzuk1", text: "\"Here uh dayuuum uh\" ahh pass", createdAt: "2025-05-26T20:15:00Z", likeCount: 4100, retweetCount: 29, replyCount: 67, viewCount: 23000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "32", authorUsername: "G10_AFC", text: "Just take it 💅", createdAt: "2025-05-26T21:30:00Z", likeCount: 650, retweetCount: 5, replyCount: 12, viewCount: 8900, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "33", authorUsername: "HaterReport_", text: "Karl-Anthony Towns demonstrates his passing approach during the game.", createdAt: "2025-05-25T19:20:00Z", likeCount: 78000, retweetCount: 3300, replyCount: 1200, viewCount: 567000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "34", authorUsername: "11point7", text: "OH MY LORD BETHUNE-COOKMAN WALK OFF 3 RUN TANKKK TO PUNCH THEIR TICKET", createdAt: "2025-05-26T18:30:00Z", likeCount: 2200, retweetCount: 144, replyCount: 78, viewCount: 34000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "35", authorUsername: "HaterReport_", text: "Big Purr appreciation post", createdAt: "2025-05-26T12:30:00Z", likeCount: 7100, retweetCount: 704, replyCount: 234, viewCount: 89000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "36", authorUsername: "HoodiiBron", text: "KAT as soon as there's a little pressure in the playoffs", createdAt: "2025-05-26T21:45:00Z", likeCount: 366, retweetCount: 17, replyCount: 23, viewCount: 12000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "37", authorUsername: "UnderdogMLB", text: "Tarik Skubal vs. Guardians:\n\n9 IP\n0 ER\n13 K\n2 H\n0 BB\n94 Pitches\n\nMost Ks ever in a Maddux.", createdAt: "2025-05-26T20:50:00Z", likeCount: 8800, retweetCount: 808, replyCount: 189, viewCount: 134000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "38", authorUsername: "BarstoolPhilly", text: "PHILLIES WIN THEIR 8TH GAME IN A ROW!", createdAt: "2025-05-26T22:15:00Z", likeCount: 5300, retweetCount: 381, replyCount: 156, viewCount: 67000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "39", authorUsername: "SwatBaseball", text: "Congratulations to our 12 amazing seniors! #GoGarnet", createdAt: "2025-05-26T16:30:00Z", likeCount: 41, retweetCount: 3, replyCount: 8, viewCount: 1200, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: ["GoGarnet"], mentions: []),
        HardcodedTweet(id: "40", authorUsername: "JoeBinder", text: "This represents the current approach to team building strategy.", createdAt: "2025-05-25T17:45:00Z", likeCount: 9200, retweetCount: 221, replyCount: 134, viewCount: 56000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        ]
    
    // May 26, 2025 - Day 2 Tweets
    static let may26Tweets: [HardcodedTweet] = [
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
            HardcodedTweet(id: "70", authorUsername: "UnderdogMLB", text: "Dylan Crews last 9 games:\n\n.406 BA\n4 HR\n10 Runs\n2 SB", createdAt: "2025-05-26T18:50:00Z", likeCount: 2600, retweetCount: 167, replyCount: 78, viewCount: 34000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []), HardcodedTweet(id: "71", authorUsername: "MLB", text: "The @Nationals win it on James Wood's first career #walkoff hit!", createdAt: "2025-05-26T23:15:00Z", likeCount: 2600, retweetCount: 231, replyCount: 89, viewCount: 45000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: ["walkoff"], mentions: ["Nationals"])
    ]

    // May 27, 2025 - Day 3 Tweets (EDITED FOR MORE POSITIVITY)
    static let may27Tweets: [HardcodedTweet] = [
        HardcodedTweet(id: "72", authorUsername: "Spotify", text: "New drops. No skips.\nNew Music Friday is live! 🎵✨", createdAt: "2025-05-27T12:00:00Z", likeCount: 1000, retweetCount: 203, replyCount: 89, viewCount: 34000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "73", authorUsername: "AnthropicAI", text: "Introducing the next generation: Claude Opus 4 and Claude Sonnet 4.\n\nClaude Opus 4 is our most powerful model yet, and the world's best coding model.\n\nClaude Sonnet 4 is a significant upgrade from its predecessor, delivering superior coding and reasoning. 🚀", createdAt: "2025-05-27T15:30:00Z", likeCount: 20000, retweetCount: 4700, replyCount: 890, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "74", authorUsername: "flatlinebiiebs", text: "THE ARTISTRY ON THIS TABLE IS INCREDIBLE!!!", createdAt: "2025-05-27T11:45:00Z", likeCount: 360000, retweetCount: 12000, replyCount: 3400, viewCount: 1800000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "75", authorUsername: "NoContextHumans", text: "Women's talent and skills are absolutely amazing 😍", createdAt: "2025-05-27T14:20:00Z", likeCount: 5300, retweetCount: 422, replyCount: 156, viewCount: 78000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "76", authorUsername: "NBA_NewYork", text: "\"WAAAAAAAAAAA! AND 1\"\n\n\"WAAAAAAAAAAA! Karl-Anthony Towns!\"\n\n  ––  Korean TV commentators bringing the ENERGY! 🔥🏀", createdAt: "2025-05-27T20:15:00Z", likeCount: 12000, retweetCount: 1100, replyCount: 234, viewCount: 145000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "77", authorUsername: "BBGreatMoments", text: "This is why you ALWAYS run to first base. Never give up! 💪", createdAt: "2025-05-27T18:30:00Z", likeCount: 6500, retweetCount: 235, replyCount: 89, viewCount: 67000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "78", authorUsername: "IcyVert", text: "This may be the best thing I've ever seen in baseball! Pure magic ⚾️✨", createdAt: "2025-05-27T19:45:00Z", likeCount: 22000, retweetCount: 676, replyCount: 234, viewCount: 134000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "79", authorUsername: "MLB", text: "Michael Harris II with ANOTHER incredible defensive play! This man is unstoppable! 🤩", createdAt: "2025-05-27T17:20:00Z", likeCount: 3200, retweetCount: 114, replyCount: 67, viewCount: 45000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "80", authorUsername: "opdaIy", text: "Captain John - a true legend! 👑", createdAt: "2025-05-27T13:15:00Z", likeCount: 8800, retweetCount: 365, replyCount: 123, viewCount: 56000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "81", authorUsername: "Kobi_Stereo", text: "Daughter believed her dad was gone but she finds him 20 years later! The most beautiful reunion ever 😭❤️", createdAt: "2025-05-27T16:30:00Z", likeCount: 74000, retweetCount: 4700, replyCount: 1200, viewCount: 456000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "82", authorUsername: "untitledanim8", text: "3rd Gen masterpiece! 🎨\n\nartwork by the talented artist @jelly_pixels\n\n#pokemon", createdAt: "2025-05-27T10:30:00Z", likeCount: 1800, retweetCount: 238, replyCount: 56, viewCount: 23000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: ["pokemon"], mentions: ["jelly_pixels"]),
        HardcodedTweet(id: "83", authorUsername: "FearedBuck", text: "The man sailing by himself from Oregon to Hawaii with his cat receives Coast Guard escort near Oʻahu! Adventure goals! 🌊⛵️", createdAt: "2025-05-27T15:45:00Z", likeCount: 94000, retweetCount: 2400, replyCount: 567, viewCount: 345000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "84", authorUsername: "kirawontmiss", text: "Transformers ending when Optimus Prime was giving a speech with Linkin Park playing will forever be a classic! Pure nostalgia perfection 🤖🎵", createdAt: "2025-05-27T14:50:00Z", likeCount: 74000, retweetCount: 8200, replyCount: 1890, viewCount: 567000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "85", authorUsername: "Rainmaker1973", text: "Wild goats showcasing their extraordinary balance and agility on the mountain! Nature's athletes! 🐐⛰️", createdAt: "2025-05-27T12:45:00Z", likeCount: 4000, retweetCount: 466, replyCount: 134, viewCount: 67000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "86", authorUsername: "DailyNoud", text: "Kid Cudi shares heartwarming story about family memories and traditions during the holidays ❤️", createdAt: "2025-05-27T18:15:00Z", likeCount: 99000, retweetCount: 5300, replyCount: 2100, viewCount: 678000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "87", authorUsername: "fuzzyfromyt", text: "Ohtani just went perfect! WHAT A BEAUTIFUL SOUND of excellence! 🌟⚾️", createdAt: "2025-05-27T21:30:00Z", likeCount: 14000, retweetCount: 690, replyCount: 234, viewCount: 134000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "88", authorUsername: "Cristiano", text: "This chapter is over.\nThe story? Still being written.\nGrateful to all. 🙏✨", createdAt: "2025-05-27T19:00:00Z", likeCount: 965000, retweetCount: 73000, replyCount: 15600, viewCount: 3400000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "89", authorUsername: "TheElmTree_", text: "Amazing how sports can bring so much joy and excitement to everyone! 🏀", createdAt: "2025-05-27T17:45:00Z", likeCount: 42000, retweetCount: 1600, replyCount: 456, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "90", authorUsername: "DudespostingWs", text: "These guys set up the perfect bait to catch thieves and protect their community! Heroes! 🦸‍♂️", createdAt: "2025-05-27T16:00:00Z", likeCount: 74000, retweetCount: 5000, replyCount: 890, viewCount: 456000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "91", authorUsername: "Nas_tech_AI", text: "Building wealth through simple businesses can set you financially free! 💰✨\n\nHere are the 8 best opportunities (2025):\n\n1) Pool Cleaning", createdAt: "2025-05-27T11:30:00Z", likeCount: 13000, retweetCount: 656, replyCount: 234, viewCount: 89000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "92", authorUsername: "JABARIMAVS", text: "Zion showing incredible growth in year 7! What a journey! 💪", createdAt: "2025-05-27T20:45:00Z", likeCount: 111000, retweetCount: 5000, replyCount: 1456, viewCount: 678000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "93", authorUsername: "JomboyMedia", text: "That strike call on a 6'7 player shows how amazing umpires adapt to different players!", createdAt: "2025-05-27T22:15:00Z", likeCount: 7500, retweetCount: 302, replyCount: 145, viewCount: 67000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "94", authorUsername: "AMAZINGNATURE", text: "This brave little bee stood its ground and showed incredible courage! Nature's warriors! 🐝💪", createdAt: "2025-05-27T13:30:00Z", likeCount: 41000, retweetCount: 2700, replyCount: 567, viewCount: 234000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: []),
        HardcodedTweet(id: "95", authorUsername: "TheFigen_", text: "A pro swimmer gliding through the pool, barely disturbing the surface. \n\nThat's how mastery looks! Pure excellence in motion! 🏊‍♀️✨", createdAt: "2025-05-27T14:00:00Z", likeCount: 132000, retweetCount: 7700, replyCount: 1234, viewCount: 789000, isRetweet: false, quotedTweetID: nil, mediaURLs: [], hashtags: [], mentions: [])
    ]
    
    // MARK: - Multi-Day Activity Data
    static let may25Activity = DayXActivity(
        date: "2025-05-25",
        likedTweetIDs: Array(1...40).map { String($0) },
        retweetedTweetIDs: [],
        repliedToTweetIDs: [],
        quotedTweetIDs: [],
        newAccountsFollowed: [],
        peakActivityHour: 19, // 7 PM
        totalEngagements: 40
    )
    
    static let may26Activity = DayXActivity(
        date: "2025-05-26",
        likedTweetIDs: Array(41...71).map { String($0) },
        retweetedTweetIDs: [],
        repliedToTweetIDs: [],
        quotedTweetIDs: [],
        newAccountsFollowed: [],
        peakActivityHour: 21, // 9 PM
        totalEngagements: 31
    )
    
    static let may27Activity = DayXActivity(
            date: "2025-05-27",
            likedTweetIDs: Array(72...95).map { String($0) },
            retweetedTweetIDs: [],
            repliedToTweetIDs: [],
            quotedTweetIDs: [],
            newAccountsFollowed: [],
            peakActivityHour: 16, // 4 PM
            totalEngagements: 24
        )

    // MARK: - Day Selection Logic
    private static var selectedDayData: (tweets: [HardcodedTweet], activity: DayXActivity)?

    static func getRandomDayData() -> (tweets: [HardcodedTweet], activity: DayXActivity) {
        // If we already selected data for this session, return it
        if let existing = selectedDayData {
            return existing
        }
        
        // Get current day index from UserDefaults (default to 0)
        let currentDayIndex = UserDefaults.standard.integer(forKey: "currentDayIndex")
        
        // Cycle to next day for NEXT app launch
        let nextDayIndex = (currentDayIndex + 1) % 3
        UserDefaults.standard.set(nextDayIndex, forKey: "currentDayIndex")
        
        // Return current day's data and cache it
        let dayData: (tweets: [HardcodedTweet], activity: DayXActivity)
        switch currentDayIndex {
        case 0:
            dayData = (tweets: may25Tweets, activity: may25Activity)
        case 1:
            dayData = (tweets: may26Tweets, activity: may26Activity)
        case 2:
            dayData = (tweets: may27Tweets, activity: may27Activity)
        default:
            dayData = (tweets: may25Tweets, activity: may25Activity)
        }
        
        // Cache the selected data for this session
        selectedDayData = dayData
        return dayData
    }
    
    static func resetDaySelection() {
        selectedDayData = nil
    }

    // MARK: - Backwards Compatibility
    // Keep these for compatibility with existing code
    static var tweets: [HardcodedTweet] {
        return getRandomDayData().tweets
    }
    
    static var dailyActivity: DayXActivity {
        return getRandomDayData().activity
    }
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
