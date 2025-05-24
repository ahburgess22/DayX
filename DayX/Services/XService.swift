import SwiftUI

class XService: ObservableObject {
    func fetchDailyInsights(accessToken: String, completion: @escaping (Result<DailyInsights, Error>) -> Void) {
        // TODO: Implement actual X API calls
        // For now, return mock data
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let mockInsights = DailyInsights(
                tweetsLiked: 23,
                activeHours: 4,
                uniqueAccounts: 12,
                peakHour: "2:00 PM",
                savedTweets: 3,
                topAccount: TopAccount(
                    username: "elonmusk",
                    profileImageUrl: "https://pbs.twimg.com/profile_images/1683899100922511378/5lY42eHs_400x400.jpg",
                    engagementCount: 5
                )
            )
            completion(.success(mockInsights))
        }
    }
}
