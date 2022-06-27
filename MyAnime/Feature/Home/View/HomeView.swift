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
                    List($viewModel.animeListData, id: \.top[0].malId) { item in
                        AnimeCardView(viewModel: AnimeCardViewModel(anime: item.wrappedValue))
                    }
                    .listStyle(PlainListStyle())
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
