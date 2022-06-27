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
        NavigationView {
            ZStack {
                if viewModel.isError {
                    Text(viewModel.error)
                } else {

                    if let data = viewModel.animeListData?.top {
                        List(data, id:\.malId) { item in
                            AnimeCardView(viewModel: AnimeCardViewModel(anime: item))
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            
            }
            .navigationTitle("My Anime")
            .onAppear(perform: {
                viewModel.onAnimeListAppear()
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
