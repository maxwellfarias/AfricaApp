//
//  AnimalUseCase.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 07/01/24.
//

import Foundation
import CoreData

protocol DatabaseResquestUseCaseProtocol {
    func fetchArrayOf<T: NSManagedObject>(_ type: T.Type, completion: @escaping (FetchResult) -> Void)
}

class DatabaseResquestUseCase: DatabaseResquestUseCaseProtocol {
    @Injected(\.homeRespositoy) var homeRepository
    
    func fetchArrayOf<T: NSManagedObject>(_ type: T.Type, completion: @escaping (FetchResult) -> Void) {
        homeRepository.fetchArrayOf(T.self) { result in
            switch result {
            case .success(let animals):
                completion(.success(animals))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
