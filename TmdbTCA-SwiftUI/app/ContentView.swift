//
//  ContentView.swift
//  TmdbTCA-SwiftUI
//
//  Created by JAVARENT on 02/08/26.
//

import ComposableArchitecture
import SwiftUI
import feature_genre
import feature_movie_by_genre
import feature_movie_details
import feature_movie_review
import feature_movie_trailer
import feature_splash

struct ContentView: View {
    @Bindable var store: StoreOf<AppFeature>
    
    var body: some View {
        if store.showSplash {
            SplashView(store: store.scope(state: \.splash, action: \.splash))
        } else {
            NavigationStack(
                path: $store.scope(state: \.path, action: \.path)
            ) {
                GenreView(store: store.scope(state: \.genre, action: \.genre))
            } destination: { store in
                switch store.case {
                case let .moviesByGenre(store):
                    MoviesByGenreView(store: store)
                case let .movieDetails(store):
                    MovieDetailsView(store: store)
                case let .movieReviews(store):
                    MovieReviewsView(store: store)
                case let .movieTrailer(store):
                    MovieTrailerView(store: store)
                }
            }
        }
    }
}

#Preview {
    ContentView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
}
