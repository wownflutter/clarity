//
//  CountryDetailView.swift
//  InstagramReelTimes
//
//  Detailed view showing best posting times for a specific country
//

import SwiftUI

struct CountryDetailView: View {
    let country: Country
    @State private var selectedDay: DayOfWeek?

    var timesForSelectedDay: [TimeSlot] {
        guard let day = selectedDay else {
            return country.bestTimes.sorted { $0.engagementLevel < $1.engagementLevel }
        }
        return country.bestTimes.filter { $0.dayOfWeek == day }
            .sorted { $0.engagementLevel < $1.engagementLevel }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                CountryHeaderView(country: country)

                // Day Selector
                DaySelectorView(selectedDay: $selectedDay)

                // Time Slots
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text(selectedDay == nil ? "All Best Times" : "\(selectedDay!.rawValue)")
                            .font(.title2)
                            .fontWeight(.bold)

                        Spacer()

                        if selectedDay != nil {
                            Button("Show All") {
                                withAnimation {
                                    selectedDay = nil
                                }
                            }
                            .font(.subheadline)
                        }
                    }
                    .padding(.horizontal)

                    if timesForSelectedDay.isEmpty {
                        EmptyStateView(day: selectedDay)
                    } else {
                        LazyVStack(spacing: 12) {
                            ForEach(timesForSelectedDay) { timeSlot in
                                TimeSlotCard(timeSlot: timeSlot)
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                // Insights Section
                InsightsSection(insights: country.insights)

                // Weekly Overview
                WeeklyOverviewSection(bestTimes: country.bestTimes)
            }
            .padding(.bottom, 32)
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
}

struct CountryHeaderView: View {
    let country: Country

    var body: some View {
        VStack(spacing: 12) {
            Text(country.flag)
                .font(.system(size: 80))

            Text(country.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            HStack(spacing: 8) {
                Image(systemName: "clock")
                Text(country.timezone)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)

            HStack(spacing: 20) {
                StatBadge(
                    icon: "flame.fill",
                    value: "\(country.peakTimes.count)",
                    label: "Peak Times",
                    color: .orange
                )

                StatBadge(
                    icon: "arrow.up.circle.fill",
                    value: "\(country.highTimes.count)",
                    label: "High Times",
                    color: .blue
                )

                StatBadge(
                    icon: "calendar",
                    value: "\(Set(country.bestTimes.map { $0.dayOfWeek }).count)",
                    label: "Active Days",
                    color: .green
                )
            }
            .padding(.top, 8)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
    }
}

struct StatBadge: View {
    let icon: String
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(value)
                    .fontWeight(.bold)
            }
            .font(.headline)

            Text(label)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}

struct DaySelectorView: View {
    @Binding var selectedDay: DayOfWeek?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(DayOfWeek.allCases) { day in
                    DayChip(
                        day: day,
                        isSelected: selectedDay == day
                    ) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            if selectedDay == day {
                                selectedDay = nil
                            } else {
                                selectedDay = day
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct DayChip: View {
    let day: DayOfWeek
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(day.shortName)
                .font(.subheadline)
                .fontWeight(isSelected ? .bold : .medium)
                .frame(width: 44, height: 44)
                .background(
                    Circle()
                        .fill(isSelected ? Color("AccentColor") : Color(.systemGray6))
                )
                .foregroundColor(isSelected ? .white : .primary)
        }
        .buttonStyle(.plain)
    }
}

struct TimeSlotCard: View {
    let timeSlot: TimeSlot

    var engagementColor: Color {
        switch timeSlot.engagementLevel {
        case .peak:
            return .orange
        case .high:
            return .blue
        case .moderate:
            return .gray
        }
    }

    var engagementIcon: String {
        switch timeSlot.engagementLevel {
        case .peak:
            return "flame.fill"
        case .high:
            return "arrow.up.circle.fill"
        case .moderate:
            return "circle.fill"
        }
    }

    var body: some View {
        HStack(spacing: 16) {
            // Engagement Indicator
            VStack {
                Image(systemName: engagementIcon)
                    .font(.title2)
                    .foregroundColor(engagementColor)
            }
            .frame(width: 44)

            VStack(alignment: .leading, spacing: 4) {
                Text(timeSlot.dayOfWeek.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(timeSlot.timeRange)
                    .font(.title3)
                    .fontWeight(.semibold)
            }

            Spacer()

            // Engagement Badge
            Text(timeSlot.engagementLevel.rawValue)
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(engagementColor.opacity(0.15))
                )
                .foregroundColor(engagementColor)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, y: 1)
    }
}

struct EmptyStateView: View {
    let day: DayOfWeek?

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "calendar.badge.exclamationmark")
                .font(.system(size: 48))
                .foregroundColor(.secondary)

            Text(day != nil ? "No specific best times for \(day!.rawValue)" : "No data available")
                .font(.headline)
                .foregroundColor(.secondary)

            Text("Try selecting a different day")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 48)
    }
}

struct InsightsSection: View {
    let insights: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                Text("Insights")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)

            Text(insights)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .padding(.horizontal)
        }
    }
}

struct WeeklyOverviewSection: View {
    let bestTimes: [TimeSlot]

    var peakCountByDay: [DayOfWeek: Int] {
        var counts: [DayOfWeek: Int] = [:]
        for time in bestTimes where time.engagementLevel == .peak {
            counts[time.dayOfWeek, default: 0] += 1
        }
        return counts
    }

    var maxCount: Int {
        peakCountByDay.values.max() ?? 1
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(Color("AccentColor"))
                Text("Weekly Peak Times")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)

            VStack(spacing: 8) {
                ForEach(DayOfWeek.allCases) { day in
                    HStack(spacing: 12) {
                        Text(day.shortName)
                            .font(.subheadline)
                            .frame(width: 40, alignment: .leading)

                        GeometryReader { geometry in
                            let count = peakCountByDay[day] ?? 0
                            let width = geometry.size.width * CGFloat(count) / CGFloat(max(maxCount, 1))

                            HStack(spacing: 0) {
                                Rectangle()
                                    .fill(count > 0 ? Color("AccentColor") : Color(.systemGray5))
                                    .frame(width: max(width, 4))
                                    .cornerRadius(4)

                                Spacer()
                            }
                        }
                        .frame(height: 24)

                        Text("\(peakCountByDay[day] ?? 0)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .frame(width: 24)
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}

#Preview {
    NavigationStack {
        CountryDetailView(country: CountryData.northAmericaCountries[0])
    }
}
