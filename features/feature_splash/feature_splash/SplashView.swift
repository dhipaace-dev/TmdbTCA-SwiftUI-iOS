//
//  SplashView.swift
//  TmdbTCA-SwiftUI
//
//  Created by JAVARENT on 04/08/26.
//

import ComposableArchitecture
import SwiftUI

public struct SplashView: View {
    let store: StoreOf<SplashFeature>
    
    public init(store: StoreOf<SplashFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Text("TMDB App")
            .font(.largeTitle)
            .onAppear {
                store.send(.onAppeer)
            }
    }
}
