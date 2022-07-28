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
    
    @Published var anime: Anime
    
    init(anime: Anime) {
        self.anime = anime
    }
    
    func imageSize() -> CGFloat {
        return UIScreen.main.bounds.width / 4 - 24
    }
    
    func imageUrl() -> String {
        return anime.imageUrl ?? ""
    }
    
    func animeTitle() -> String {
        return anime.title ?? ""
    }
    
    func animeRank() -> Int {
        return Int(anime.rank)
    }
    
    func animeType() -> String {
        return anime.type ?? ""
    }
    
    func animeStartDate() -> String {
        return anime.startDate ?? ""
    }
}
