//
//  Country.swift
//  InstagramReelTimes
//
//  Data models for countries and posting times
//

import Foundation

struct TimeSlot: Identifiable, Hashable {
    let id = UUID()
    let dayOfWeek: DayOfWeek
    let startTime: String
    let endTime: String
    let engagementLevel: EngagementLevel

    var timeRange: String {
        "\(startTime) - \(endTime)"
    }
}

enum DayOfWeek: String, CaseIterable, Identifiable {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"

    var id: String { rawValue }

    var shortName: String {
        String(rawValue.prefix(3))
    }
}

enum EngagementLevel: String, Comparable {
    case peak = "Peak"
    case high = "High"
    case moderate = "Moderate"

    var color: String {
        switch self {
        case .peak: return "peakColor"
        case .high: return "highColor"
        case .moderate: return "moderateColor"
        }
    }

    var sortOrder: Int {
        switch self {
        case .peak: return 0
        case .high: return 1
        case .moderate: return 2
        }
    }

    static func < (lhs: EngagementLevel, rhs: EngagementLevel) -> Bool {
        lhs.sortOrder < rhs.sortOrder
    }
}

struct Country: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let code: String
    let flag: String
    let timezone: String
    let bestTimes: [TimeSlot]
    let insights: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }

    static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.code == rhs.code
    }

    var peakTimes: [TimeSlot] {
        bestTimes.filter { $0.engagementLevel == .peak }
    }

    var highTimes: [TimeSlot] {
        bestTimes.filter { $0.engagementLevel == .high }
    }
}

enum Region: String, CaseIterable, Identifiable {
    case all = "All"
    case northAmerica = "North America"
    case europe = "Europe"
    case asia = "Asia"
    case oceania = "Oceania"
    case southAmerica = "South America"
    case africa = "Africa"
    case middleEast = "Middle East"

    var id: String { rawValue }
}
