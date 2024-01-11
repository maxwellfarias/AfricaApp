//
//  CoverImage+CoreDataProperties.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 11/01/24.
//
//

import Foundation
import CoreData


extension CoverImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoverImage> {
        return NSFetchRequest<CoverImage>(entityName: "CoverImage")
    }

    @NSManaged public var id: Int16
    @NSManaged public var nameCD: String?
    
    var name: String {nameCD ?? ""}
}

extension CoverImage : Identifiable {

}
