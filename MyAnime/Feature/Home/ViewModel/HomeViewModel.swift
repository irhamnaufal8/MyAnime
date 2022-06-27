//
//  HomeViewModel.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    private let repository: AnimeListRepositroy
    
    @Published var isLoading = false
    @Published var error = ""
    @Published var isError = false
    @Published var animeListData = AnimeListResponse()
    
    init(repository: AnimeListRepositroy = AnimeListDefaultRepository()) {
        self.repository = repository
    }
    
    @MainActor func firstFetch() {
        self.isError = false
        self.error = ""
        self.isLoading = true
    }
    
    func getAnimeList() async {
        await firstFetch()
        
        do {
            let response = try await repository.provideGetAnimeList()
            
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                self?.animeListData = response
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                self?.isError = true
                self?.error = error.localizedDescription
            }
        }
    }
    
    func onAnimeListAppear() {
        Task.init {
            await getAnimeList()
        }
    }
    
    func isAnimeListEmpty() -> Bool {
        animeListData.isEmpty
    }
    
}
