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
    
    //MARK: - Repositories
    lazy var homeRespositoy: DatabaseResquestRepositoryProtocol = respositoryFactory.createHomeRespository()
    
    //MARK: - View Models
    lazy var homeViewModel: HomeScreenViewModel = viewModelFactory.createHomeViewModel()
    
    //MARK: - Service
//    COLOCAR O PERSISTENCE CONTROLLER
    
}
