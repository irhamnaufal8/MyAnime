//
//  ImageLoader.swift
//  MyAnime
//
//  Created by Garry on 27/06/22.
//

import SwiftUI

struct ImageLoader: View {
    
    var url: String
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        AsyncImage(
            url: URL(string: url),
            content: { phase in
                switch phase {
                case .empty:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .cornerRadius(10)
                @unknown default:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                }
            }
        )
    }
}

struct ImageLoader_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoader(url: "https://cdn.myanimelist.net/images/anime/1223/96541.jpg?s=faffcb677a5eacd17bf761edd78bfb3f")
    }
}
