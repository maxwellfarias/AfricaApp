//
//  MapViewModel.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 15/01/24.
//

import Foundation

class MapViewModel: ObservableObject {
    @Published var locations: [NationalParkLocation] = []
    
    var databaseRequestUseCase: DatabaseResquestUseCaseProtocol
    
    init(databaseRequestUseCase: DatabaseResquestUseCaseProtocol) {
        self.databaseRequestUseCase = databaseRequestUseCase
        fetchLocations()
    }

    func fetchLocations() {
        databaseRequestUseCase.fetchArrayOf(NationalParkLocation.self) { result in
            switch result {
            case .success(let locationResult):
                if let locations = locationResult as? [NationalParkLocation] {
                    self.locations = locations
                } else {
                    print("Failed when trying to convert list to type NationalParkLocation")
                }
            case .failure(let error):
                print("Error when fetching for locations in the database: \(error.description)")
            }
        }
    }
    
    
}
