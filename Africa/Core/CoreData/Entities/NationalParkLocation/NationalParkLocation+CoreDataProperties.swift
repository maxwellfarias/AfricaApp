//
//  NationalParkLocation+CoreDataProperties.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 11/01/24.
//
//

import Foundation
import CoreData
import MapKit

extension NationalParkLocation {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<NationalParkLocation> {
        return NSFetchRequest<NationalParkLocation>(entityName: "NationalParkLocation")
    }
    
    @NSManaged public var id: String
    @NSManaged public var nameCD: String?
    @NSManaged public var imageCD: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    
    var name: String {nameCD ?? ""}
    var image: String {imageCD ?? ""}
    var location: CLLocationCoordinate2D {
      CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension NationalParkLocation : Identifiable {

}
