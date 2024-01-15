//
//  UseCaseFactory.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 07/01/24.
//

import Foundation

protocol UseCaseFactoryProtocol {
    func createDatabaseRequestUseCase() -> DatabaseResquestUseCaseProtocol
}

class UseCaseFactory: UseCaseFactoryProtocol {
    func createDatabaseRequestUseCase() -> DatabaseResquestUseCaseProtocol {
        return DatabaseResquestUseCase()
    }
}

