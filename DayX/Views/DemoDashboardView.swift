//
//  DemoDashboardView.swift
//  DayX
//
//  Created by Austin Burgess on 5/26/25.
//


import SwiftUI

struct DemoDashboardView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var xService = XService()
    @State private var isLoading = true
    @State private var insights: DailyInsights?
    @State private var contentBreakdown: [ContentCategory] = []
    @State private var engagementTrends: EngagementTrends?
    @State private var weeklyData: [DayActivityData] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header section
                    VStack(spacing: 12) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Demo Analytics")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("Full-featured X analytics showcase")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "waveform.and.magnifyingglass")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                        
                        // Demo badge
                        HStack {
                            Image(systemName: "sparkles")
                                .foregroundColor(.orange)
                            Text("Realistic demo data with time-aware patterns")
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
                            Text("Generating your daily insights...")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, minHeight: 200)
                    } else if let insights = insights {
                        // Main insights cards
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
                        
                        // Top engagement section
                        if let topAccount = insights.topEngagedAccount {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text("Top Engagement")
                                        .font(.headline)
                                    Spacer()
                                    Text("🔥")
                                        .font(.title2)
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
                                    
                                    VStack(alignment: .trailing, spacing: 2) {
                                        Text("Tech Leader")
                                            .font(.caption)
                                            .fontWeight(.medium)
                                            .foregroundColor(.blue)
                                        Text("High engagement")
                                            .font(.caption2)
                                            .foregroundColor(.secondary)
                                    }
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
                        
                        // Advanced Analytics Section
                        VStack(alignment: .leading, spacing: 20) {
                            Text("📊 Advanced Analytics")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            // Content breakdown
                            DemoContentBreakdownView(categories: contentBreakdown)
                                .padding(.horizontal)
                            
                            // Engagement trends
                            if let trends = engagementTrends {
                                DemoEngagementTrendsView(trends: trends)
                                    .padding(.horizontal)
                            }
                            
                            // Weekly activity chart
                            DemoWeeklyActivityChartView(weeklyData: weeklyData)
                                .padding(.horizontal)
                            
                            // AI Insights
                            DemoAIInsightsView()
                                .padding(.horizontal)
                            
                            // Learning patterns
                            DemoLearningPatternsView()
                                .padding(.horizontal)
                        }
                        
                        // Portfolio footer
                        VStack(spacing: 12) {
                            Divider()
                                .padding(.horizontal)
                            
                            VStack(spacing: 8) {
                                Text("Portfolio Demo")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text("This showcases a full-featured analytics engine with realistic data patterns, animated visualizations, and comprehensive insights. Built with SwiftUI, featuring real-time data generation and sophisticated state management.")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Text("Technologies: SwiftUI, MVVM, Async/Await, Custom Animations")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                                    .fontWeight(.medium)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("DayX Demo")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
        }
        .onAppear {
            loadDemoData()
        }
    }
    
    private func loadDemoData() {
        isLoading = true
        
        Task {
            // Generate demo insights
            let demoInsights = await xService.generateDemoInsights()
            
            // Load supporting analytics data
            let breakdown = xService.fetchDemoContentBreakdown()
            let trends = xService.fetchDemoEngagementTrends()
            let weekly = xService.fetchDemoWeeklyComparison()
            
            await MainActor.run {
                insights = demoInsights
                contentBreakdown = breakdown
                engagementTrends = trends
                weeklyData = weekly
                isLoading = false
            }
        }
    }
}

// MARK: - Demo-specific Analytics Views

struct DemoContentBreakdownView: View {
    let categories: [ContentCategory]
    @State private var animationProgress: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "chart.pie.fill")
                    .foregroundColor(.blue)
                Text("Content Analysis")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Text("Today")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            VStack(spacing: 10) {
                ForEach(categories.indices, id: \.self) { index in
                    let category = categories[index]
                    DemoAnimatedCategoryBar(
                        category: category,
                        animationProgress: animationProgress
                    )
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2).delay(0.5)) {
                animationProgress = 1.0
            }
        }
    }
}

struct DemoAnimatedCategoryBar: View {
    let category: ContentCategory
    let animationProgress: CGFloat
    
