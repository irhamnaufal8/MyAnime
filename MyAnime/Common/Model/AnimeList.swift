//
//  AnimeList.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation

typealias AnimeListResponse = [AnimeList]

struct AnimeList: Codable {
    var top: [AnimeData]
}

struct AnimeData: Codable {
    var malId: Int?
    var rank: Int?
    var title: String?
    var type: String?
    var startDate: String?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case rank, title, type
        case malId = "mal_id"
        case startDate = "start_date"
        case imageUrl = "image_url"
    }
}
