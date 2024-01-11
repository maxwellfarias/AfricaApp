//
//  ViewModelFactory.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 07/01/24.
//

import Foundation

protocol ViewModelFactoryProtocol {
    func createHomeViewModel() -> HomeScreenViewModel
}

class ViewModelFactory: ViewModelFactoryProtocol {
    @Injected(\.useCaseFactory) var useCaseFactory
    
    func createHomeViewModel() -> HomeScreenViewModel {
        return HomeScreenViewModel(databaseRequestUseCase: useCaseFactory.createHomeUseCase())
    }
}
