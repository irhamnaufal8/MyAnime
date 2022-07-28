//
//  AnimeListTargetType.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation
import Moya

enum AnimeListTargetType {
    case getAnimeList
}

extension AnimeListTargetType: MyAnimeTargetType {
    var parameters: [String : Any] {
        return [:]
    }
    
    var path: String {
        switch self {
        case .getAnimeList:
            return "/top/anime"
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        URLEncoding.default
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    var sampleData: Data {
        switch self {
        case .getAnimeList:
            let response = AnimeList(
                top: [
                    AnimeData(
                        malId: 1,
                        rank: 1,
                        title: "Unit Anime",
                        type: "TV",
                        startDate: "1 Jan",
                        imageUrl: "https://image.com/image.jpg"
                    )
                ]
            )
            return response.toJSONData()
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAnimeList:
            return .get
        }
    }
}
