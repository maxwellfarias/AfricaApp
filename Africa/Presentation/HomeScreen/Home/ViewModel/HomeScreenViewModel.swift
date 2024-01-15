//
//  HomeScreenViewModel.swift
//  Africa
//
//  Created by user243853 on 1/5/24.
//

import Foundation
import CoreData

class HomeScreenViewModel: ObservableObject {
    
    @Published var animals: [Animal] = []
    @Published var coverImages: [CoverImage] = []
    @Published var locations: [NationalParkLocation] = []
    @Published var videos: [AnimalVideo] = []
    
    var databaseRequestUseCase: DatabaseResquestUseCaseProtocol
    
    init(databaseRequestUseCase: DatabaseResquestUseCaseProtocol) {
        self.databaseRequestUseCase = databaseRequestUseCase
        fetchAnimals()
        fetchCoverImages()
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

    func fetchCoverImages() {
        databaseRequestUseCase.fetchArrayOf(CoverImage.self) { result in
            switch result {
            case .success(let coverImagesResult):
                if let coverImages = coverImagesResult as? [CoverImage] {
                    self.coverImages = coverImages
                } else {
                    print("Failed when trying to convert list to type CoverImage")
                }
            case .failure(let error):
                print("Error when fetching for conver images in the database: \(error.description)")
            }
        }
    }
}
