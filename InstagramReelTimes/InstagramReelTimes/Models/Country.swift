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

    var startHour: Int {
        parseHour(from: startTime)
    }

    var endHour: Int {
        parseHour(from: endTime)
    }

    private func parseHour(from timeString: String) -> Int {
        let components = timeString.replacingOccurrences(of: " ", with: "").split(separator: ":")
        guard let hourStr = components.first,
              var hour = Int(hourStr) else { return 0 }

        let isPM = timeString.uppercased().contains("PM")
        let isAM = timeString.uppercased().contains("AM")

        if isPM && hour != 12 {
            hour += 12
        } else if isAM && hour == 12 {
            hour = 0
        }

        return hour
    }
}

struct PSTTimeSlot: Identifiable, Hashable {
    let id = UUID()
    let country: Country
    let originalSlot: TimeSlot
    let pstDayOfWeek: DayOfWeek
    let pstStartTime: String
    let pstEndTime: String
    let pstStartHour: Int
    let pstEndHour: Int

    var pstTimeRange: String {
        "\(pstStartTime) - \(pstEndTime)"
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(country.code)
        hasher.combine(pstStartHour)
        hasher.combine(pstDayOfWeek)
    }

    static func == (lhs: PSTTimeSlot, rhs: PSTTimeSlot) -> Bool {
        lhs.country.code == rhs.country.code &&
        lhs.pstStartHour == rhs.pstStartHour &&
        lhs.pstDayOfWeek == rhs.pstDayOfWeek
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

    var index: Int {
        switch self {
        case .sunday: return 0
        case .monday: return 1
        case .tuesday: return 2
        case .wednesday: return 3
        case .thursday: return 4
        case .friday: return 5
        case .saturday: return 6
        }
    }

    static func from(index: Int) -> DayOfWeek {
        let normalizedIndex = ((index % 7) + 7) % 7
        switch normalizedIndex {
        case 0: return .sunday
        case 1: return .monday
        case 2: return .tuesday
        case 3: return .wednesday
        case 4: return .thursday
        case 5: return .friday
        case 6: return .saturday
        default: return .sunday
        }
    }

    func adding(days: Int) -> DayOfWeek {
        DayOfWeek.from(index: self.index + days)
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

    var followerPotential: String {
        switch self {
        case .peak: return "Very High"
        case .high: return "High"
        case .moderate: return "Moderate"
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
    let utcOffset: Double // Hours from UTC (e.g., -8 for PST, +9 for JST)
    let bestTimes: [TimeSlot]
    let insights: String
    let instagramUsers: String // Approximate user base for ad reach context

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

    // Convert a time slot to PST (UTC-8)
    func convertToPST(slot: TimeSlot) -> PSTTimeSlot {
        let pstOffset: Double = -8
        let hourDifference = pstOffset - utcOffset

        var pstStartHour = slot.startHour + Int(hourDifference)
        var pstEndHour = slot.endHour + Int(hourDifference)
        var dayOffset = 0

        // Handle day wraparound
        if pstStartHour < 0 {
            pstStartHour += 24
            dayOffset = -1
        } else if pstStartHour >= 24 {
            pstStartHour -= 24
            dayOffset = 1
        }

        if pstEndHour < 0 {
            pstEndHour += 24
        } else if pstEndHour >= 24 {
            pstEndHour -= 24
        }

        let pstDay = slot.dayOfWeek.adding(days: dayOffset)

        return PSTTimeSlot(
            country: self,
            originalSlot: slot,
            pstDayOfWeek: pstDay,
            pstStartTime: formatHour(pstStartHour),
            pstEndTime: formatHour(pstEndHour),
            pstStartHour: pstStartHour,
            pstEndHour: pstEndHour
        )
    }

    private func formatHour(_ hour: Int) -> String {
        let displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour)
        let period = hour < 12 ? "AM" : "PM"
        return "\(displayHour):00 \(period)"
    }

    var allTimesPST: [PSTTimeSlot] {
        bestTimes.map { convertToPST(slot: $0) }
    }

    var peakTimesPST: [PSTTimeSlot] {
        peakTimes.map { convertToPST(slot: $0) }
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
