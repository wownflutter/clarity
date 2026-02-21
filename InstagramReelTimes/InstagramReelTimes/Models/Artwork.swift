//
//  Artwork.swift
//  ArtworkReview
//
//  Data models for artwork and ratings
//

import Foundation
import SwiftUI

// MARK: - Category

enum ArtworkCategory: String, CaseIterable, Identifiable {
    case all        = "All"
    case painting   = "Painting"
    case photography = "Photography"
    case digital    = "Digital Art"
    case sculpture  = "Sculpture"
    case illustration = "Illustration"
    case abstract   = "Abstract"
    case portrait   = "Portrait"
    case landscape  = "Landscape"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .all:           return "square.grid.2x2"
        case .painting:      return "paintbrush"
        case .photography:   return "camera"
        case .digital:       return "display"
        case .sculpture:     return "cube"
        case .illustration:  return "pencil.tip"
        case .abstract:      return "scribble"
        case .portrait:      return "person.crop.square"
        case .landscape:     return "mountain.2"
        }
    }
}

// MARK: - Artwork

struct Artwork: Identifiable, Hashable {
    let id: UUID
    let title: String
    let artist: String
    let category: ArtworkCategory
    let year: Int
    let description: String
    let medium: String
    let placeholderColors: [Color]   // Used for gradient placeholder
    let placeholderIcon: String      // SF Symbol used as thumbnail stand-in

    init(
        id: UUID = UUID(),
        title: String,
        artist: String,
        category: ArtworkCategory,
        year: Int,
        description: String,
        medium: String,
        placeholderColors: [Color],
        placeholderIcon: String
    ) {
        self.id = id
        self.title = title
        self.artist = artist
        self.category = category
        self.year = year
        self.description = description
        self.medium = medium
        self.placeholderColors = placeholderColors
        self.placeholderIcon = placeholderIcon
    }

    func hash(into hasher: inout Hasher) { hasher.combine(id) }
    static func == (lhs: Artwork, rhs: Artwork) -> Bool { lhs.id == rhs.id }
}

// MARK: - Rating

struct ArtworkRating: Identifiable, Codable {
    let id: UUID
    let artworkID: UUID
    var stars: Int          // 1–5
    var review: String
    let date: Date

    init(artworkID: UUID, stars: Int, review: String = "") {
        self.id = UUID()
        self.artworkID = artworkID
        self.stars = stars
        self.review = review
        self.date = Date()
    }
}
