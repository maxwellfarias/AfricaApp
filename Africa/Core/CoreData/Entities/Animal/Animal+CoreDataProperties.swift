//
//  Animal+CoreDataProperties.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 11/01/24.
//
//

import Foundation
import CoreData

extension Animal {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Animal> {
        return NSFetchRequest<Animal>(entityName: "Animal")
    }
    
    @NSManaged public var animalDescriptionCD: String?
    @NSManaged public var factCD: [String]?
    @NSManaged public var galleryCD: [String]?
    @NSManaged public var headlineCD: String?
    @NSManaged public var id: String
    @NSManaged public var imageCD: String?
    @NSManaged public var linkCD: String?
    @NSManaged public var nameCD: String?
    
    public var animalDescription: String { animalDescriptionCD ?? ""}
    public var fact: [String] { factCD ?? []}
    public var gallery: [String] { galleryCD ?? []}
    public var headline: String { headlineCD ?? ""}
    public var image: String { imageCD ?? ""}
    public var link: String { linkCD ?? ""}
    public var name: String { nameCD ?? ""}
    
}

extension Animal : Identifiable {
    
}
