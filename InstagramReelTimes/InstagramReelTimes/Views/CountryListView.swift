//
//  CountryListView.swift
//  InstagramReelTimes
//
//  List of countries with filtering by region
//

import SwiftUI

struct CountryListView: View {
    @State private var selectedRegion: Region = .all
    @State private var searchText = ""

    var filteredCountries: [Country] {
        let regionCountries = CountryData.countries(for: selectedRegion)

        if searchText.isEmpty {
            return regionCountries
        }

        return regionCountries.filter { country in
            country.name.localizedCaseInsensitiveContains(searchText) ||
            country.code.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Region Picker
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(Region.allCases) { region in
                            RegionChip(
                                region: region,
                                isSelected: selectedRegion == region
                            ) {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    selectedRegion = region
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                }
                .background(Color(.systemBackground))

                Divider()

                // Country List
                List(filteredCountries) { country in
                    NavigationLink(destination: CountryDetailView(country: country)) {
                        CountryRowView(country: country)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Reel Posting Times")
            .searchable(text: $searchText, prompt: "Search countries")
        }
    }
}

struct RegionChip: View {
    let region: Region
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(region.rawValue)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(isSelected ? Color("AccentColor") : Color(.systemGray6))
                )
                .foregroundColor(isSelected ? .white : .primary)
        }
        .buttonStyle(.plain)
    }
}

struct CountryRowView: View {
    let country: Country

    var body: some View {
        HStack(spacing: 16) {
            Text(country.flag)
                .font(.system(size: 40))

            VStack(alignment: .leading, spacing: 4) {
                Text(country.name)
                    .font(.headline)

                Text(country.timezone)
                    .font(.caption)
                    .foregroundColor(.secondary)

                HStack(spacing: 4) {
                    Image(systemName: "clock.fill")
                        .font(.caption2)
                        .foregroundColor(Color("AccentColor"))

                    Text("\(country.peakTimes.count) peak times")
                        .font(.caption)
                        .foregroundColor(Color("AccentColor"))
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    CountryListView()
}
