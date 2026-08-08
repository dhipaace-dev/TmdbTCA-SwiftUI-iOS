//
//  TmdbTCA_SwiftUIApp.swift
//  TmdbTCA-SwiftUI
//
//  Created by JAVARENT on 02/08/26.
//

import ComposableArchitecture
import SwiftUI

@main
struct TmdbTCA_SwiftUIApp: App {
    let store = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
