//
//  ArtworkGalleryView.swift
//  InstagramReelTimes
//
//  Browse artwork by category with star rating badges
//

import SwiftUI

struct ArtworkGalleryView: View {
    @EnvironmentObject var ratingStore: RatingStore
    @State private var selectedCategory: ArtworkCategory = .all
    @State private var selectedArtwork: Artwork?

    var filteredArtworks: [Artwork] {
        ArtworkData.artworks(for: selectedCategory)
    }

    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Category Filter
                CategoryFilterBar(selectedCategory: $selectedCategory)

                // Artwork Grid
                ScrollView {
                    if filteredArtworks.isEmpty {
                        EmptyGalleryView()
                    } else {
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(filteredArtworks) { artwork in
                                ArtworkCard(artwork: artwork, stars: ratingStore.stars(for: artwork.id))
                                    .onTapGesture {
                                        selectedArtwork = artwork
                                    }
                            }
                        }
                        .padding(16)
                    }
                }
            }
            .navigationTitle("Gallery")
            .background(Color(.systemGroupedBackground))
            .sheet(item: $selectedArtwork) { artwork in
                ArtworkDetailView(artwork: artwork)
                    .environmentObject(ratingStore)
            }
        }
    }
}

struct CategoryFilterBar: View {
    @Binding var selectedCategory: ArtworkCategory

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(ArtworkCategory.allCases) { category in
                    Button {
                        withAnimation { selectedCategory = category }
                    } label: {
                        Text(category.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedCategory == category ? .semibold : .regular)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedCategory == category ? Color("AccentColor") : Color(.systemGray6))
                            )
                            .foregroundColor(selectedCategory == category ? .white : .primary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        }
        .background(Color(.systemBackground))
    }
}

struct ArtworkCard: View {
    let artwork: Artwork
    let stars: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Placeholder image
            ZStack {
                LinearGradient(
                    colors: artwork.placeholderColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                Image(systemName: artwork.placeholderIcon)
                    .font(.system(size: 36))
                    .foregroundColor(.white.opacity(0.85))

                // Star badge
                if stars > 0 {
                    VStack {
                        HStack {
                            Spacer()
                            StarBadge(stars: stars)
                                .padding(8)
                        }
                        Spacer()
                    }
                }
            }
            .frame(height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 0))

            // Info
            VStack(alignment: .leading, spacing: 3) {
                Text(artwork.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(1)

                Text(artwork.artist)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)

                Text(artwork.category.rawValue)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .padding(.top, 1)
            }
            .padding(10)
        }
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.07), radius: 4, x: 0, y: 2)
    }
}

struct StarBadge: View {
    let stars: Int

    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
                .font(.system(size: 9))
            Text("\(stars)")
                .font(.caption2)
                .fontWeight(.bold)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 7)
        .padding(.vertical, 4)
        .background(
            Capsule()
                .fill(Color.black.opacity(0.55))
        )
    }
}

struct EmptyGalleryView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "photo.on.rectangle.angled")
                .font(.system(size: 52))
                .foregroundColor(.secondary)

            Text("No Artworks")
                .font(.headline)

            Text("No artworks found in this category.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(48)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ArtworkGalleryView()
        .environmentObject(RatingStore())
}
