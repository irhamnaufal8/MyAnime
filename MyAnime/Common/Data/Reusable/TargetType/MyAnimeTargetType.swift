//
//  MyAnimeTargetType.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation
import Moya

protocol MyAnimeTargetType: TargetType {
    var parameters: [String: Any] {
        get
    }
}

extension MyAnimeTargetType {
    var baseURL: URL {
        return URL(string: "https://api.jikan.moe/v3") ?? (NSURL() as URL)
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        JSONEncoding.default
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
