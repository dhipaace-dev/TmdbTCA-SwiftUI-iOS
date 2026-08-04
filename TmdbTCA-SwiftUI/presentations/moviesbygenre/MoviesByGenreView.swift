//
//  MoviesByGenreView.swift
//  TmdbTCA-SwiftUI
//
//  Created by JAVARENT on 04/08/26.
//

import ComposableArchitecture
import SwiftUI

struct MoviesByGenreView: View {
    @Bindable var store: StoreOf<MoviesByGenreFeature>
    
    var body: some View {
        List(store.movies) { movie in
            HStack {
                AsyncImage(url: URL(string: movie.imageUrl)) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(width: 100, height: 150)
                .clipped()
                
                VStack {
                    Text(movie.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(movie.overview)
                        .lineLimit(5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                }
            }
            .onTapGesture {
                store.send(.movieTapped(movie))
            }
            .onAppear {
                store.send(.loadMoreIfNeeded(currentMovie: movie))
            }
        }
        .scrollContentBackground(.hidden)
        .background(.clear)
        .navigationTitle("Movies")
        .onAppear {
            store.send(.onAppear)
        }
        .overlay {
            if store.isLoading {
                ProgressView("Loading...")
            } else if let error = store.errorMessage {
                Text("Error: \(error)").foregroundColor(.red)
            }
        }
    }
}
