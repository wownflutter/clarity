//
//  BestTimesOverviewView.swift
//  InstagramReelTimes
//
//  Overview of best posting times across regions
//

import SwiftUI

struct BestTimesOverviewView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Card
                    GlobalInsightsCard()

                    // Universal Best Times
                    UniversalBestTimesSection()

                    // Regional Breakdown
                    RegionalBreakdownSection()

                    // Day of Week Analysis
                    DayAnalysisSection()
                }
                .padding(.bottom, 32)
            }
            .navigationTitle("Best Times")
            .background(Color(.systemGroupedBackground))
        }
    }
}

struct GlobalInsightsCard: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "globe")
                .font(.system(size: 48))
                .foregroundColor(Color("AccentColor"))

            Text("Global Posting Insights")
                .font(.title2)
                .fontWeight(.bold)

            Text("Based on engagement data from 30+ countries, these are the universal best practices for posting Instagram Reels.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .padding(.horizontal)
        .padding(.top)
    }
}

struct UniversalBestTimesSection: View {
    let universalTimes = [
        UniversalTime(
            time: "12:00 PM - 2:00 PM",
            label: "Lunch Break",
            icon: "fork.knife",
            description: "Peak engagement during lunch hours across most time zones"
        ),
        UniversalTime(
            time: "7:00 PM - 10:00 PM",
            label: "Evening Prime Time",
            icon: "moon.stars.fill",
            description: "Highest overall engagement as users relax after work"
        ),
        UniversalTime(
            time: "7:00 AM - 9:00 AM",
            label: "Morning Commute",
            icon: "sunrise.fill",
            description: "Strong engagement from morning scrollers"
        )
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Universal Best Times")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)

            VStack(spacing: 12) {
                ForEach(universalTimes, id: \.time) { time in
                    UniversalTimeCard(time: time)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct UniversalTime: Identifiable {
    let id = UUID()
    let time: String
    let label: String
    let icon: String
    let description: String
}

struct UniversalTimeCard: View {
    let time: UniversalTime

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: time.icon)
                .font(.title2)
                .foregroundColor(Color("AccentColor"))
                .frame(width: 44, height: 44)
                .background(Color("AccentColor").opacity(0.1))
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 4) {
                Text(time.label)
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(time.time)
                    .font(.headline)

                Text(time.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
}

struct RegionalBreakdownSection: View {
    let regionalTimes: [(region: String, peak: String, note: String)] = [
        ("North America", "12-2 PM & 7-9 PM EST", "Lunch and evening hours"),
        ("Europe", "11 AM - 2 PM & 6-9 PM CET", "Similar to NA but earlier"),
        ("Asia", "12-1 PM & 9-11 PM Local", "Later evening times preferred"),
        ("Middle East", "9 PM - 12 AM GST", "Night owl culture"),
        ("South America", "7-10 PM Local", "Evening-focused engagement"),
        ("Oceania", "12-2 PM & 7-9 PM AEST", "Similar to NA patterns")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Regional Breakdown")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)

            VStack(spacing: 1) {
                ForEach(regionalTimes, id: \.region) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.region)
                                .font(.headline)
                            Text(item.note)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Text(item.peak)
                            .font(.subheadline)
                            .foregroundColor(Color("AccentColor"))
                            .multilineTextAlignment(.trailing)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                }
            }
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}

struct DayAnalysisSection: View {
    let dayInsights: [(day: String, rating: Int, note: String)] = [
        ("Monday", 3, "Good start to the week"),
        ("Tuesday", 4, "Strong midweek engagement"),
        ("Wednesday", 5, "Peak midweek performance"),
        ("Thursday", 5, "Excellent pre-weekend engagement"),
        ("Friday", 4, "Strong evening engagement"),
        ("Saturday", 3, "Moderate, varies by region"),
        ("Sunday", 5, "High catch-up browsing")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Day of Week Analysis")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)

            VStack(spacing: 0) {
                ForEach(dayInsights, id: \.day) { item in
                    HStack {
                        Text(item.day)
                            .font(.subheadline)
                            .frame(width: 80, alignment: .leading)

                        HStack(spacing: 4) {
                            ForEach(0..<5) { index in
                                Image(systemName: index < item.rating ? "star.fill" : "star")
                                    .font(.caption)
                                    .foregroundColor(index < item.rating ? .orange : .gray.opacity(0.3))
                            }
                        }

                        Spacer()

                        Text(item.note)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color(.systemBackground))

                    if item.day != "Sunday" {
                        Divider()
                            .padding(.leading)
                    }
                }
            }
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}

#Preview {
    BestTimesOverviewView()
}
