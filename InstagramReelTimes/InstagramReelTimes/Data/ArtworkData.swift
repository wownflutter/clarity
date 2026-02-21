//
//  ArtworkData.swift
//  ArtworkReview
//
//  Sample artwork catalogue
//

import SwiftUI

struct ArtworkData {

    static let catalogue: [Artwork] = [

        // MARK: Painting
        Artwork(
            title: "Crimson Tide",
            artist: "Elena Vasquez",
            category: .painting,
            year: 2021,
            description: "A sweeping seascape rendered in bold, gestural strokes. Vasquez captures the raw power of an incoming storm through layers of crimson and deep violet.",
            medium: "Oil on canvas",
            placeholderColors: [.red, .purple],
            placeholderIcon: "water.waves"
        ),
        Artwork(
            title: "Golden Hour Garden",
            artist: "Thomas Hale",
            category: .painting,
            year: 2019,
            description: "Warm late-afternoon light floods a cottage garden, blurring the boundary between impressionism and realism. Soft edges and luminous yellows define the mood.",
            medium: "Acrylic on linen",
            placeholderColors: [.yellow, .orange],
            placeholderIcon: "leaf"
        ),
        Artwork(
            title: "Still Life with Blue Vase",
            artist: "Nora Kim",
            category: .painting,
            year: 2023,
            description: "A contemporary take on classical still life. The asymmetrical composition and muted palette give this work a quiet, meditative quality.",
            medium: "Oil on panel",
            placeholderColors: [.blue, .teal],
            placeholderIcon: "vase"
        ),
        Artwork(
            title: "Urban Decay No. 4",
            artist: "Marcus Webb",
            category: .painting,
            year: 2022,
            description: "Part of a series documenting post-industrial landscapes. Peeling paint, rusted iron, and crumbling concrete are elevated into something haunting and beautiful.",
            medium: "Mixed media on board",
            placeholderColors: [.gray, .brown],
            placeholderIcon: "building.2"
        ),

        // MARK: Photography
        Artwork(
            title: "Fog at Dawn",
            artist: "Suki Tanaka",
            category: .photography,
            year: 2020,
            description: "Shot at 5 AM in the mountains of Hokkaido, this long exposure captures cedar trees dissolving into morning mist. Minimal, ethereal, and deeply calming.",
            medium: "Fine-art print",
            placeholderColors: [.gray, .white],
            placeholderIcon: "cloud.fog"
        ),
        Artwork(
            title: "Market Day",
            artist: "Amara Diallo",
            category: .photography,
            year: 2018,
            description: "A street photography study of a Dakar market. Colour, motion, and human connection collide in a single decisive moment.",
            medium: "Chromogenic print",
            placeholderColors: [.orange, .red],
            placeholderIcon: "cart"
        ),
        Artwork(
            title: "Solitude",
            artist: "Petra Novak",
            category: .photography,
            year: 2021,
            description: "A lone figure stands at the edge of a frozen lake. The vast, empty expanse makes the human presence feel both small and significant.",
            medium: "Silver gelatin print",
            placeholderColors: [.cyan, .blue],
            placeholderIcon: "person"
        ),

        // MARK: Digital Art
        Artwork(
            title: "Neural Garden",
            artist: "Kai Lim",
            category: .digital,
            year: 2023,
            description: "An AI-assisted generative piece exploring the overlap between organic growth and computational structure. New patterns emerge on every viewing.",
            medium: "Generative digital print",
            placeholderColors: [.green, .mint],
            placeholderIcon: "cpu"
        ),
        Artwork(
            title: "Neon Deity",
            artist: "Zara Osei",
            category: .digital,
            year: 2022,
            description: "A cyberpunk-influenced deity figure composed of layered light trails and glitch textures. Explores themes of technology and spirituality.",
            medium: "Digital illustration",
            placeholderColors: [.pink, .purple],
            placeholderIcon: "bolt"
        ),
        Artwork(
            title: "Pixel Pastoral",
            artist: "Remi Fontaine",
            category: .digital,
            year: 2020,
            description: "A 16-bit pixel-art landscape that subverts the nostalgia of retro gaming by depicting a scene of environmental destruction.",
            medium: "Digital pixel art",
            placeholderColors: [.green, .yellow],
            placeholderIcon: "gamecontroller"
        ),

        // MARK: Abstract
        Artwork(
            title: "Tension Field",
            artist: "Hiro Matsuda",
            category: .abstract,
            year: 2021,
            description: "Hard-edge geometric forms jostle for space on the canvas. The tension between shapes creates a visual energy that feels almost kinetic.",
            medium: "Acrylic on canvas",
            placeholderColors: [.red, .yellow],
            placeholderIcon: "square.on.circle"
        ),
        Artwork(
            title: "Bloom",
            artist: "Cleo Johansson",
            category: .abstract,
            year: 2019,
            description: "Poured paint and controlled accidents produce organic, cellular forms that suggest microscopic life. Each viewing reveals new internal structure.",
            medium: "Resin and pigment on panel",
            placeholderColors: [.pink, .orange],
            placeholderIcon: "allergens"
        ),

        // MARK: Portrait
        Artwork(
            title: "Grandmother",
            artist: "Isabela Torres",
            category: .portrait,
            year: 2017,
            description: "A tender, hyper-realistic portrait of the artist's grandmother. Every wrinkle is rendered with devotion; the subject's dignity and life experience radiate from the canvas.",
            medium: "Graphite on paper",
            placeholderColors: [.brown, .orange],
            placeholderIcon: "person.crop.circle"
        ),
        Artwork(
            title: "Self-Portrait in Green",
            artist: "Lena Brandt",
            category: .portrait,
            year: 2022,
            description: "An unflinching self-portrait in an unconventional palette. The green skin tones challenge assumptions about realistic representation and beauty.",
            medium: "Oil on canvas",
            placeholderColors: [.green, .teal],
            placeholderIcon: "face.smiling"
        ),

        // MARK: Landscape
        Artwork(
            title: "Icelandic Thaw",
            artist: "Björn Eriksson",
            category: .landscape,
            year: 2020,
            description: "Painted plein-air on the Snæfellsnes peninsula. The raw, unmediated experience of the landscape is preserved in the loose, expressive mark-making.",
            medium: "Oil on board",
            placeholderColors: [.blue, .cyan],
            placeholderIcon: "mountain.2"
        ),
        Artwork(
            title: "Desert at Dusk",
            artist: "Fatima Al-Hassan",
            category: .landscape,
            year: 2018,
            description: "The transition from day to night across the Sahara captured in saturated ochre, violet, and deep blue. Scale and silence are the true subjects.",
            medium: "Watercolor on paper",
            placeholderColors: [.orange, .indigo],
            placeholderIcon: "sun.horizon"
        ),

        // MARK: Illustration
        Artwork(
            title: "The Last Cartographer",
            artist: "Yuki Shimizu",
            category: .illustration,
            year: 2023,
            description: "An intricate editorial illustration depicting a lone cartographer charting a fantastical world. Fine ink lines build an elaborate visual tapestry.",
            medium: "Ink and watercolor",
            placeholderColors: [.brown, .yellow],
            placeholderIcon: "map"
        ),
        Artwork(
            title: "Clockwork City",
            artist: "Olaf Bauer",
            category: .illustration,
            year: 2021,
            description: "A steampunk cityscape illustrated in exquisite detail. Gears, pipes, and dirigibles create a world that invites extended exploration.",
            medium: "Digital illustration",
            placeholderColors: [.brown, .gray],
            placeholderIcon: "gearshape.2"
        ),

        // MARK: Sculpture
        Artwork(
            title: "Hollow Form No. 7",
            artist: "Priya Mehta",
            category: .sculpture,
            year: 2019,
            description: "A hand-thrown and altered ceramic vessel. The deliberate asymmetry and fire-scarred surface speak to process as much as form.",
            medium: "Stoneware",
            placeholderColors: [.brown, .red],
            placeholderIcon: "cube"
        ),
        Artwork(
            title: "Weight of Memory",
            artist: "Dario Conti",
            category: .sculpture,
            year: 2022,
            description: "Cast bronze figures arranged in a circular formation, each bearing an abstract burden. The work asks what we carry and what we choose to put down.",
            medium: "Bronze",
            placeholderColors: [.yellow, .brown],
            placeholderIcon: "figure.stand"
        )
    ]

    static func artworks(for category: ArtworkCategory) -> [Artwork] {
        if category == .all { return catalogue }
        return catalogue.filter { $0.category == category }
    }
}
