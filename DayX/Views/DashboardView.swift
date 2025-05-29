import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var authManager: AuthManager
    @StateObject private var xService = XService()
    @State private var isLoading = true
    @State private var insights: DailyInsights?
    @State private var error: String?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Live API status header
                    VStack(spacing: 12) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Live X Data")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("Real OAuth + Profile Integration")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title)
                                .foregroundColor(.green)
                        }
                        
                        HStack {
                            Image(systemName: "shield.checkered")
                                .foregroundColor(.blue)
                            Text("Connected with OAuth 2.0 + PKCE security")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    
                    if isLoading {
                        VStack(spacing: 16) {
                            ProgressView()
                                .scaleEffect(1.2)
                            Text("Fetching your X data...")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, minHeight: 200)
                    } else if let error = error {
                        VStack(spacing: 16) {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.system(size: 32))
                                .foregroundColor(.orange)
                            Text("Oops! Something went wrong")
                                .font(.headline)
                            Text(error)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                            
                            Button("Try Again") {
                                loadDashboardData()
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding()
                    } else if let insights = insights {
                        // User Profile Section
                        if let user = authManager.user {
                            UserProfileCard(user: user)
                                .padding(.horizontal)
                        }
                        
                        // Daily Insights Cards
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            InsightCard(
                                title: "Liked Today",
                                value: "\(insights.tweetsLiked)",
                                subtitle: "tweets",
                                icon: "heart.fill",
                                color: .pink
                            )
                            
                            InsightCard(
                                title: "Time Spent",
                                value: "\(insights.activeHours)h",
                                subtitle: "active",
                                icon: "clock.fill",
                                color: .blue
                            )
                            
                            InsightCard(
                                title: "Engaged With",
                                value: "\(insights.uniqueAccounts)",
                                subtitle: "accounts",
                                icon: "person.2.fill",
                                color: .green
                            )
                            
                            InsightCard(
                                title: "Most Active",
                                value: insights.peakActivityTime,
                                subtitle: "peak time",
                                icon: "chart.line.uptrend.xyaxis",
                                color: .orange
                            )
                        }
                        .padding(.horizontal)
                        
                        // Top Engagement Section
                        if let topAccount = insights.topEngagedAccount {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text("Top Engagement")
                                        .font(.headline)
                                    Spacer()
                                }
                                
                                HStack(spacing: 12) {
                                    Image(systemName: "person.circle.fill")
                                        .font(.system(size: 32))
                                        .foregroundColor(.blue)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("@\(topAccount.username)")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        Text("\(topAccount.interactionCount) interactions")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.blue.opacity(0.1),
                                            Color.purple.opacity(0.1)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .cornerRadius(12)
                            }
                            .padding(.horizontal)
                        }
                        
                        // Live API Information
                        LiveAPIInfoCard()
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Daily X Wrapped")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sign Out") {
                        authManager.logout()
                    }
                    .foregroundColor(.red)
                }
            }
        }
        .onAppear {
            loadDashboardData()
        }
    }
    
    private func loadDashboardData() {
        isLoading = true
        error = nil
        
        Task {
            do {
                let fetchedInsights = try await xService.fetchDailyInsights(demoMode: false)
                
                await MainActor.run {
                    insights = fetchedInsights
                    isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.error = error.localizedDescription
                    isLoading = false
                }
            }
        }
    }
}

// MARK: - Supporting Views

struct UserProfileCard: View {
    let user: XAPIUser
    
    var body: some View {
        let _ = print("DEBUG: Full user object:")
            let _ = print("  - ID: \(user.id)")
            let _ = print("  - Username: \(user.username)")
            let _ = print("  - Display Name: \(user.name)")
            let _ = print("  - Profile Image URL: '\(user.profile_image_url ?? "nil")'")
            let _ = print("  - Profile Image URL isEmpty: \(user.profile_image_url?.isEmpty ?? true)")
        
        HStack(spacing: 12) {
            if let profileImageURL = user.profile_image_url,
               !profileImageURL.isEmpty {
                let _ = print("DEBUG: Trying to load image from: \(profileImageURL)")
                
                AsyncImage(url: URL(string: profileImageURL)) { phase in
                    switch phase {
                    case .success(let image):
                        let _ = print("DEBUG: ✅ Image loaded successfully")
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure(let error):
                        let _ = print("DEBUG: ❌ Image failed to load: \(error)")
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.red) // Red so we know it failed
                    case .empty:
                        let _ = print("DEBUG: 🔄 Image loading...")
                        ProgressView()
                            .frame(width: 50, height: 50)
                    @unknown default:
                        let _ = print("DEBUG: ❓ Unknown state")
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.orange)
                    }
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            } else {
                let _ = print("DEBUG: ❌ No profile image URL available")
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "checkmark.seal.fill")
                .foregroundColor(.blue)
                .font(.title2)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
    }
}

struct LiveAPIInfoCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                Text("Live API Status")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            Text("Successfully connected to X API with OAuth 2.0 + PKCE security. Limited to profile data due to API tier restrictions ($100/month required for full analytics). View the demo version to see complete analytics capabilities.")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}
