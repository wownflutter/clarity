//
//  ContentView.swift
//  InstagramReelTimes
//
//  Main entry view with tab navigation
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CountryListView()
                .tabItem {
                    Label("Countries", systemImage: "globe")
                }

            BestTimesOverviewView()
                .tabItem {
                    Label("Best Times", systemImage: "clock.fill")
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
