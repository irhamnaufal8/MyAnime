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
    
    var method: Moya.Method {
        switch self {
        case .getAnimeList:
            return .get
        }
    }
}
