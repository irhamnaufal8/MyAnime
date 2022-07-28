//
//  AnimeListRepository.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation

protocol AnimeListRepositroy {
    func provideGetAnimeList() async throws -> AnimeList
    func provideSaveToLocalAnimeList(by anime: AnimeData) throws
    func provideLoadLocalAnime() async throws -> [Anime]
    func provideDeleteLocalItem() throws
    func provideToggleFavorite(by anime: Anime) throws
}
