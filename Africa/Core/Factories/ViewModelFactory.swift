//
//  ViewModelFactory.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 07/01/24.
//

import Foundation

protocol ViewModelFactoryProtocol {
    func createHomeViewModel() -> HomeScreenViewModel
    func createVideoListViewModel() -> VideoListViewModel
    func createMapViewModel() -> MapViewModel
    func createGalleryViewModel() -> GalleryViewModel
}

class ViewModelFactory: ViewModelFactoryProtocol {
    @Injected(\.useCaseFactory) var useCaseFactory
    
    func createHomeViewModel() -> HomeScreenViewModel {
        return HomeScreenViewModel(databaseRequestUseCase: useCaseFactory.createDatabaseRequestUseCase())
    }
    
    func createVideoListViewModel() -> VideoListViewModel {
        return VideoListViewModel(databaseRequestUseCase: useCaseFactory.createDatabaseRequestUseCase())
    }
    
    func createMapViewModel() -> MapViewModel {
        return MapViewModel(databaseRequestUseCase: useCaseFactory.createDatabaseRequestUseCase())
    }
    
    func createGalleryViewModel() -> GalleryViewModel {
        return GalleryViewModel(databaseRequestUseCase: useCaseFactory.createDatabaseRequestUseCase())
    }
    
}
