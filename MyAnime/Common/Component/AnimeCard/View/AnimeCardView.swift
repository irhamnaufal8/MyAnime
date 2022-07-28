//
//  AnimeCard.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import SwiftUI

struct AnimeCardView: View {
    
    @ObservedObject var viewModel: AnimeCardViewModel
    var isFavorite = false
    
    var body: some View {
        HStack {
            Text("\(viewModel.animeRank())")
                .font(.title2)
                .bold()
                .lineLimit(1)
            
            ImageLoader(
                url: viewModel.imageUrl(),
                width: viewModel.imageSize(),
                height: viewModel.imageSize()
            )
            
            VStack(alignment: .leading) {
                Text(viewModel.animeTitle())
                    .font(.title3)
                    .bold()
                    .lineLimit(2)
                
                Text(viewModel.animeType())
                    .lineLimit(1)
                
                Text(viewModel.animeStartDate())
                    .lineLimit(1)
            }
            
            Spacer()
            
            
            if isFavorite == true {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
        }
    }
}
