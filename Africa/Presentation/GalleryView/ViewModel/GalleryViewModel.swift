//
//  GalleryViewModel.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 15/01/24.
//

import Foundation
 
class GalleryViewModel: ObservableObject {
    @Published var animals: [Animal] = []
    
    var databaseRequestUseCase: DatabaseResquestUseCaseProtocol
    
    init(databaseRequestUseCase: DatabaseResquestUseCaseProtocol) {
        self.databaseRequestUseCase = databaseRequestUseCase
        fetchAnimals()
    }

    func fetchAnimals() {
        databaseRequestUseCase.fetchArrayOf(Animal.self) { result in
            switch result {
            case .success(let animalsResult):
                if let animals = animalsResult as? [Animal] {
                    self.animals = animals
                } else {
                    print("Failed when trying to convert list to type Animal")
                }
                
            case .failure(let error):
                print("Error when fetching for animals in the database: \(error.description)")
            }
        }
    }

}
