//
//  CountryData.swift
//  InstagramReelTimes
//
//  Best posting times data by country based on engagement research
//  All times shown are local times for each country
//  UTC offsets are used to convert to PST for ad scheduling
//

import Foundation

struct CountryData {
    static let countries: [Region: [Country]] = [
        .northAmerica: northAmericaCountries,
        .europe: europeCountries,
        .asia: asiaCountries,
        .oceania: oceaniaCountries,
        .southAmerica: southAmericaCountries,
        .africa: africaCountries,
        .middleEast: middleEastCountries
    ]

    static var allCountries: [Country] {
        countries.values.flatMap { $0 }.sorted { $0.name < $1.name }
    }

    static func countries(for region: Region) -> [Country] {
        if region == .all {
            return allCountries
        }
        return countries[region] ?? []
    }

    // Get all peak time slots converted to PST, sorted by follower potential
    static func allPeakTimesPST() -> [PSTTimeSlot] {
        allCountries.flatMap { $0.peakTimesPST }
    }

    // Get best countries to target for a specific PST hour and day
    static func bestCountries(forPSTHour hour: Int, day: DayOfWeek) -> [PSTTimeSlot] {
        allPeakTimesPST().filter { slot in
            slot.pstDayOfWeek == day &&
            hour >= slot.pstStartHour &&
            hour < slot.pstEndHour
        }.sorted { $0.originalSlot.engagementLevel < $1.originalSlot.engagementLevel }
    }

    // MARK: - North America

