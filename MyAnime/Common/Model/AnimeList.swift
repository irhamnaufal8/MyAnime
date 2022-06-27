//
//  AnimeList.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation

struct AnimeList: Codable {
    let top: [AnimeData]?
}

struct AnimeData: Codable, Hashable {
    let malId: Int?
    let rank: Int?
    let title: String?
    let type: String?
    let startDate: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case rank, title, type
        case malId = "mal_id"
        case startDate = "start_date"
        case imageUrl = "image_url"
    }
    
    static func == (lhs: AnimeData, rhs: AnimeData) -> Bool {
        return lhs.malId.orZero() == rhs.malId.orZero()
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(malId.orZero())
    }
}
