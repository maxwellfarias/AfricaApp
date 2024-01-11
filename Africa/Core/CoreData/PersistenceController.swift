//
//  PersistenceController.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 06/01/24.
//

import CoreData

enum PreloadResult {
    case success
    case failure(String)
}

//MODIFICAR PARA INJECAO DE DEPENDENCIA - FABRIC PATTERN
//COLOCAR PROTOCOLOS PARA TODAS AS FUNCOES
//IMPLEMENTAR OS TESTES
struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "CoredataBase")
        container.loadPersistentStores { description, error in
            if let error {
                print("Error loading coredata: \(error.localizedDescription)")
            } else {
                print("Successfully loaded core data!")
            }
        }
    }
    
    func fetch<T: NSManagedObject>(_ type: T.Type, completion: @escaping (FetchResult) -> Void) {
        if !UserDefaults.standard.bool(forKey: "isLoadedData") {
            
            preloadData { result in
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                    
                case .success:
                    let fetchRequest = NSFetchRequest<T>(entityName: NSStringFromClass(T.self))
                    let sort = NSSortDescriptor(key: "id", ascending: true)
                    fetchRequest.sortDescriptors = [sort]
                    
                    do {
                        let searchResult = try container.viewContext.fetch(fetchRequest)
                        completion(.success(searchResult))
                    } catch let error {
                        completion(.failure("Error fetching: \(error.localizedDescription)"))
                    }
                }
            }
        } else {
            let fetchRequest = NSFetchRequest<T>(entityName: NSStringFromClass(T.self))
            let sort = NSSortDescriptor(key: "id", ascending: true)
            fetchRequest.sortDescriptors = [sort]
            
            do {
                let searchResult = try container.viewContext.fetch(fetchRequest)
                completion(.success(searchResult))
            } catch let error {
                completion(.failure("Error fetching: \(error.localizedDescription)"))
            }
        }
    }
    
    //    A CLASSE DEVE SER GENERICA,n
    
    
    //    PASSAR UM GENERICO E UMA URL DO ARQUIVO
    private func preloadData(completion: @escaping (PreloadResult) -> Void){
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")
        let coverImages: [CoverImageModel] = Bundle.main.decode("covers.json")
        
        do {
            try saveAnimalsData(animals: animals)
            try saveCoverImages(converImages: coverImages)
            completion(.success)
            
        } catch (let error){
            completion(.failure(error.localizedDescription))
        }
    }
    
    private func saveAnimalsData(animals: [AnimalModel]) throws {
        for animal in animals {
            let animalToSave = Animal(context: container.viewContext)
            animalToSave.id = animal.id
            animalToSave.nameCD = animal.name
            animalToSave.headlineCD = animal.headline
            animalToSave.animalDescriptionCD = animal.description
            animalToSave.linkCD = animal.link
            animalToSave.imageCD = animal.image
            animalToSave.galleryCD = animal.gallery
            animalToSave.factCD = animal.fact
        }
        
        try container.viewContext.save()
        
        UserDefaults.standard.setValue(true, forKey: "isLoadedData")
        print("Animal datas saved in coredata")
    }
    
    private func saveCoverImages(converImages: [CoverImageModel]) throws {
        for coverImage in converImages {
            let coverImageToSave = CoverImage(context: container.viewContext)
            coverImageToSave.id = coverImage.id
            coverImageToSave.nameCD = coverImage.name
        }
        
        try container.viewContext.save()
    }
}
