//
//  AnimeCardViewModel.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation
import SwiftUI

final class AnimeCardViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var rank: Int = 0
    
    @Published var anime: AnimeList
    
    init(anime: AnimeList) {
        self.anime = anime
    }
    
    func imageSize() -> CGFloat {
        return UIScreen.main.bounds.width / 4 - 24
    }
    
    func imageUrl() -> String {
        return anime.top[0].imageUrl ?? ""
    }
    
    func animeTitle() -> String {
        return anime.top[0].title ?? ""
    }
    
    func animeRank() -> Int {
        return anime.top[0].rank ?? 0
    }
    
    func animeType() -> String {
        return anime.top[0].type ?? ""
    }
    
    func animeStartDate() -> String {
        return anime.top[0].startDate ?? ""
    }
}
