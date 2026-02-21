//
//  ArtworkDetailView.swift
//  InstagramReelTimes
//
//  Full artwork view with interactive 1-5 star rating and optional review
//

import SwiftUI

struct ArtworkDetailView: View {
    let artwork: Artwork
    @EnvironmentObject var ratingStore: RatingStore
    @Environment(\.dismiss) private var dismiss

    @State private var selectedStars: Int = 0
    @State private var reviewText: String = ""
    @State private var showingSavedConfirmation = false

    var existingRating: ArtworkRating? {
        ratingStore.rating(for: artwork.id)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // Hero placeholder image
                    ZStack {
                        LinearGradient(
                            colors: artwork.placeholderColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )

                        VStack(spacing: 12) {
                            Image(systemName: artwork.placeholderIcon)
                                .font(.system(size: 72))
                                .foregroundColor(.white.opacity(0.9))

                            Text(artwork.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }
                    .frame(height: 280)

                    VStack(alignment: .leading, spacing: 20) {
                        // Artist & metadata
                        ArtworkMetadataSection(artwork: artwork)

                        Divider()

                        // Description
                        VStack(alignment: .leading, spacing: 8) {
                            Text("About")
                                .font(.headline)
                            Text(artwork.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }

                        Divider()

                        // Star Rating
                        RatingSection(
                            selectedStars: $selectedStars,
                            reviewText: $reviewText,
                            existingRating: existingRating
                        )

                        // Save / Remove buttons
                        RatingActionButtons(
                            selectedStars: selectedStars,
                            existingRating: existingRating,
                            onSave: saveRating,
                            onRemove: removeRating
                        )

                        if showingSavedConfirmation {
                            HStack {
                                Spacer()
                                Label("Rating saved!", systemImage: "checkmark.circle.fill")
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                                Spacer()
                            }
                            .transition(.opacity)
                        }
                    }
                    .padding(20)
                }
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                        .fontWeight(.semibold)
                }
            }
            .onAppear { loadExistingRating() }
        }
    }

    private func loadExistingRating() {
        if let rating = existingRating {
            selectedStars = rating.stars
            reviewText = rating.review
        }
    }

    private func saveRating() {
        guard selectedStars > 0 else { return }
        ratingStore.saveRating(artworkID: artwork.id, stars: selectedStars, review: reviewText)
        withAnimation {
            showingSavedConfirmation = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation { showingSavedConfirmation = false }
        }
    }

    private func removeRating() {
        ratingStore.removeRating(for: artwork.id)
        selectedStars = 0
        reviewText = ""
    }
}

struct ArtworkMetadataSection: View {
    let artwork: Artwork

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(artwork.artist)
                .font(.title3)
                .fontWeight(.semibold)

            HStack(spacing: 16) {
                Label(artwork.category.rawValue, systemImage: "tag")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Label(String(artwork.year), systemImage: "calendar")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Text(artwork.medium)
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 2)
        }
    }
}

struct RatingSection: View {
    @Binding var selectedStars: Int
    @Binding var reviewText: String
    let existingRating: ArtworkRating?

    var ratingLabel: String {
        switch selectedStars {
        case 1: return "Poor"
        case 2: return "Fair"
        case 3: return "Good"
        case 4: return "Very Good"
        case 5: return "Excellent"
        default: return "Tap to rate"
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Your Rating")
                .font(.headline)

            // Star row
            HStack(spacing: 8) {
                ForEach(1...5, id: \.self) { star in
                    Image(systemName: star <= selectedStars ? "star.fill" : "star")
                        .font(.system(size: 36))
                        .foregroundColor(star <= selectedStars ? .yellow : Color(.systemGray4))
                        .onTapGesture {
                            withAnimation(.spring(response: 0.2)) {
                                selectedStars = star
                            }
                        }
                }

                Spacer()

                Text(ratingLabel)
                    .font(.subheadline)
                    .foregroundColor(selectedStars > 0 ? Color("AccentColor") : .secondary)
                    .fontWeight(selectedStars > 0 ? .semibold : .regular)
            }

            // Review text field
            VStack(alignment: .leading, spacing: 6) {
                Text("Review (optional)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                TextField("Share your thoughts about this artwork...", text: $reviewText, axis: .vertical)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .lineLimit(3...6)
            }
        }
    }
}

struct RatingActionButtons: View {
    let selectedStars: Int
    let existingRating: ArtworkRating?
    let onSave: () -> Void
    let onRemove: () -> Void

    var body: some View {
        VStack(spacing: 10) {
            Button(action: onSave) {
                Text(existingRating != nil ? "Update Rating" : "Save Rating")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedStars > 0 ? Color("AccentColor") : Color(.systemGray4))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(selectedStars == 0)

            if existingRating != nil {
                Button(role: .destructive, action: onRemove) {
                    Text("Remove Rating")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    ArtworkDetailView(artwork: ArtworkData.catalogue[0])
        .environmentObject(RatingStore())
}
