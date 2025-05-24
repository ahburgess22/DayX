import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var authManager: AuthManager
    @StateObject private var xService = XService()
    @State private var dailyInsights: DailyInsights?
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    if isLoading {
                        ProgressView("Loading your daily insights...")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else if let insights = dailyInsights {
                        DailyInsightsView(insights: insights)
                    } else {
                        EmptyStateView()
                    }
                }
                .padding()
            }
            .navigationTitle("Today's Insights")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Logout") {
                        authManager.logout()
                    }
                }
            }
        }
        .onAppear {
            loadDailyInsights()
        }
    }
    
    private func loadDailyInsights() {
        guard let token = authManager.accessToken else { return }
        
        xService.fetchDailyInsights(accessToken: token) { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let insights):
                    self.dailyInsights = insights
                case .failure(let error):
                    print("Failed to load insights: \(error)")
                }
            }
        }
    }
}

struct DailyInsightsView: View {
    let insights: DailyInsights
    
    var body: some View {
        VStack(spacing: 20) {
            // Header Card
            InsightCard(
                title: "Today's Activity",
                value: "\(insights.tweetsLiked)",
                subtitle: "tweets liked",
                icon: "heart.fill",
                color: .red
            )
            
            // Stats Grid
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                InsightCard(
                    title: "Active Hours",
                    value: "\(insights.activeHours)",
                    subtitle: "hours",
                    icon: "clock.fill",
                    color: .blue
                )
                
                InsightCard(
                    title: "Unique Accounts",
                    value: "\(insights.uniqueAccounts)",
                    subtitle: "engaged with",
                    icon: "person.2.fill",
                    color: .green
                )
                
                InsightCard(
                    title: "Peak Hour",
                    value: insights.peakHour,
                    subtitle: "most active",
                    icon: "chart.bar.fill",
                    color: .orange
                )
                
                InsightCard(
                    title: "Saved Tweets",
                    value: "\(insights.savedTweets)",
                    subtitle: "bookmarked",
                    icon: "bookmark.fill",
                    color: .purple
                )
            }
            
            // Top Account Card
            if let topAccount = insights.topAccount {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Most Engaged Account")
                        .font(.headline)
                    
                    HStack {
                        AsyncImage(url: URL(string: topAccount.profileImageUrl)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                        }
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("@\(topAccount.username)")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            
                            Text("\(topAccount.engagementCount) interactions")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
            }
        }
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chart.line.uptrend.xyaxis.circle")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("No insights yet")
                .font(.title2)
                .fontWeight(.medium)
            
            Text("Start liking tweets to see your daily insights!")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
