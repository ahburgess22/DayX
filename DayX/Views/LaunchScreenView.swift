//
//  LaunchScreenView.swift
//  DayX
//
//  Created by Austin Burgess on 5/30/25.
//


// Create a new SwiftUI file: LaunchScreenView.swift

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            // Same gradient as your app
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 1.0, green: 0.4, blue: 0.4), // Coral/pink
                    Color(red: 0.6, green: 0.4, blue: 1.0)  // Purple
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // DayX logo text (since we can match your logo style)
            Text("DayX")
                .font(.system(size: 60, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}