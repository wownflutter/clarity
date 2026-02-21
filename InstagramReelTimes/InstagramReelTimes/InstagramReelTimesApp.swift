//
//  InstagramReelTimesApp.swift
//  InstagramReelTimes
//
//  Artwork Review App
//

import SwiftUI

@main
struct InstagramReelTimesApp: App {
    @StateObject private var ratingStore = RatingStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ratingStore)
        }
    }
}
