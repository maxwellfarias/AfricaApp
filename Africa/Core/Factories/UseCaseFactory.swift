//
//  UseCaseFactory.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 07/01/24.
//

import Foundation

protocol UseCaseFactoryProtocol {
    func createHomeUseCase() -> DatabaseResquestUseCaseProtocol
}

class UseCaseFactory: UseCaseFactoryProtocol {
    func createHomeUseCase() -> DatabaseResquestUseCaseProtocol {
        return DatabaseResquestUseCase()
    }
}

