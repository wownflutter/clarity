//
//  ContentView.swift
//  InstagramReelTimes
//
//  Main entry view with tab navigation
//  Optimized for ad scheduling in PST timezone
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AdRecommendationView()
                .tabItem {
                    Label("Schedule", systemImage: "megaphone.fill")
                }

            CountryListView()
                .tabItem {
                    Label("Countries", systemImage: "globe")
                }

            BestTimesOverviewView()
                .tabItem {
                    Label("Insights", systemImage: "chart.bar.fill")
                }

            TipsView()
                .tabItem {
                    Label("Tips", systemImage: "lightbulb.fill")
                }
        }
        .tint(Color("AccentColor"))
    }
}

#Preview {
    ContentView()
}
