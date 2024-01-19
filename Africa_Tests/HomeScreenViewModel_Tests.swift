//
//  HomeScreenViewModel_Tests.swift
//  Africa_Tests
//
//  Created by Maxwell Santos Farias on 18/01/24.
//

import XCTest
import Combine
@testable import Africa

final class HomeScreenViewModel_Tests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    @Injected(\.persistenceController) var persistenceController
    
    override func setUpWithError() throws {}
    
    override func tearDownWithError() throws {}
    
    func test_HomeScreenViewModel_fetchAnimals_doesReturnItems() {
        let viewModel = HomeScreenViewModel(databaseRequestUseCase: DatabaseResquestUseCase())
        let expectation = XCTestExpectation(description: "Should return array of [Animal] after 3 seconds")
        var animalsMock: [AnimalModel] = []
        do {
            animalsMock = try Bundle.main.decode("animals.json")
        } catch (let error) {
            XCTFail(error.localizedDescription)
        }
        
        viewModel.$animals
            .dropFirst()
            .sink { animals in
                for animalMock in animalsMock {
                    if let animal = animals.first(where: { $0.id == animalMock.id}) {
                        if (animal.name != animalMock.name ||
                            animal.headline != animalMock.headline ||
                            animal.animalDescription != animalMock.description ||
                            animal.link != animalMock.link ||
                            animal.image != animalMock.image ||
                            animal.gallery != animalMock.gallery ||
                            animal.fact != animalMock.fact) {
                            
                            XCTFail()
                        }
                        
                    } else {
                        XCTFail()
                    }
                }
                expectation.fulfill()
            }
            .store(in: &cancellables)
        viewModel.fetchAnimals()
        
        
        wait(for: [expectation], timeout: 3)
        XCTAssertFalse(animalsMock.isEmpty)
    }
    
    func test_HomeScreenViewModel_fetchCoverImages_doesReturnItems() {
        let viewModel = HomeScreenViewModel(databaseRequestUseCase: DatabaseResquestUseCase())
        let expectation = XCTestExpectation(description: "Should return array of [CoverImage] after 3 seconds")
        var coverImages: [CoverImageModel] = []
        do {
            coverImages = try Bundle.main.decode("covers.json")
        } catch (let error) {
            XCTFail(error.localizedDescription)
        }
        
        viewModel.$coverImages
            .dropFirst()
            .sink { covers in
                for converImage in coverImages {
                    if let cover = covers.first(where: { $0.id == converImage.id}) {
                        if (cover.name != converImage.name) {
                            XCTFail()
                        }
                    } else {
                        XCTFail()
                    }
                }
                expectation.fulfill()
            }
            .store(in: &cancellables)
        viewModel.fetchCoverImages()
        
        
        wait(for: [expectation], timeout: 3)
        XCTAssertFalse(coverImages.isEmpty)
    }
    
}
