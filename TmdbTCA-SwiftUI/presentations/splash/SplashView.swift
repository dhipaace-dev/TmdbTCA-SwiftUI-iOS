//
//  SplashView.swift
//  TmdbTCA-SwiftUI
//
//  Created by JAVARENT on 04/08/26.
//

import ComposableArchitecture
import SwiftUI

struct SplashView: View {
    let store: StoreOf<SplashFeature>
    
    var body: some View {
        Text("TMDB App")
            .font(.largeTitle)
            .onAppear {
                store.send(.onAppeer)
            }
    }
}
