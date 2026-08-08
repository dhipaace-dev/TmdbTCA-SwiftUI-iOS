//
//  MovieTrailerView.swift
//  TmdbTCA-SwiftUI
//
//  Created by JAVARENT on 08/08/26.
//

import ComposableArchitecture
import SwiftUI

struct MovieTrailerView: View {
    @Bindable var store: StoreOf<MovieTrailerFeature>
    
    var body: some View {
        Group {
            if let movieKey = store.movieKey, !movieKey.isEmpty, let url = URL(string: "https://www.youtube.com/embed/\(movieKey)") {
                WebView(url: url)
                    .frame(height: 250)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            store.send(.onAppear)
        }
    }
}
