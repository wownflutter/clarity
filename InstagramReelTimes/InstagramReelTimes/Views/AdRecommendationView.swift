//
//  AdRecommendationView.swift
//  InstagramReelTimes
//
//  Shows best countries to target for Reel ads at each PST time slot
//

import SwiftUI

struct AdRecommendationView: View {
    @State private var selectedDay: DayOfWeek = .monday
    @State private var selectedHour: Int = 9

    var recommendedCountries: [PSTTimeSlot] {
        CountryData.allCountries
            .flatMap { $0.allTimesPST }
            .filter { slot in
                slot.pstDayOfWeek == selectedDay &&
                selectedHour >= slot.pstStartHour &&
                selectedHour < slot.pstEndHour
            }
            .sorted { lhs, rhs in
                if lhs.originalSlot.engagementLevel != rhs.originalSlot.engagementLevel {
                    return lhs.originalSlot.engagementLevel < rhs.originalSlot.engagementLevel
                }
                // Sort by user base size as secondary
                let lhsUsers = Int(lhs.country.instagramUsers.replacingOccurrences(of: "M", with: "")) ?? 0
                let rhsUsers = Int(rhs.country.instagramUsers.replacingOccurrences(of: "M", with: "")) ?? 0
                return lhsUsers > rhsUsers
            }
    }

    var peakCountries: [PSTTimeSlot] {
        recommendedCountries.filter { $0.originalSlot.engagementLevel == .peak }
    }

    var highCountries: [PSTTimeSlot] {
        recommendedCountries.filter { $0.originalSlot.engagementLevel == .high }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // PST Time Selector
                    PSTTimeSelectorView(selectedDay: $selectedDay, selectedHour: $selectedHour)

                    // Current Selection Display
                    CurrentSelectionCard(day: selectedDay, hour: selectedHour, countryCount: recommendedCountries.count)

                    // Recommendations
                    if recommendedCountries.isEmpty {
                        NoRecommendationsView()
                    } else {
                        // Peak Countries Section
                        if !peakCountries.isEmpty {
                            RecommendationSection(
                                title: "Best Countries to Target",
                                subtitle: "Peak engagement - highest follower potential",
                                icon: "flame.fill",
                                color: .orange,
                                slots: peakCountries
                            )
                        }

                        // High Countries Section
                        if !highCountries.isEmpty {
                            RecommendationSection(
                                title: "Good Countries to Target",
                                subtitle: "High engagement - strong follower potential",
                                icon: "arrow.up.circle.fill",
                                color: .blue,
                                slots: highCountries
                            )
                        }
                    }

                    // Summary Stats
                    AdSummarySection(slots: recommendedCountries)
                }
                .padding(.bottom, 32)
            }
            .navigationTitle("Ad Recommendations")
            .background(Color(.systemGroupedBackground))
        }
    }
}

struct PSTTimeSelectorView: View {
    @Binding var selectedDay: DayOfWeek
    @Binding var selectedHour: Int

    var body: some View {
        VStack(spacing: 16) {
            // Day Selector
            VStack(alignment: .leading, spacing: 8) {
                Text("Select Day (PST)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(DayOfWeek.allCases) { day in
                            Button {
                                withAnimation { selectedDay = day }
                            } label: {
                                Text(day.shortName)
                                    .font(.subheadline)
                                    .fontWeight(selectedDay == day ? .bold : .medium)
                                    .frame(width: 48, height: 48)
                                    .background(
                                        Circle()
                                            .fill(selectedDay == day ? Color("AccentColor") : Color(.systemGray6))
                                    )
                                    .foregroundColor(selectedDay == day ? .white : .primary)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
            }

            // Hour Selector
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Select Time (PST)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Spacer()

                    Text(formatHour(selectedHour))
                        .font(.headline)
                        .foregroundColor(Color("AccentColor"))
                }
                .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        ForEach(0..<24, id: \.self) { hour in
                            Button {
                                withAnimation { selectedHour = hour }
                            } label: {
                                Text(formatHourShort(hour))
                                    .font(.caption)
                                    .fontWeight(selectedHour == hour ? .bold : .regular)
                                    .frame(width: 44, height: 36)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(selectedHour == hour ? Color("AccentColor") : Color(.systemGray6))
                                    )
                                    .foregroundColor(selectedHour == hour ? .white : .primary)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding(.vertical)
        .background(Color(.systemBackground))
    }

    func formatHour(_ hour: Int) -> String {
        let displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour)
        let period = hour < 12 ? "AM" : "PM"
        return "\(displayHour):00 \(period) PST"
    }

    func formatHourShort(_ hour: Int) -> String {
        let displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour)
        let period = hour < 12 ? "A" : "P"
        return "\(displayHour)\(period)"
    }
}

struct CurrentSelectionCard: View {
    let day: DayOfWeek
    let hour: Int
    let countryCount: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Your Ad Schedule")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("\(day.rawValue) at \(formatHour(hour))")
                    .font(.title2)
                    .fontWeight(.bold)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text("\(countryCount)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AccentColor"))

