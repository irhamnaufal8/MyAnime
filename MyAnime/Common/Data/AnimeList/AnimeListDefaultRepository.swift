//
//  AnimeListDefaultRepository.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation

final class AnimeListDefaultRepository: AnimeListRepositroy {
    
    private let remoteDataSource: AnimeListRemoteDataSource
    
    init(remoteDataSource: AnimeListRemoteDataSource = AnimeListDefaultRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func provideGetAnimeList() async throws -> AnimeListResponse {
        try await self.remoteDataSource.getAnimeList()
    }
 
}
