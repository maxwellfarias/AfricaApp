//
//  VideoListViewModel.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 15/01/24.
//

import Foundation

class VideoListViewModel:ObservableObject {
    @Published var videos: [AnimalVideo] = []
    
    var databaseRequestUseCase: DatabaseResquestUseCaseProtocol
    
    init(databaseRequestUseCase: DatabaseResquestUseCaseProtocol) {
        self.databaseRequestUseCase = databaseRequestUseCase
        fetchVideos()
    }

    func fetchVideos() {
        databaseRequestUseCase.fetchArrayOf(AnimalVideo.self) { result in
            switch result {
            case .success(let videosResult):
                if let videos = videosResult as? [AnimalVideo] {
                    self.videos = videos
                } else {
                    print("Failed when trying to convert list to type AnimalVide")
                }
            case .failure(let error):
                print("Error when fetching for videos in the database: \(error.description)")
            }
        }
    }
}
