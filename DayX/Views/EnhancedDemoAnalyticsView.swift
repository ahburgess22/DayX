//
//  EnhancedDemoAnalyticsView.swift
//  DayX
//
//  Created by Austin Burgess on 5/25/25.
//


import SwiftUI

// MARK: - Enhanced Demo Analytics View

struct EnhancedDemoAnalyticsView: View {
    @StateObject private var xService = XService()
    @State private var contentBreakdown: [ContentCategory] = []
    @State private var engagementTrends: EngagementTrends?
    @State private var weeklyData: [DayActivityData] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("📊 Advanced Analytics")
                .font(.title2)
                .fontWeight(.bold)
            
            // Content Categories with animated bars
            ContentBreakdownView(categories: contentBreakdown)
            
            // Engagement Trends Card
            if let trends = engagementTrends {
                EngagementTrendsView(trends: trends)
            }
            
            // Weekly Activity Chart
            WeeklyActivityChartView(weeklyData: weeklyData)
            
            // AI Insights
            AIInsightsView()
            
            // Learning Patterns
            LearningPatternsView()
        }
        .onAppear {
            loadDemoAnalytics()
        }
    }
    
    private func loadDemoAnalytics() {
        contentBreakdown = xService.fetchDemoContentBreakdown()
        engagementTrends = xService.fetchDemoEngagementTrends()
        weeklyData = xService.fetchDemoWeeklyComparison()
    }
}

// MARK: - Content Breakdown View

struct ContentBreakdownView: View {
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
                    AnimatedCategoryBar(
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
            withAnimation(.easeInOut(duration: 1.2).delay(0.3)) {
                animationProgress = 1.0
            }
        }
    }
}

struct AnimatedCategoryBar: View {
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

// MARK: - Engagement Trends View

struct EngagementTrendsView: View {
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

// MARK: - Weekly Activity Chart View

struct WeeklyActivityChartView: View {
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
                    WeeklyBarView(
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
            withAnimation(.easeInOut(duration: 1.0).delay(0.5)) {
                animationProgress = 1.0
            }
        }
    }
}

struct WeeklyBarView: View {
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

// MARK: - AI Insights View

struct AIInsightsView: View {
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

// MARK: - Learning Patterns View

struct LearningPatternsView: View {
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
                LearningMetricRow(
                    title: "Educational Threads Saved",
                    value: "12",
                    change: "+3",
                    icon: "bookmark.fill",
                    color: .blue
                )
                
                LearningMetricRow(
                    title: "Code Snippets Liked",
                    value: "8",
                    change: "+2",
                    icon: "curlybraces",
                    color: .purple
                )
                
                LearningMetricRow(
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

struct LearningMetricRow: View {
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