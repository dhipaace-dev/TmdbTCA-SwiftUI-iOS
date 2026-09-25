//
//  GenreView.swift
//  TmdbTCA-SwiftUI
//
//  Created by JAVARENT on 04/08/26.
//

import ComposableArchitecture
import SwiftUI

public struct GenreView: View {
    @Bindable var store: StoreOf<GenreFeature>
    
    public init(store: StoreOf<GenreFeature>) {
        self.store = store
    }
    
    public var body: some View {
        List(store.genres) { genre in
            Text(genre.name)
                .bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black, lineWidth: 1)
                )
                .onTapGesture {
                    store.send(.genreTapped(genre))
                }
        }
        .scrollContentBackground(.hidden)
        .background(.clear)
        .navigationTitle("Genres")
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
