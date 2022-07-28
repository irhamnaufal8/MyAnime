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
    @Published var animeListData = [Anime]()
    
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
            
            for item in response.top ?? [] {
                try self.repository.provideSaveToLocalAnimeList(by: item)
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
            }
            
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                self?.isError = true
                self?.error = "\(error)"
            }
        }
    }
    
    func loadLocalAnimeList() async {
        do {
            let data = try await repository.provideLoadLocalAnime()
            
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
    
    func isLocalEmpty() async -> Bool {
        do {
            let data = try await repository.provideLoadLocalAnime()
            
            return data.isEmpty
            
        } catch {
            return false
        }
    }
    
    func deleteItem() async {
        do {
            try repository.provideDeleteLocalItem()
        } catch {
            self.isLoading = false
            self.isError = true
            self.error = "\(error)"
        }
    }
    
    func onAnimeListAppear() {
        Task {
            let isEmptyOnLocal = await isLocalEmpty()
            if isEmptyOnLocal {

                await getAnimeList()
            }
//            await deleteItem()
            await loadLocalAnimeList()
            print(animeListData)
        }
    }
    
    func toggleFavorite(anime: Anime) {
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
