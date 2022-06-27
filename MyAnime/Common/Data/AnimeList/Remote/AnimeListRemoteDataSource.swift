//
//  AnimeListRemoteDataSource.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation

protocol AnimeListRemoteDataSource {
    func getAnimeList() async throws -> AnimeList
}
