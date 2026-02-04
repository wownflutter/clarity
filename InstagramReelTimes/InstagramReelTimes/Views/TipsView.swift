//
//  TipsView.swift
//  InstagramReelTimes
//
//  Tips and best practices for posting Instagram Reels
//

import SwiftUI

struct TipsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    TipsHeaderView()

                    // Tips Sections
                    TimingTipsSection()
                    ContentTipsSection()
                    EngagementTipsSection()
                    AlgorithmTipsSection()
                }
                .padding(.bottom, 32)
            }
            .navigationTitle("Tips & Tricks")
            .background(Color(.systemGroupedBackground))
        }
    }
}

struct TipsHeaderView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "sparkles")
                .font(.system(size: 48))
                .foregroundColor(.yellow)

            Text("Maximize Your Reel Engagement")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text("Pro tips to help your Reels reach more people and gain more engagement.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .padding(.horizontal)
        .padding(.top)
    }
}

struct TimingTipsSection: View {
    let tips = [
        Tip(
            icon: "clock.arrow.circlepath",
            title: "Post Consistently",
            description: "Maintain a regular posting schedule. Aim for 3-7 Reels per week for optimal growth."
        ),
        Tip(
            icon: "globe.americas.fill",
            title: "Consider Your Audience's Time Zone",
            description: "If your audience is global, post at times that work across multiple time zones."
        ),
        Tip(
            icon: "calendar.badge.clock",
            title: "Test Different Times",
            description: "Use Instagram Insights to see when your specific audience is most active and adjust accordingly."
        ),
        Tip(
            icon: "hourglass",
            title: "Post 15-30 Minutes Before Peak",
            description: "Post slightly before peak hours so your Reel gains initial momentum when most users come online."
        )
    ]

    var body: some View {
        TipsSectionContainer(title: "Timing Tips", icon: "clock.fill", color: .blue, tips: tips)
    }
}

struct ContentTipsSection: View {
    let tips = [
        Tip(
            icon: "1.circle.fill",
            title: "Hook Viewers in 0.5 Seconds",
            description: "The first half-second is crucial. Start with movement, text, or something visually striking."
        ),
        Tip(
            icon: "film",
            title: "Optimal Length: 7-15 Seconds",
            description: "Shorter Reels tend to get more replays and higher completion rates, boosting reach."
        ),
        Tip(
            icon: "music.note",
            title: "Use Trending Audio",
            description: "Reels with trending sounds get pushed more by the algorithm. Check the Reels tab for trending audio."
        ),
        Tip(
            icon: "textformat",
            title: "Add Captions/Text",
            description: "Many users watch without sound. Text overlays increase engagement and watch time."
        ),
        Tip(
            icon: "arrow.triangle.2.circlepath",
            title: "Create Loop-worthy Content",
            description: "Reels that loop seamlessly get more watch time, which boosts algorithmic reach."
        )
    ]

    var body: some View {
        TipsSectionContainer(title: "Content Tips", icon: "film.fill", color: .purple, tips: tips)
    }
}

struct EngagementTipsSection: View {
    let tips = [
        Tip(
            icon: "bubble.left.and.bubble.right.fill",
            title: "Engage in First 30 Minutes",
            description: "Reply to every comment in the first 30 minutes after posting to boost engagement signals."
        ),
        Tip(
            icon: "questionmark.circle.fill",
            title: "Use CTAs and Questions",
            description: "End with a question or call-to-action to encourage comments and shares."
        ),
        Tip(
            icon: "paperplane.fill",
            title: "Share to Stories",
            description: "Always share your Reel to Stories to drive initial views from your existing followers."
        ),
        Tip(
            icon: "number",
            title: "Use 3-5 Relevant Hashtags",
            description: "Don't overdo hashtags. Use specific, relevant ones that match your content niche."
        )
    ]

    var body: some View {
        TipsSectionContainer(title: "Engagement Tips", icon: "heart.fill", color: .pink, tips: tips)
    }
}

struct AlgorithmTipsSection: View {
    let tips = [
        Tip(
            icon: "eyes",
            title: "Watch Time is King",
            description: "The algorithm prioritizes watch time. Make content people want to watch fully or replay."
        ),
        Tip(
            icon: "arrow.up.forward",
            title: "Shares > Likes",
            description: "The algorithm weights shares and saves more heavily than likes. Create shareable content."
        ),
        Tip(
            icon: "person.3.fill",
            title: "Niche Down",
            description: "The algorithm categorizes content. Consistent niches help Instagram show your Reels to the right audience."
        ),
        Tip(
            icon: "xmark.circle",
            title: "Avoid Watermarks",
            description: "Instagram deprioritizes content with TikTok or other watermarks. Use original or clean content."
        ),
        Tip(
            icon: "iphone",
            title: "Use Native Features",
            description: "Instagram favors Reels created with its native tools, effects, and features."
        )
    ]

    var body: some View {
        TipsSectionContainer(title: "Algorithm Tips", icon: "cpu.fill", color: .orange, tips: tips)
    }
}

struct Tip: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let description: String
}

struct TipsSectionContainer: View {
    let title: String
    let icon: String
    let color: Color
    let tips: [Tip]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)

            VStack(spacing: 0) {
                ForEach(Array(tips.enumerated()), id: \.element.id) { index, tip in
                    TipRow(tip: tip, color: color)

                    if index < tips.count - 1 {
                        Divider()
                            .padding(.leading, 60)
                    }
                }
            }
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}

struct TipRow: View {
    let tip: Tip
    let color: Color

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: tip.icon)
                .font(.title3)
                .foregroundColor(color)
                .frame(width: 36, height: 36)
                .background(color.opacity(0.1))
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(tip.title)
                    .font(.headline)

                Text(tip.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    TipsView()
}
