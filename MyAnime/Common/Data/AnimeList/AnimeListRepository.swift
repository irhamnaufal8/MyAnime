//
//  AnimeListRepository.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation

protocol AnimeListRepositroy {
    func provideGetAnimeList() async throws -> AnimeList
}
