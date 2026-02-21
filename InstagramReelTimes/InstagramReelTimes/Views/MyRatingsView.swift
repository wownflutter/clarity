//
//  MyRatingsView.swift
//  InstagramReelTimes
//
//  Shows all artworks the user has rated, sortable by stars or date
//

import SwiftUI

enum RatingSortOrder: String, CaseIterable, Identifiable {
    case starsDesc = "Highest Rated"
    case starsAsc = "Lowest Rated"
    case dateDesc = "Most Recent"
    case dateAsc = "Oldest First"

    var id: String { rawValue }
}

struct MyRatingsView: View {
    @EnvironmentObject var ratingStore: RatingStore
    @State private var sortOrder: RatingSortOrder = .starsDesc
    @State private var selectedArtwork: Artwork?

    var ratedArtworks: [(artwork: Artwork, rating: ArtworkRating)] {
        let all = ArtworkData.catalogue
        let pairs = ratingStore.ratings.compactMap { rating -> (artwork: Artwork, rating: ArtworkRating)? in
            guard let artwork = all.first(where: { $0.id == rating.artworkID }) else { return nil }
            return (artwork, rating)
        }
        return pairs.sorted { lhs, rhs in
            switch sortOrder {
            case .starsDesc: return lhs.rating.stars > rhs.rating.stars
            case .starsAsc:  return lhs.rating.stars < rhs.rating.stars
            case .dateDesc:  return lhs.rating.date > rhs.rating.date
            case .dateAsc:   return lhs.rating.date < rhs.rating.date
            }
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if ratedArtworks.isEmpty {
                    EmptyRatingsView()
                } else {
                    ScrollView {
                        VStack(spacing: 0) {
                            // Summary bar
                            RatingsSummaryBar(
                                count: ratedArtworks.count,
                                average: ratingStore.averageRating,
                                fiveStars: ratingStore.ratings.filter { $0.stars == 5 }.count
                            )

                            // Sorted list
                            LazyVStack(spacing: 10) {
                                ForEach(ratedArtworks, id: \.artwork.id) { pair in
                                    RatedArtworkRow(artwork: pair.artwork, rating: pair.rating)
                                        .onTapGesture { selectedArtwork = pair.artwork }
                                }
                            }
                            .padding(16)
                        }
                    }
                }
            }
            .navigationTitle("My Ratings")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Sort", selection: $sortOrder) {
                            ForEach(RatingSortOrder.allCases) { order in
                                Text(order.rawValue).tag(order)
                            }
                        }
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down")
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            .sheet(item: $selectedArtwork) { artwork in
                ArtworkDetailView(artwork: artwork)
                    .environmentObject(ratingStore)
            }
        }
    }
}

struct RatingsSummaryBar: View {
    let count: Int
    let average: Double
    let fiveStars: Int

    var body: some View {
        HStack(spacing: 24) {
            VStack(spacing: 2) {
                Text("\(count)")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Rated")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Divider().frame(height: 36)

            VStack(spacing: 2) {
                HStack(spacing: 3) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.subheadline)
                    Text(String(format: "%.1f", average))
                        .font(.title2)
                        .fontWeight(.bold)
                }
                Text("Average")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Divider().frame(height: 36)

            VStack(spacing: 2) {
                Text("\(fiveStarCount)")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("5-Star")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(Color(.systemBackground))
    }

    var fiveStarCount: Int { fiveStars }
}

struct RatedArtworkRow: View {
    let artwork: Artwork
    let rating: ArtworkRating

    var body: some View {
        HStack(spacing: 14) {
            // Thumbnail
            ZStack {
                LinearGradient(
                    colors: artwork.placeholderColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                Image(systemName: artwork.placeholderIcon)
                    .font(.system(size: 22))
                    .foregroundColor(.white.opacity(0.85))
            }
            .frame(width: 64, height: 64)
            .cornerRadius(10)

            VStack(alignment: .leading, spacing: 5) {
                Text(artwork.title)
                    .font(.headline)
                    .lineLimit(1)

                Text(artwork.artist)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)

                // Stars display
                HStack(spacing: 2) {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: star <= rating.stars ? "star.fill" : "star")
                            .font(.caption)
                            .foregroundColor(star <= rating.stars ? .yellow : Color(.systemGray4))
                    }
                }

                if !rating.review.isEmpty {
                    Text(rating.review)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .italic()
                }
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text("\(rating.stars)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AccentColor"))

                Text(rating.date, style: .date)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(14)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
}

struct EmptyRatingsView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "star.slash")
                .font(.system(size: 56))
                .foregroundColor(.secondary)

            Text("No Ratings Yet")
                .font(.headline)

            Text("Browse the Gallery and tap an artwork to give it a star rating.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 80)
    }
}

#Preview {
    MyRatingsView()
        .environmentObject(RatingStore())
}
