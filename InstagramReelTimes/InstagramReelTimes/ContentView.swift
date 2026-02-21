//
//  ContentView.swift
//  InstagramReelTimes
//
//  Main tab navigation for the Artwork Review app
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ratingStore: RatingStore

    var body: some View {
        TabView {
            ArtworkGalleryView()
                .tabItem {
                    Label("Gallery", systemImage: "photo.stack")
                }

            MyRatingsView()
                .tabItem {
                    Label("My Ratings", systemImage: "star.fill")
                }
        }
        .tint(Color("AccentColor"))
    }
}

#Preview {
    ContentView()
        .environmentObject(RatingStore())
}
