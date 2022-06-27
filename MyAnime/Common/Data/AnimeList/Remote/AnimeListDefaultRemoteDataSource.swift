//
//  AnimeListDefaultDataSource.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation
import Moya

final class AnimeListDefaultRemoteDataSource: AnimeListRemoteDataSource {
    private let provider: MoyaProvider<AnimeListTargetType>
    
    init(provider: MoyaProvider<AnimeListTargetType> = .defaultProvider()) {
        self.provider = provider
    }
    
    func getAnimeList() async throws -> AnimeListResponse {
        try await self.provider.requestAsync(.getAnimeList, model: AnimeListResponse.self)
    }
}