    static let northAmericaCountries: [Country] = [
        Country(
            name: "United States",
            code: "US",
            flag: "🇺🇸",
            timezone: "EST (UTC-5)",
            utcOffset: -5,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "6:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "6:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "3:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "9:00 AM", endTime: "11:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .moderate),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .sunday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .high)
            ],
            insights: "US audiences are most active during lunch breaks (12-2 PM EST) and evening hours (7-9 PM). Sundays show strong engagement as users catch up on content.",
            instagramUsers: "169M"
        ),
        Country(
            name: "Canada",
            code: "CA",
            flag: "🇨🇦",
            timezone: "EST (UTC-5)",
            utcOffset: -5,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .moderate),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "2:00 PM", engagementLevel: .peak)
            ],
            insights: "Canadian users mirror US patterns but show slightly higher morning engagement. Lunch hours are consistently strong across weekdays.",
            instagramUsers: "18M"
        ),
        Country(
            name: "Mexico",
            code: "MX",
            flag: "🇲🇽",
            timezone: "CST (UTC-6)",
            utcOffset: -6,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "12:00 PM", endTime: "4:00 PM", engagementLevel: .peak)
            ],
            insights: "Mexican audiences are highly active during late lunch and evening hours. Friday and Sunday show peak engagement.",
            instagramUsers: "44M"
        )
    ]

    // MARK: - Europe

    static let europeCountries: [Country] = [
        Country(
            name: "United Kingdom",
            code: "GB",
            flag: "🇬🇧",
            timezone: "GMT (UTC+0)",
            utcOffset: 0,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "5:00 PM", endTime: "7:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .moderate),
                TimeSlot(dayOfWeek: .sunday, startTime: "9:00 AM", endTime: "12:00 PM", engagementLevel: .high)
            ],
            insights: "UK audiences engage heavily during commute times and lunch breaks. Thursday lunchtime is particularly strong.",
            instagramUsers: "35M"
        ),
        Country(
            name: "Germany",
            code: "DE",
            flag: "🇩🇪",
            timezone: "CET (UTC+1)",
            utcOffset: 1,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "6:00 AM", endTime: "8:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "6:00 PM", endTime: "8:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .moderate),
                TimeSlot(dayOfWeek: .sunday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high)
            ],
            insights: "German users prefer early morning content during commute and midday lunch breaks. Evening content performs best on Tuesday and Thursday.",
            instagramUsers: "32M"
        ),
        Country(
            name: "France",
            code: "FR",
            flag: "🇫🇷",
            timezone: "CET (UTC+1)",
            utcOffset: 1,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "8:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "6:00 PM", endTime: "8:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "5:00 PM", endTime: "7:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .moderate),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "1:00 PM", engagementLevel: .high)
            ],
            insights: "French audiences are most active during the traditional long lunch break (12-2 PM). Friday early evenings show strong engagement.",
            instagramUsers: "28M"
        ),
        Country(
            name: "Spain",
            code: "ES",
            flag: "🇪🇸",
            timezone: "CET (UTC+1)",
            utcOffset: 1,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "2:00 PM", endTime: "4:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "2:00 PM", endTime: "4:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .moderate),
                TimeSlot(dayOfWeek: .sunday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high)
            ],
            insights: "Spanish users follow later schedules, with peak engagement during siesta time and late evening hours (9-11 PM).",
            instagramUsers: "24M"
        ),
        Country(
            name: "Italy",
            code: "IT",
            flag: "🇮🇹",
            timezone: "CET (UTC+1)",
            utcOffset: 1,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .monday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .moderate),
                TimeSlot(dayOfWeek: .sunday, startTime: "12:00 PM", endTime: "3:00 PM", engagementLevel: .peak)
            ],
            insights: "Italian audiences engage strongly during pranzo (lunch) hours and evening relaxation time.",
            instagramUsers: "29M"
        ),
        Country(
            name: "Netherlands",
            code: "NL",
            flag: "🇳🇱",
            timezone: "CET (UTC+1)",
            utcOffset: 1,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "8:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "6:00 PM", endTime: "8:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .moderate),
                TimeSlot(dayOfWeek: .sunday, startTime: "9:00 AM", endTime: "12:00 PM", engagementLevel: .high)
            ],
            insights: "Dutch users are early risers with strong morning engagement. Lunch breaks show high activity.",
            instagramUsers: "9M"
        )
    ]

    // MARK: - Asia

    static let asiaCountries: [Country] = [
        Country(
            name: "Japan",
            code: "JP",
            flag: "🇯🇵",
            timezone: "JST (UTC+9)",
            utcOffset: 9,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .monday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 AM", endTime: "8:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "2:00 PM", engagementLevel: .peak)
            ],
            insights: "Japanese audiences are highly active during commute times and late night hours. The late evening slot (9-11 PM) shows peak engagement.",
            instagramUsers: "56M"
        ),
        Country(
            name: "South Korea",
            code: "KR",
            flag: "🇰🇷",
            timezone: "KST (UTC+9)",
            utcOffset: 9,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .monday, startTime: "10:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "10:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "10:00 PM", endTime: "2:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "2:00 PM", endTime: "6:00 PM", engagementLevel: .peak)
            ],
            insights: "Korean users are night owls with strong late-night engagement (10 PM - 12 AM). Friday nights extend past midnight.",
            instagramUsers: "24M"
        ),
        Country(
            name: "India",
            code: "IN",
            flag: "🇮🇳",
            timezone: "IST (UTC+5:30)",
            utcOffset: 5.5,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "7:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .sunday, startTime: "11:00 AM", endTime: "3:00 PM", engagementLevel: .peak)
            ],
            insights: "India has one of the most active Instagram user bases. Evening hours (7-10 PM) consistently perform well.",
            instagramUsers: "362M"
        ),
        Country(
            name: "Indonesia",
            code: "ID",
            flag: "🇮🇩",
            timezone: "WIB (UTC+7)",
            utcOffset: 7,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "2:00 PM", engagementLevel: .peak)
            ],
            insights: "Indonesian users are highly engaged during lunch breaks and evening hours. Weekend mornings are particularly effective.",
            instagramUsers: "106M"
        ),
        Country(
            name: "Thailand",
            code: "TH",
            flag: "🇹🇭",
            timezone: "ICT (UTC+7)",
            utcOffset: 7,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .monday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "11:00 AM", endTime: "3:00 PM", engagementLevel: .peak)
            ],
            insights: "Thai audiences show strong evening engagement, particularly later in the week. Friday nights are exceptionally active.",
            instagramUsers: "21M"
        ),
        Country(
            name: "Singapore",
            code: "SG",
            flag: "🇸🇬",
            timezone: "SGT (UTC+8)",
            utcOffset: 8,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "2:00 PM", engagementLevel: .peak)
            ],
            insights: "Singaporean users are highly digital-savvy with consistent engagement during lunch hours. Evening engagement peaks on Thursday and Friday.",
            instagramUsers: "4M"
        ),
        Country(
            name: "Philippines",
            code: "PH",
            flag: "🇵🇭",
            timezone: "PHT (UTC+8)",
            utcOffset: 8,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "8:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "3:00 PM", engagementLevel: .peak)
            ],
            insights: "Filipinos are among the most active social media users globally. Evening hours (8-11 PM) consistently show peak engagement.",
            instagramUsers: "20M"
        )
    ]

    // MARK: - Oceania

    static let oceaniaCountries: [Country] = [
        Country(
            name: "Australia",
            code: "AU",
            flag: "🇦🇺",
            timezone: "AEST (UTC+10)",
            utcOffset: 10,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "6:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "9:00 AM", endTime: "12:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "2:00 PM", engagementLevel: .peak)
            ],
            insights: "Australian users engage strongly during lunch hours and evening relaxation time. Thursday and Friday evenings show peak activity.",
            instagramUsers: "14M"
        ),
        Country(
            name: "New Zealand",
            code: "NZ",
            flag: "🇳🇿",
            timezone: "NZST (UTC+12)",
            utcOffset: 12,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "6:00 PM", endTime: "8:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "9:00 AM", endTime: "11:00 AM", engagementLevel: .moderate),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "1:00 PM", engagementLevel: .peak)
            ],
            insights: "New Zealand users follow similar patterns to Australia but are 2-3 hours ahead. Friday evenings are optimal.",
            instagramUsers: "2M"
        )
    ]

    // MARK: - South America

    static let southAmericaCountries: [Country] = [
        Country(
            name: "Brazil",
            code: "BR",
            flag: "🇧🇷",
            timezone: "BRT (UTC-3)",
            utcOffset: -3,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "7:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .sunday, startTime: "11:00 AM", endTime: "3:00 PM", engagementLevel: .peak)
            ],
            insights: "Brazil has one of the world's largest Instagram user bases. Evening hours (7-10 PM) show peak engagement.",
            instagramUsers: "134M"
        ),
        Country(
            name: "Argentina",
            code: "AR",
            flag: "🇦🇷",
            timezone: "ART (UTC-3)",
            utcOffset: -3,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "12:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "12:00 PM", endTime: "4:00 PM", engagementLevel: .peak)
            ],
            insights: "Argentine users follow later schedules. Late evening content (9-11 PM) performs exceptionally well.",
            instagramUsers: "27M"
        ),
        Country(
            name: "Colombia",
            code: "CO",
            flag: "🇨🇴",
            timezone: "COT (UTC-5)",
            utcOffset: -5,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "11:00 AM", endTime: "3:00 PM", engagementLevel: .peak)
            ],
            insights: "Colombian users engage strongly during lunch hours and evening. Tuesday and Friday evenings show peak engagement.",
            instagramUsers: "20M"
        ),
        Country(
            name: "Chile",
            code: "CL",
            flag: "🇨🇱",
            timezone: "CLT (UTC-3)",
            utcOffset: -3,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "1:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .moderate),
                TimeSlot(dayOfWeek: .sunday, startTime: "12:00 PM", endTime: "4:00 PM", engagementLevel: .peak)
            ],
            insights: "Chilean users are active during lunch and evening hours. Friday evenings and Sunday afternoons show the highest engagement.",
            instagramUsers: "12M"
        )
    ]

    // MARK: - Africa

    static let africaCountries: [Country] = [
        Country(
            name: "South Africa",
            code: "ZA",
            flag: "🇿🇦",
            timezone: "SAST (UTC+2)",
            utcOffset: 2,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "6:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "2:00 PM", engagementLevel: .peak)
            ],
            insights: "South African users are most active during lunch hours and evening time. Thursday and Friday evenings show peak engagement.",
            instagramUsers: "8M"
        ),
        Country(
            name: "Nigeria",
            code: "NG",
            flag: "🇳🇬",
            timezone: "WAT (UTC+1)",
            utcOffset: 1,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "8:00 AM", endTime: "10:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .monday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "7:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .sunday, startTime: "12:00 PM", endTime: "4:00 PM", engagementLevel: .peak)
            ],
            insights: "Nigeria has a rapidly growing Instagram user base. Evening hours (7-10 PM) show strong engagement.",
            instagramUsers: "11M"
        ),
        Country(
            name: "Egypt",
            code: "EG",
            flag: "🇪🇬",
            timezone: "EET (UTC+2)",
            utcOffset: 2,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "12:00 PM", endTime: "3:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high)
            ],
            insights: "Egyptian users are most active in late evening hours (9-11 PM). Friday is the weekend day and shows strong engagement.",
            instagramUsers: "21M"
        ),
        Country(
            name: "Kenya",
            code: "KE",
            flag: "🇰🇪",
            timezone: "EAT (UTC+3)",
            utcOffset: 3,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "7:00 PM", endTime: "9:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "7:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "11:00 AM", endTime: "3:00 PM", engagementLevel: .peak)
            ],
            insights: "Kenyan users show strong midday and evening engagement. Friday evenings and Sunday afternoons are particularly effective.",
            instagramUsers: "4M"
        )
    ]

    // MARK: - Middle East

    static let middleEastCountries: [Country] = [
        Country(
            name: "United Arab Emirates",
            code: "AE",
            flag: "🇦🇪",
            timezone: "GST (UTC+4)",
            utcOffset: 4,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "9:00 AM", endTime: "11:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .sunday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high)
            ],
            insights: "UAE users are most active during late evening hours (9 PM - 12 AM). Friday is the weekend day and shows all-day engagement.",
            instagramUsers: "8M"
        ),
        Country(
            name: "Saudi Arabia",
            code: "SA",
            flag: "🇸🇦",
            timezone: "AST (UTC+3)",
            utcOffset: 3,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "10:00 AM", endTime: "12:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "10:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "10:00 PM", endTime: "1:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "10:00 PM", endTime: "1:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "10:00 PM", endTime: "2:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "3:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "10:00 PM", endTime: "2:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 PM", endTime: "1:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .sunday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high)
            ],
            insights: "Saudi Arabian users are night owls with peak activity from 10 PM to 1 AM. Friday and Saturday are weekend days.",
            instagramUsers: "29M"
        ),
        Country(
            name: "Turkey",
            code: "TR",
            flag: "🇹🇷",
            timezone: "TRT (UTC+3)",
            utcOffset: 3,
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "8:00 AM", endTime: "10:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "11:00 AM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .saturday, startTime: "9:00 PM", endTime: "12:00 AM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .sunday, startTime: "12:00 PM", endTime: "4:00 PM", engagementLevel: .peak)
            ],
            insights: "Turkish users are very active on social media with strong evening engagement (8-11 PM). Sunday afternoons show peak activity.",
            instagramUsers: "56M"
        ),
        Country(
            name: "Israel",
            code: "IL",
            flag: "🇮🇱",
            timezone: "IST (UTC+2)",
            utcOffset: 2,
            bestTimes: [
                TimeSlot(dayOfWeek: .sunday, startTime: "8:00 AM", endTime: "10:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .monday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "11:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .wednesday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .thursday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "9:00 AM", endTime: "12:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak)
            ],
            insights: "Israel's week starts on Sunday. Friday morning before Shabbat and Saturday evening after Shabbat are peak times.",
            instagramUsers: "4M"
        )
    ]
}
