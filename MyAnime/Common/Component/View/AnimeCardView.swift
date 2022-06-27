//
//  AnimeCard.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import SwiftUI

struct AnimeCardView: View {
    
    @ObservedObject var viewModel: AnimeCardViewModel
    
    var body: some View {
        HStack {
            ImageLoader(
                url: viewModel.imageUrl(),
                width: viewModel.imageSize(),
                height: viewModel.imageSize(),
                cornerRadius: 10
            )
            
            VStack(alignment: .leading) {
                Text(viewModel.animeTitle())
                    .font(.title3)
                    .bold()
                
                Text("Rank: \(viewModel.animeRank())")
                    .bold()
                
                Text(viewModel.animeType())
                
                Text(viewModel.animeStartDate())
            }
            
            Spacer()
        }
    }
}
