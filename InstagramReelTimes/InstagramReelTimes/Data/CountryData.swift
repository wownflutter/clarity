//
//  CountryData.swift
//  InstagramReelTimes
//
//  Best posting times data by country based on engagement research
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

    // MARK: - North America

    static let northAmericaCountries: [Country] = [
        Country(
            name: "United States",
            code: "US",
            flag: "🇺🇸",
            timezone: "Multiple (EST/CST/MST/PST)",
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
            insights: "US audiences are most active during lunch breaks (12-2 PM EST) and evening hours (7-9 PM). Sundays show strong engagement as users catch up on content. Tuesday and Wednesday evenings are particularly effective for Reels."
        ),
        Country(
            name: "Canada",
            code: "CA",
            flag: "🇨🇦",
            timezone: "Multiple (EST/CST/MST/PST)",
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
            insights: "Canadian users mirror US patterns but show slightly higher morning engagement. Lunch hours are consistently strong across weekdays. Weekend mornings perform well."
        ),
        Country(
            name: "Mexico",
            code: "MX",
            flag: "🇲🇽",
            timezone: "CST (UTC-6)",
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
            insights: "Mexican audiences are highly active during late lunch and evening hours. Friday and Sunday show peak engagement. Evening content (8-10 PM) performs exceptionally well."
        )
    ]

    // MARK: - Europe

    static let europeCountries: [Country] = [
        Country(
            name: "United Kingdom",
            code: "GB",
            flag: "🇬🇧",
            timezone: "GMT/BST (UTC+0/+1)",
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
            insights: "UK audiences engage heavily during commute times and lunch breaks. Thursday lunchtime is particularly strong. Friday evenings show high engagement as the weekend begins."
        ),
        Country(
            name: "Germany",
            code: "DE",
            flag: "🇩🇪",
            timezone: "CET/CEST (UTC+1/+2)",
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
            insights: "German users prefer early morning content during commute and midday lunch breaks. Evening content performs best on Tuesday and Thursday. Sundays show steady engagement."
        ),
        Country(
            name: "France",
            code: "FR",
            flag: "🇫🇷",
            timezone: "CET/CEST (UTC+1/+2)",
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
            insights: "French audiences are most active during the traditional long lunch break (12-2 PM). Wednesday afternoons and Friday early evenings show strong engagement."
        ),
        Country(
            name: "Spain",
            code: "ES",
            flag: "🇪🇸",
            timezone: "CET/CEST (UTC+1/+2)",
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
            insights: "Spanish users follow later schedules, with peak engagement during late lunch (siesta time) and late evening hours. Night time content (9-11 PM) is particularly effective."
        ),
        Country(
            name: "Italy",
            code: "IT",
            flag: "🇮🇹",
            timezone: "CET/CEST (UTC+1/+2)",
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
            insights: "Italian audiences engage strongly during pranzo (lunch) hours and evening relaxation time. Friday afternoons and Sunday lunchtimes are particularly effective for Reels."
        ),
        Country(
            name: "Netherlands",
            code: "NL",
            flag: "🇳🇱",
            timezone: "CET/CEST (UTC+1/+2)",
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
            insights: "Dutch users are early risers with strong morning engagement. Lunch breaks are short but show high activity. Tuesday evenings perform well."
        )
    ]

    // MARK: - Asia

    static let asiaCountries: [Country] = [
        Country(
            name: "Japan",
            code: "JP",
            flag: "🇯🇵",
            timezone: "JST (UTC+9)",
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
            insights: "Japanese audiences are highly active during commute times and late night hours. The late evening slot (9-11 PM) after work consistently shows peak engagement. Weekends see more daytime activity."
        ),
        Country(
            name: "South Korea",
            code: "KR",
            flag: "🇰🇷",
            timezone: "KST (UTC+9)",
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
            insights: "Korean users are night owls with very strong late-night engagement (10 PM - 12 AM). Friday nights extend well past midnight. Sunday afternoons show peak weekend activity."
        ),
        Country(
            name: "India",
            code: "IN",
            flag: "🇮🇳",
            timezone: "IST (UTC+5:30)",
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
            insights: "India has one of the most active Instagram user bases. Evening hours (7-10 PM) consistently perform well. Weekends show strong all-day engagement, particularly Sunday mornings."
        ),
        Country(
            name: "Indonesia",
            code: "ID",
            flag: "🇮🇩",
            timezone: "WIB (UTC+7)",
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
            insights: "Indonesian users are highly engaged during lunch breaks and evening hours. Friday and Saturday nights show extended engagement. Weekend mornings are particularly effective."
        ),
        Country(
            name: "Thailand",
            code: "TH",
            flag: "🇹🇭",
            timezone: "ICT (UTC+7)",
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
            insights: "Thai audiences show strong evening engagement, particularly later in the week. Friday nights are exceptionally active. Sunday afternoons are ideal for reaching Thai users."
        ),
        Country(
            name: "Singapore",
            code: "SG",
            flag: "🇸🇬",
            timezone: "SGT (UTC+8)",
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
            insights: "Singaporean users are highly digital-savvy with consistent engagement during lunch hours. Evening engagement peaks on Thursday and Friday. Weekend mornings show steady activity."
        ),
        Country(
            name: "Philippines",
            code: "PH",
            flag: "🇵🇭",
            timezone: "PHT (UTC+8)",
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
            insights: "Filipinos are among the most active social media users globally. Evening hours (8-11 PM) consistently show peak engagement. Weekend content performs exceptionally well."
        ),
        Country(
            name: "China",
            code: "CN",
            flag: "🇨🇳",
            timezone: "CST (UTC+8)",
            bestTimes: [
                TimeSlot(dayOfWeek: .monday, startTime: "7:00 AM", endTime: "9:00 AM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .monday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .monday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .tuesday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .tuesday, startTime: "8:00 PM", endTime: "10:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .wednesday, startTime: "12:00 PM", endTime: "2:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .thursday, startTime: "9:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .friday, startTime: "12:00 PM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .friday, startTime: "8:00 PM", endTime: "11:00 PM", engagementLevel: .peak),
                TimeSlot(dayOfWeek: .saturday, startTime: "10:00 AM", endTime: "1:00 PM", engagementLevel: .high),
                TimeSlot(dayOfWeek: .sunday, startTime: "10:00 AM", endTime: "2:00 PM", engagementLevel: .peak)
            ],
            insights: "Note: Instagram access is limited in mainland China. These times apply to Chinese users with VPN access or in regions with access. Evening hours after work (8-11 PM) show highest engagement."
        )
    ]

    // MARK: - Oceania

    static let oceaniaCountries: [Country] = [
        Country(
            name: "Australia",
            code: "AU",
            flag: "🇦🇺",
            timezone: "Multiple (AEST/ACST/AWST)",
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
            insights: "Australian users engage strongly during lunch hours and evening relaxation time. Thursday and Friday evenings show peak activity. Weekend mornings are effective for reaching Australian audiences."
        ),
        Country(
            name: "New Zealand",
            code: "NZ",
            flag: "🇳🇿",
            timezone: "NZST/NZDT (UTC+12/+13)",
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
            insights: "New Zealand users follow similar patterns to Australia but are 2-3 hours ahead. Midweek lunch hours and Friday evenings are optimal. Sunday mornings show strong engagement."
        )
    ]

    // MARK: - South America

    static let southAmericaCountries: [Country] = [
        Country(
            name: "Brazil",
            code: "BR",
            flag: "🇧🇷",
            timezone: "BRT (UTC-3)",
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
            insights: "Brazil has one of the world's largest Instagram user bases. Evening hours (7-10 PM) show peak engagement throughout the week. Weekends show strong all-day engagement."
        ),
        Country(
            name: "Argentina",
            code: "AR",
            flag: "🇦🇷",
            timezone: "ART (UTC-3)",
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
            insights: "Argentine users follow later schedules similar to Spain. Late evening content (9-11 PM) performs exceptionally well. Sunday afternoons are peak engagement times."
        ),
        Country(
            name: "Colombia",
            code: "CO",
            flag: "🇨🇴",
            timezone: "COT (UTC-5)",
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
            insights: "Colombian users engage strongly during lunch hours and evening. Tuesday and Friday evenings show peak engagement. Weekend midday hours are also effective."
        ),
        Country(
            name: "Chile",
            code: "CL",
            flag: "🇨🇱",
            timezone: "CLT (UTC-3/-4)",
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
            insights: "Chilean users are active during lunch and evening hours. Friday evenings and Sunday afternoons show the highest engagement rates."
        )
    ]

    // MARK: - Africa

    static let africaCountries: [Country] = [
        Country(
            name: "South Africa",
            code: "ZA",
            flag: "🇿🇦",
            timezone: "SAST (UTC+2)",
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
            insights: "South African users are most active during lunch hours and evening time. Thursday and Friday evenings show peak engagement. Weekend mornings perform well."
        ),
        Country(
            name: "Nigeria",
            code: "NG",
            flag: "🇳🇬",
            timezone: "WAT (UTC+1)",
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
            insights: "Nigeria has a rapidly growing Instagram user base. Evening hours (7-10 PM) show strong engagement. Friday and Saturday nights are particularly active. Sunday afternoons are peak times."
        ),
        Country(
            name: "Egypt",
            code: "EG",
            flag: "🇪🇬",
            timezone: "EET (UTC+2)",
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
            insights: "Egyptian users are most active in late evening hours (9-11 PM). Friday is the weekend day and shows strong engagement throughout the day."
        ),
        Country(
            name: "Kenya",
            code: "KE",
            flag: "🇰🇪",
            timezone: "EAT (UTC+3)",
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
            insights: "Kenyan users show strong midday and evening engagement. Friday evenings and Sunday afternoons are particularly effective for reaching Kenyan audiences."
        )
    ]

    // MARK: - Middle East

    static let middleEastCountries: [Country] = [
        Country(
            name: "United Arab Emirates",
            code: "AE",
            flag: "🇦🇪",
            timezone: "GST (UTC+4)",
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
            insights: "UAE users are most active during late evening hours (9 PM - 12 AM). Friday is the weekend day and shows all-day engagement. Thursday evening marks the start of the weekend."
        ),
        Country(
            name: "Saudi Arabia",
            code: "SA",
            flag: "🇸🇦",
            timezone: "AST (UTC+3)",
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
            insights: "Saudi Arabian users are night owls with peak activity from 10 PM to 1 AM. Friday and Saturday are weekend days with strong all-day engagement. Late-night content performs exceptionally well."
        ),
        Country(
            name: "Turkey",
            code: "TR",
            flag: "🇹🇷",
            timezone: "TRT (UTC+3)",
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
            insights: "Turkish users are very active on social media with strong evening engagement (8-11 PM). Weekend nights and Sunday afternoons show peak activity."
        ),
        Country(
            name: "Israel",
            code: "IL",
            flag: "🇮🇱",
            timezone: "IST (UTC+2/+3)",
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
            insights: "Israel's week starts on Sunday which shows strong engagement. Friday morning before Shabbat and Saturday evening after Shabbat are peak times. Thursday evenings are also very active."
        )
    ]
}
