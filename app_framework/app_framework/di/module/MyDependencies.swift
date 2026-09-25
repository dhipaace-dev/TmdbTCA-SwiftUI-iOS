//
//  Dependencies.swift
//  TmdbTCA-SwiftUI
//
//  Created by JAVARENT on 08/08/26.
//

import ComposableArchitecture
//import Dependencies
import Foundation
import domain
import data

enum AppEnvironment {
    static let apiClient = ApiClient()
    static let dataSource: AppDataSource = RemoteDataSourceImpl(apiClient: apiClient)
    static let repository: AppRepository = AppRepositoryImpl(appDataSource: dataSource)
}

public enum GetMovieGenreUseCaseKey: DependencyKey {
    public static let liveValue: GetMovieGenreUseCase = GetMovieGenreUseCaseImpl(appRepository: AppEnvironment.repository)
}

public enum GetMovieByGenreUseCaseKey: DependencyKey {
    public static let liveValue: GetMovieByGenreUseCase = GetMovieByGenreUseCaseImpl(appRepository: AppEnvironment.repository)
}

public enum GetMovieDetailsUseCaseKey: DependencyKey {
    public static let liveValue: GetMovieDetailsUseCase = GetMovieDetailsUseCaseImpl(appRepository: AppEnvironment.repository)
}

public enum GetMovieReviewUseCaseKey: DependencyKey {
    public static let liveValue: GetMovieReviewUseCase = GetMovieReviewUseCaseImpl(appRepository: AppEnvironment.repository)
}

public enum GetMovieTrailerUseCaseKey: DependencyKey {
    public static let liveValue: GetMovieTrailerUseCase = GetMovieTrailerUseCaseImpl(appRepository: AppEnvironment.repository)
}

extension DependencyValues {
    public var getMovieGenreUseCase: GetMovieGenreUseCase {
        get { self[GetMovieGenreUseCaseKey.self] }
        set { self[GetMovieGenreUseCaseKey.self] = newValue }
    }
    
    public var getMovieByGenreUseCase: GetMovieByGenreUseCase {
        get { self[GetMovieByGenreUseCaseKey.self] }
        set { self[GetMovieByGenreUseCaseKey.self] = newValue }
    }
    
    public var getMovieDetailsUseCase: GetMovieDetailsUseCase {
        get { self[GetMovieDetailsUseCaseKey.self] }
        set { self[GetMovieDetailsUseCaseKey.self] = newValue }
    }
    
    public var getMovieReviewUseCase: GetMovieReviewUseCase {
        get { self[GetMovieReviewUseCaseKey.self] }
        set { self[GetMovieReviewUseCaseKey.self] = newValue }
    }
    
    public var getMovieTrailerUseCase: GetMovieTrailerUseCase {
        get { self[GetMovieTrailerUseCaseKey.self] }
        set { self[GetMovieTrailerUseCaseKey.self] = newValue }
    }
}
