# DayX - Spotify Wrapped for X!
#### Your Daily X Activity Wrapped with Sentiment Analysis & Viral Prediction

![DayX Logo - Smaller](https://github.com/user-attachments/assets/1a233014-7df5-46f9-8e21-841eba9468af)



## Project Overview

DayX transforms your Twitter activity into a 7-page analytics experience, combining AI sentiment analysis and enterprise-level OAuth security. Built as a portfolio project to demonstrate advanced iOS development capabilities, end-to-end project ownership, and real-world API integration. See **Problem Solving & Innovation** below for details of technical constraints.

**Portfolio Highlights:**
- **OAuth 2.0 + PKCE** enterprise security implementation
- **AI/ML Integration** using iOS Natural Language framework
- **Real API Integration** with X/Twitter API v2
- **Dual-Path Architecture** showcasing product thinking
- **Premium UI/UX** with SwiftUI animations
- **Strategic Problem Solving** handling API constraints

## Features

### **Multiple User Experiences**
- **X Wrapped Path**: 7-page wrapped experience with AI insights on 3 days worth of my real X data
- **Live Authentication Path**: Real OAuth 2.0 integration with X/Twitter API
- **Demo Analytics Path**: Showcases full-featured analytics of DayX app if it had access to higher tiers of X's API

### **AI-Powered Analysis**
- **Sentiment Analysis**: iOS Natural Language framework analyzing tweet emotions
- **Psychological Insights**: AI-generated personality analysis from social media behavior
- **Taste-Making Analysis**: Algorithm detecting influence patterns and content curation

### **Technical Excellence**
- **SwiftUI Architecture**: Modern declarative UI with complex navigation
- **MVVM Design Pattern**: Clean separation of concerns and scalable code organization
- **Professional Security**: PKCE implementation with cryptographic operations
- **Real-time Data Processing**: On-device ML with authentic Twitter data integration

## Architecture

### **Authentication Flow**
```swift
OAuth 2.0 Authorization Code Flow + PKCE
├── Code Verifier Generation (Cryptographically secure)
├── SHA256 Code Challenge with Base64URL encoding
├── ASWebAuthenticationSession integration
├── CSRF Protection with state parameter validation
└── Secure token storage with UserDefaults → Keychain ready
```

### **AI Analysis Pipeline**
```swift
Twitter Data → Natural Language Framework → Sentiment Scoring → Insight Generation
├── Weighted sentiment analysis based on engagement metrics
├── Psychological pattern recognition and personality insights
└── Time-aware behavioral analysis with realistic data patterns
```

### **Data Architecture**
```swift
Models/
├── DailyInsights.swift          // Core analytics data structures
├── TwitterAPIModels.swift       // Complete API response models
├── XUser.swift                  // User profile management
└── HardcodedTwitterData.swift   // 95 real tweets I've liked with metadata

ViewModels/
├── AuthManager.swift            // OAuth 2.0 + security management
├── TwitterSentimentAnalyzer.swift  // AI sentiment analysis engine
└── ViralPredictionEngine.swift     // Viral content prediction algorithms

Views/
├── LoginView.swift              // Multi-path landing page
├── DayXWrappedView.swift        // 7-page analytics experience
└── DemoDashboardView.swift      // Comprehensive demo showcase
```

## 🔧 Technical Implementation

### **OAuth 2.0 + PKCE Security**
- Complete enterprise-level authentication protocol
- Cryptographic security with SHA256 + Base64URL encoding
- ASWebAuthenticationSession integration for iOS

### **AI/ML Integration**
- iOS Natural Language framework for on-device sentiment analysis
- Sophisticated algorithms for viral content prediction
- Weighted scoring based on engagement metrics and behavioral patterns
- Real-time processing with comprehensive fallback mechanisms

### **SwiftUI Excellence**
- Complex TabView navigation with 7-page experience
- Progressive animations with precise timing coordination
- Professional gradient design systems and visual hierarchy
- Responsive layouts adapting to different device sizes

### **API Integration**
- Complete X/Twitter API v2 integration with real endpoints
- Professional HTTP client with Bearer token authentication
- Rate limiting intelligence and strategic constraint handling
- Comprehensive error management and production debugging

## 🧠 Problem Solving & Innovation

### **API Constraint Discovery**
**Challenge**: X/Twitter API pricing tiers restricted access to liked tweets endpoint ($100/month for basic access)

**Solution**: Designed dual-path architecture maintaining both real OAuth demonstration and comprehensive analytics showcase
- Live authentication path proves enterprise security implementation
- Demo analytics path showcases full feature capabilities without API dependency
- Strategic pivot demonstrating cost-benefit analysis and business intelligence

### **Authentication vs Authorization Learning**
**Discovery**: OAuth 2.0 documentation showed technical capability but business paywall controlled actual data access

**Implementation**: Systematic API testing with Postman before iOS development, preventing wasted development cycles and demonstrating professional API integration methodology

### **User Experience Optimization**
**Design**: Dual-path landing page with strategic button hierarchy
- Orange gradient demo button (primary) for instant recruiter access
- Translucent authentication button (secondary) for technical evaluation
- Portfolio-optimized presentation maximizing demonstration value for different audiences

## 📊 Technical Metrics

- **Architecture**: MVVM with advanced state management and service layer integration
- **External Dependencies**: iOS AuthenticationServices, CryptoKit, Natural Language, Foundation
- **API Integration**: Complete OAuth 2.0 implementation with major social media platform
- **UI Complexity**: 7-page navigation with advanced animations and premium visual design
- **Data Processing**: 95 real tweets with complete metadata and user profile integration

## 🚀 Installation & Demo

### **Requirements**
- iOS 16.6+
- Xcode 15.0+
- Apple Developer Account (for TestFlight deployment)

### **Quick Start**
```bash
git clone https://github.com/ahburgess22/DayX.git
cd DayX
open DayX.xcodeproj
```

## 🎯 Portfolio Impact

### **Technical Skills Demonstrated**
- **iOS Development Mastery**: Advanced SwiftUI, MVVM architecture, complex navigation
- **Security Implementation**: OAuth 2.0 + PKCE, cryptographic operations, enterprise authentication
- **AI/ML Integration**: Natural Language processing, algorithm development, on-device computation
- **API Integration**: Real-world platform integration, constraint handling, professional testing
- **Problem Solving**: Strategic technical decisions, cost-benefit analysis, constraint-driven innovation

### **Professional Development Approach**
- **Rapid Execution**: Complex iOS application developed in accelerated timeline (3 days of development)
- **Strategic Pivoting**: API constraints transformed into portfolio advantages
- **Quality Standards**: Production-ready code with comprehensive error handling
- **Business Intelligence**: Platform economics analysis and strategic decision-making

## 🏆 Development Story

This project represents a comprehensive demonstration of iOS development capabilities, combining enterprise-level authentication, AI/ML integration, and strategic problem-solving. The development process showcased:

- **Technical Leadership**: Architectural decision-making and implementation ownership
- **Constraint-Driven Innovation**: API limitations transformed into portfolio strengths
- **Professional Development Practices**: Systematic testing, documentation, and quality assurance
- **Strategic Business Thinking**: Cost-benefit analysis and platform economics understanding

## 📞 Contact

**Austin Burgess**
- Portfolio: [Austin Burgess Personal Website](https://personal-website-green-eta-61.vercel.app/)
- LinkedIn: [linkedin.com/in/austin-burgess-swarthmore](https://linkedin.com/in/austin-burgess-swarthmore)
- Email: ahburgess22@gmail.com

---

*Built with SwiftUI, OAuth 2.0, and AI-powered analytics. Demonstrating enterprise-level iOS development capabilities and strategic technical leadership.*
