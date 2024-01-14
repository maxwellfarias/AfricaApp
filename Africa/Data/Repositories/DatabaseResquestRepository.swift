//
//  AnimalRepository.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 07/01/24.
//

import Foundation
import CoreData

enum FetchResult {
    case success([NSManagedObject])
    case failure(String)
}

protocol DatabaseResquestRepositoryProtocol {
    func fetchArrayOf<T: NSManagedObject>(_ type: T.Type, completion: @escaping (FetchResult) -> Void)
}

class DatabaseResquestRepository: DatabaseResquestRepositoryProtocol {
    @Injected(\.persistenceController) var persistenceController
    
    func fetchArrayOf<T: NSManagedObject>(_ type: T.Type, completion: @escaping (FetchResult) -> Void) {

        persistenceController.fetchArrayOf(T.self){ result in
            switch result {
            case .success (let animals):
                completion(.success(animals))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
