//
//  MovieDetailsView.swift
//  TmdbTCA-SwiftUI
//
//  Created by JAVARENT on 04/08/26.
//

import ComposableArchitecture
import SwiftUI

public struct MovieDetailsView: View {
    @Bindable var store: StoreOf<MovieDetailsFeature>
    
    public init(store: StoreOf<MovieDetailsFeature>) {
        self.store = store
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(store.movie?.title ?? "")
                    .bold()
                
                Text(store.movie?.overview ?? "")
                
                Spacer()
                
                AsyncImage(url: URL(string: store.movie?.imageUrl ?? "")) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(width: 200, height: 300)
                .clipped()
                
                Spacer()
                
                Button("Show Reviews") {
                    store.send(.showReviewsTapped)
                }
                
                Button("Show Trailer") {
                    store.send(.showTrailerTapped)
                }
            }
            .padding()
        }
        .navigationTitle("Details")
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
