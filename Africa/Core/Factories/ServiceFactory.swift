//
//  ServiceFactory.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 12/01/24.
//

import Foundation

protocol ServiceFactoryProtocol {
    func createPersistenceController() -> PersistenceControllerProtocol
}

class ServiceFactory: ServiceFactoryProtocol {
    func createPersistenceController() -> PersistenceControllerProtocol {
        return PersistenceController()
    }
    
    
}


//protocol ViewModelFactoryProtocol {
//    func createHomeViewModel() -> HomeScreenViewModel
//}
//
//class ViewModelFactory: ViewModelFactoryProtocol {
//    @Injected(\.useCaseFactory) var useCaseFactory
//    
//    func createHomeViewModel() -> HomeScreenViewModel {
//        return HomeScreenViewModel(databaseRequestUseCase: useCaseFactory.createHomeUseCase())
//    }
//}

