//
//  AnimalVideo+CoreDataProperties.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 12/01/24.
//
//

import Foundation
import CoreData


extension AnimalVideo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnimalVideo> {
        return NSFetchRequest<AnimalVideo>(entityName: "AnimalVideo")
    }

    @NSManaged public var id: String
    @NSManaged public var nameCD: String?
    @NSManaged public var headlineCD: String?
    
    var name: String {nameCD ?? ""}
    var headline: String {headlineCD ?? ""}
    var thumbnail: String {
      "video-\(id)"
    }
}

extension AnimalVideo : Identifiable {

}
