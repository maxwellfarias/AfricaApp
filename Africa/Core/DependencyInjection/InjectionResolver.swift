//
//  InjectionResolver.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 06/01/24.
//

import Foundation

class InjectionResolver {
    static let shared: InjectionResolver = InjectionResolver()
    
    //MARK: - Factories
    lazy var respositoryFactory: RepositoryFactoryProtocol = RespositoryFactory()
    lazy var viewModelFactory: ViewModelFactoryProtocol = ViewModelFactory()
    lazy var useCaseFactory: UseCaseFactoryProtocol = UseCaseFactory()
    lazy var serviceFactory: ServiceFactoryProtocol = ServiceFactory()
    
    //MARK: - Repositories
    lazy var homeRespositoy: DatabaseResquestRepositoryProtocol = respositoryFactory.createHomeRespository()
    
    //MARK: - View Models
    lazy var homeViewModel: HomeScreenViewModel = viewModelFactory.createHomeViewModel()
    lazy var videoListViewModel: VideoListViewModel = viewModelFactory.createVideoListViewModel()
    lazy var mapViewModel: MapViewModel = viewModelFactory.createMapViewModel()
    lazy var galleryViewModel: GalleryViewModel = viewModelFactory.createGalleryViewModel()
    
    //MARK: - Service
    lazy var persistenceController: PersistenceControllerProtocol = serviceFactory.createPersistenceController()
    
}
