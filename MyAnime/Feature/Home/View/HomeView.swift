//
//  ContentView.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        VStack {
            TabView {
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
                                            viewModel.toggleFavorite(anime: item)
                                        } label: {
                                            Image(systemName: "star.fill")
                                        }
                                        .tint(.yellow)

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
                    .navigationBarTitle(LocalizableText.homeScreenTitle)
                }
                .tabItem {
                    Image(systemName: "house")
                    Text(LocalizableText.homeScreenTitle)
                }
                .onAppear(perform: {
                    viewModel.onAnimeListAppear()
                })
                
                FavoriteView()
                    .tabItem {
                        Image(systemName: "star")
                        Text(LocalizableText.favoriteScreenTitle)
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
