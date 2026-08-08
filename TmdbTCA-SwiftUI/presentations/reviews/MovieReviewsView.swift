//
//  MovieReviewsView.swift
//  TmdbTCA-SwiftUI
//
//  Created by JAVARENT on 08/08/26.
//

import ComposableArchitecture
import SwiftUI

struct MovieReviewsView: View {
    @Bindable var store: StoreOf<MovieReviewsFeature>
    
    var body: some View {
        List(store.reviews) { review in
            VStack {
                Text(review.content)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer().frame(height: 20)
                
                Text(review.author)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                AsyncImage(url: URL(string: review.authorDetails?.avatarPath ?? "")) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(width: 50, height: 50)
                .clipped()
            }
            .onAppear {
                store.send(.loadMoreIfNeeded(currentReview: review))
            }
        }
        .scrollContentBackground(.hidden)
        .background(.clear)
        .navigationTitle("Reviews")
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
