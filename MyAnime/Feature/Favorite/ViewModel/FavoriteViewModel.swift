//
//  FavoriteViewModel.swift
//  MyAnime
//
//  Created by Garry on 30/06/22.
//

import Foundation
import SwiftUI

final class FavoriteViewModel: ObservableObject {
    
    private let repository: AnimeListRepositroy
    
    @Published var isLoading = false
    @Published var error = ""
    @Published var isError = false
    @Published var animeListData = [Anime]()
    
    init(repository: AnimeListRepositroy = AnimeListDefaultRepository()) {
        self.repository = repository
    }
    
    @MainActor func firstFetch() {
        self.isError = false
        self.error = ""
        self.isLoading = true
    }
    
    func loadFavoriteLocalAnimeList() async {
        do {
            let data = try await repository.provideLoadLocalAnime().filter({ anime in
                anime.favorite == true
            })
            
            DispatchQueue.main.async { [weak self] in
                self?.animeListData = data
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                self?.isError = true
                self?.error = "\(error)"
            }
        }
    }
    
    func onAnimeListAppear() {
        Task {
            await loadFavoriteLocalAnimeList()
        }
    }
    
    func removeFromFavorite(anime: Anime) {
        do {
            try repository.provideToggleFavorite(by: anime)
            onAnimeListAppear()
            
        } catch {
            self.isLoading = false
            self.isError = true
            self.error = "\(error)"
        }
        
    }
}