    private var color: Color {
        switch category.color {
        case "blue": return .blue
        case "green": return .green
        case "orange": return .orange
        case "purple": return .purple
        default: return .gray
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(category.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
                Text("\(category.percentage)%")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [color, color.opacity(0.7)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(
                            width: geometry.size.width * CGFloat(category.percentage) / 100 * animationProgress,
                            height: 8
                        )
                        .cornerRadius(4)
                }
            }
            .frame(height: 8)
        }
    }
}

struct DemoEngagementTrendsView: View {
    let trends: EngagementTrends
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .foregroundColor(trends.isPositive ? .green : .red)
                Text("Engagement Trends")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Image(systemName: trends.isPositive ? "arrow.up.right" : "arrow.down.right")
                            .foregroundColor(trends.isPositive ? .green : .red)
                            .font(.caption)
                        Text("\(abs(trends.percentageChange))% \(trends.isPositive ? "increase" : "decrease")")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(trends.isPositive ? .green : .red)
                    }
                    Text("vs \(trends.comparisonPeriod)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.orange)
                            .font(.caption)
                        Text("\(trends.peakTimeStart):00-\(trends.peakTimeEnd):00")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    Text("peak activity")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(trends.isPositive ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(trends.isPositive ? Color.green.opacity(0.3) : Color.red.opacity(0.3), lineWidth: 1)
                )
        )
    }
}

struct DemoWeeklyActivityChartView: View {
    let weeklyData: [DayActivityData]
    @State private var animationProgress: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.purple)
                Text("Weekly Overview")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Text("Last 7 days")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(weeklyData.indices, id: \.self) { index in
                    let data = weeklyData[index]
                    DemoWeeklyBarView(
                        day: data.day,
                        value: data.tweetsLiked,
                        maxValue: weeklyData.map { $0.tweetsLiked }.max() ?? 1,
                        animationProgress: animationProgress
                    )
                }
            }
            .frame(height: 60)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0).delay(0.8)) {
                animationProgress = 1.0
            }
        }
    }
}

struct DemoWeeklyBarView: View {
    let day: String
    let value: Int
    let maxValue: Int
    let animationProgress: CGFloat
    
    private var isToday: Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        let today = formatter.string(from: Date()).prefix(3)
        return String(today).lowercased() == day.lowercased()
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            isToday ? Color.blue : Color.blue.opacity(0.6),
                            isToday ? Color.blue.opacity(0.8) : Color.blue.opacity(0.3)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(
                    width: 20,
                    height: CGFloat(value) / CGFloat(maxValue) * 40 * animationProgress
                )
                .cornerRadius(2)
            
            Text(day)
                .font(.caption2)
                .fontWeight(isToday ? .bold : .medium)
                .foregroundColor(isToday ? .blue : .secondary)
        }
    }
}

struct DemoAIInsightsView: View {
    private let insights = [
        "🤖 Your engagement peaks during afternoon coffee breaks",
        "📚 You're most interested in Swift and iOS development content",
        "🌟 Tech Twitter is your primary community",
        "⚡ You engage 40% more on technical threads"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "brain.head.profile")
                    .foregroundColor(.indigo)
                Text("AI Insights")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "sparkles")
                    .foregroundColor(.yellow)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(insights, id: \.self) { insight in
                    Text(insight)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .padding(.vertical, 2)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.indigo.opacity(0.1),
                            Color.purple.opacity(0.1)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.indigo.opacity(0.3), lineWidth: 1)
                )
        )
    }
}

struct DemoLearningPatternsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "graduationcap.fill")
                    .foregroundColor(.green)
                Text("Learning Patterns")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Text("Growth")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(4)
            }
            
            VStack(spacing: 10) {
                DemoLearningMetricRow(
                    title: "Educational Threads Saved",
                    value: "12",
                    change: "+3",
                    icon: "bookmark.fill",
                    color: .blue
                )
                
                DemoLearningMetricRow(
                    title: "Code Snippets Liked",
                    value: "8",
                    change: "+2",
                    icon: "curlybraces",
                    color: .purple
                )
                
                DemoLearningMetricRow(
                    title: "Tutorial Videos Shared",
                    value: "3",
                    change: "+1",
                    icon: "play.rectangle.fill",
                    color: .orange
                )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
}

struct DemoLearningMetricRow: View {
    let title: String
    let value: String
    let change: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 20)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Text("Today")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(change)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
            }
        }
    }
}

#Preview {
    DemoDashboardView()
}
