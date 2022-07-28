//
//  AnimeListDefaultRepository.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation

final class AnimeListDefaultRepository: AnimeListRepositroy {
    
    private let remote: AnimeListRemoteDataSource
    private let local: AnimeListLocalDataSource
    
    init(
        remote: AnimeListRemoteDataSource = AnimeListDefaultRemoteDataSource(),
        local: AnimeListLocalDataSource = AnimeListDefaultLocalDataSource()
    ) {
        self.remote = remote
        self.local = local
    }
    
    func provideGetAnimeList() async throws -> AnimeList {
        try await self.remote.getAnimeList()
    }
    
    func provideSaveToLocalAnimeList(by anime: AnimeData) throws {
        try self.local.saveToLocalAnimeList(by: anime)
    }
    
    func provideLoadLocalAnime() async throws -> [Anime] {
        try await self.local.loadLocalAnime()
    }
    
    func provideDeleteLocalItem() throws {
        try self.local.deleteLocalItem()
    }
    
    func provideToggleFavorite(by anime: Anime) throws {
        try self.local.toggleFavorite(by: anime)
    }
 
}
