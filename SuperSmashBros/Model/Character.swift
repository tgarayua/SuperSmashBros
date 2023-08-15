//
//  Character.swift
//  SuperSmashBros
//
//  Created by Thomas Garayua on 8/14/23.
//

import Foundation

// MARK: - TVShow
struct Character: Codable {
    let alsoAppearsIn: [AlsoAppearsIn]
    let availability: Availability
    let images: Images
    let name, order: String
    let series: Series
}

enum AlsoAppearsIn: String, Codable {
    case brawl = "Brawl"
    case melee = "Melee"
    case ssb = "SSB"
    case ssb4 = "SSB4"
}

enum Availability: String, Codable {
    case custom = "Custom"
    case downloadable = "Downloadable"
    case starter = "Starter"
    case unlockable = "Unlockable"
}

// MARK: - Images
struct Images: Codable {
    let icon, portrait: String
}

// MARK: - Series
struct Series: Codable {
    let icon: String
    let name: String
}
