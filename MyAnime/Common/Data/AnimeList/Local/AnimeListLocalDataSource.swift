//
//  AnimeListLocalDataSource.swift
//  MyAnime
//
//  Created by Garry on 30/06/22.
//

import Foundation
import CoreData

protocol AnimeListLocalDataSource {
    func saveToLocalAnimeList(by anime: AnimeData) throws
    func loadLocalAnime() async throws -> [Anime]
    func deleteLocalItem() throws
    func toggleFavorite(by anime: Anime) throws
}
