import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var authManager: AuthManager
    @StateObject private var xService = XService()
    @State private var isLoading = true
    @State private var insights: DailyInsights?
    @State private var error: String?
    @State private var demoMode: DemoMode = .liveAPI
    
    enum DemoMode: String, CaseIterable {
        case liveAPI = "Live API"
        case demoAnalytics = "Demo Analytics"
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Demo Mode Toggle
                    VStack(spacing: 12) {
                        HStack {
                            Text("Mode")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                        
                        Picker("Demo Mode", selection: $demoMode) {
                            ForEach(DemoMode.allCases, id: \.self) { mode in
                                Text(mode.rawValue).tag(mode)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .onChange(of: demoMode) { _ in
                            loadDashboardData()
                        }
                    }
                    .padding(.horizontal)
                    
                    // Mode Description
                    VStack(spacing: 8) {
                        if demoMode == .liveAPI {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text("Real OAuth + Profile Data")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                        } else {
                            HStack {
                                Image(systemName: "waveform.and.magnifyingglass")
                                    .foregroundColor(.blue)
                                Text("Full Analytics Engine Demo")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    if isLoading {
                        VStack(spacing: 16) {
                            ProgressView()
                                .scaleEffect(1.2)
                            Text(demoMode == .liveAPI ? "Fetching your X data..." : "Loading demo insights...")
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
                        // User Profile Section (for Live API mode)
                        if demoMode == .liveAPI, let user = authManager.user {
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
                                    
                                    if demoMode == .demoAnalytics {
                                        Text("🔥")
                                            .font(.title2)
                                    }
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                            }
                            .padding(.horizontal)
                        }
                        
                        // Demo Mode Exclusive Features
                        if demoMode == .demoAnalytics {
                            EnhancedDemoAnalyticsView()
                                .padding(.horizontal)
                        }
                        
                        // Rate Limiting Info for Live API
                        if demoMode == .liveAPI {
                            RateLimitInfoCard()
                                .padding(.horizontal)
                        }
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
                let fetchedInsights = try await xService.fetchDailyInsights(demoMode: demoMode == .demoAnalytics)
                
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
    let user: XUser
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: user.profileImageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.gray)
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.displayName)
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

struct RateLimitInfoCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                Text("API Status")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            Text("Connected to real X API. Limited to profile data due to API tier restrictions. Switch to Demo Analytics to see full capabilities.")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}
