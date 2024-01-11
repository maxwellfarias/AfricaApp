//
//  RepositoryFactory.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 07/01/24.
//

import Foundation

protocol RepositoryFactoryProtocol {
    func createHomeRespository() -> DatabaseResquestRepositoryProtocol
}

class RespositoryFactory: RepositoryFactoryProtocol {
    func createHomeRespository() -> DatabaseResquestRepositoryProtocol {
        return DatabaseResquestRepository()
    }
}
