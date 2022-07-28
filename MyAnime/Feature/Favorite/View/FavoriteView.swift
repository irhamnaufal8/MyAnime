//
//  FavoriteView.swift
//  MyAnime
//
//  Created by Garry on 30/06/22.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var viewModel = FavoriteViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isError {
                    Text(viewModel.error)
                } else {
                    
                    if let data = viewModel.animeListData {
                        List(data, id:\.malId) { item in
                            AnimeCardView(
                                viewModel: AnimeCardViewModel(anime: item),
                                isFavorite: item.favorite
                                
                            )
                            .swipeActions(content: {
                                Button {
                                    viewModel.removeFromFavorite(anime: item)
                                } label: {
                                    Image(systemName: "trash.fill")
                                }
                                .tint(.red)

                            })
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                
            }
            .navigationBarTitle(LocalizableText.favoriteScreenTitle)
            .onAppear(perform: {
                viewModel.onAnimeListAppear()
            })
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