                Text("countries active")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .padding(.horizontal)
    }

    func formatHour(_ hour: Int) -> String {
        let displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour)
        let period = hour < 12 ? "AM" : "PM"
        return "\(displayHour):00 \(period) PST"
    }
}

struct RecommendationSection: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let slots: [PSTTimeSlot]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)

            LazyVStack(spacing: 8) {
                ForEach(slots) { slot in
                    CountryRecommendationCard(slot: slot, accentColor: color)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CountryRecommendationCard: View {
    let slot: PSTTimeSlot
    let accentColor: Color

    var body: some View {
        HStack(spacing: 12) {
            Text(slot.country.flag)
                .font(.system(size: 36))

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(slot.country.name)
                        .font(.headline)

                    Spacer()

                    Text(slot.country.instagramUsers + " users")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(.systemGray6))
                        .cornerRadius(4)
                }

                HStack(spacing: 16) {
                    Label {
                        Text("Local: \(slot.originalSlot.timeRange)")
                            .font(.caption)
                    } icon: {
                        Image(systemName: "clock")
                            .font(.caption2)
                    }
                    .foregroundColor(.secondary)

                    Label {
                        Text(slot.country.timezone)
                            .font(.caption)
                    } icon: {
                        Image(systemName: "globe")
                            .font(.caption2)
                    }
                    .foregroundColor(.secondary)
                }

                Text(slot.originalSlot.engagementLevel.followerPotential + " follower potential")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(accentColor)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
}

struct NoRecommendationsView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "moon.zzz.fill")
                .font(.system(size: 48))
                .foregroundColor(.secondary)

            Text("Low Activity Time")
                .font(.headline)

            Text("Few countries show peak engagement at this time. Consider scheduling your ad for a different hour.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(32)
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct AdSummarySection: View {
    let slots: [PSTTimeSlot]

    var totalReach: String {
        var total = 0
        var seenCountries = Set<String>()

        for slot in slots {
            if !seenCountries.contains(slot.country.code) {
                seenCountries.insert(slot.country.code)
                let userString = slot.country.instagramUsers.replacingOccurrences(of: "M", with: "")
                if let users = Int(userString) {
                    total += users
                }
            }
        }

        if total >= 1000 {
            return String(format: "%.1fB", Double(total) / 1000.0)
        }
        return "\(total)M"
    }

    var uniqueCountries: Int {
        Set(slots.map { $0.country.code }).count
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(Color("AccentColor"))
                Text("Potential Reach")
                    .font(.headline)
            }
            .padding(.horizontal)

            HStack(spacing: 20) {
                SummaryStatBox(
                    value: "\(uniqueCountries)",
                    label: "Countries",
                    icon: "globe"
                )

                SummaryStatBox(
                    value: totalReach,
                    label: "Users",
                    icon: "person.3.fill"
                )

                SummaryStatBox(
                    value: "\(slots.filter { $0.originalSlot.engagementLevel == .peak }.count)",
                    label: "Peak Slots",
                    icon: "flame.fill"
                )
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}

struct SummaryStatBox: View {
    let value: String
    let label: String
    let icon: String

    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.caption)
                    .foregroundColor(Color("AccentColor"))
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AdRecommendationView()
}
