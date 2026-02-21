//
//  RatingStore.swift
//  ArtworkReview
//
//  Stores and persists the user's artwork ratings
//

import Foundation

class RatingStore: ObservableObject {
    @Published private(set) var ratings: [ArtworkRating] = []

    private let saveKey = "artwork_ratings"

    init() { load() }

    // MARK: - Public API

    func rating(for artworkID: UUID) -> ArtworkRating? {
        ratings.first { $0.artworkID == artworkID }
    }

    func stars(for artworkID: UUID) -> Int {
        rating(for: artworkID)?.stars ?? 0
    }

    func saveRating(artworkID: UUID, stars: Int, review: String = "") {
        if let index = ratings.firstIndex(where: { $0.artworkID == artworkID }) {
            ratings[index].stars = stars
            ratings[index].review = review
        } else {
            ratings.append(ArtworkRating(artworkID: artworkID, stars: stars, review: review))
        }
        persist()
    }

    func removeRating(for artworkID: UUID) {
        ratings.removeAll { $0.artworkID == artworkID }
        persist()
    }

    var averageRating: Double {
        guard !ratings.isEmpty else { return 0 }
        return Double(ratings.map(\.stars).reduce(0, +)) / Double(ratings.count)
    }

    func topRated(in catalogue: [Artwork]) -> [Artwork] {
        catalogue
            .filter { stars(for: $0.id) >= 4 }
            .sorted { stars(for: $0.id) > stars(for: $1.id) }
    }

    // MARK: - Persistence

    private func persist() {
        if let data = try? JSONEncoder().encode(ratings) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: saveKey),
              let decoded = try? JSONDecoder().decode([ArtworkRating].self, from: data)
        else { return }
        ratings = decoded
    }
}
