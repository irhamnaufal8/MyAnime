//
//  AnimeListDefaultLocalDataSource.swift
//  MyAnime
//
//  Created by Garry on 30/06/22.
//

import Foundation
import CoreData
import SwiftUI

final class AnimeListDefaultLocalDataSource: AnimeListLocalDataSource {
    
    private let container: NSPersistentContainer
    
    init(container: NSPersistentContainer = PersistenceController.shared.container) {
        self.container = container
    }
    
    func saveToLocalAnimeList(by anime: AnimeData) throws {
        let entity = Anime(context: container.viewContext)
        
        entity.malId = Int64(anime.malId.orZero())
        entity.imageUrl = anime.imageUrl.orEmpty()
        entity.title = anime.title.orEmpty()
        entity.rank = Int64(anime.rank.orZero())
        entity.startDate = anime.startDate.orEmpty()
        entity.type = anime.type.orEmpty()
        
        if container.viewContext.hasChanges {
            try container.viewContext.save()
        }
    }
    
    func loadLocalAnime() async throws -> [Anime] {
        return try await withCheckedThrowingContinuation({ continuation in
            do {
                let fetchRequest = try container.viewContext.fetch(Anime.fetchRequest())
                
                continuation.resume(returning: fetchRequest)
            } catch {
                continuation.resume(throwing: error)
            }
        })
    }
    
    func deleteLocalItem() throws {
        Task.init {
            let item = try await loadLocalAnime()
            
            for item in item {
                container.viewContext.delete(item)
            }
        }
        
        if container.viewContext.hasChanges {
            try container.viewContext.save()
        }
    }
    
    func toggleFavorite(by anime: Anime) throws {
        anime.favorite.toggle()

        if container.viewContext.hasChanges {
            try container.viewContext.save()
        }
    }
}
