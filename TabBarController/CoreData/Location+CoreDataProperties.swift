//
//  Location+CoreDataProperties.swift
//  TabBarController
//
//  Created by R M Sharma on 12/05/21.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var lat: String?
    @NSManaged public var lng: String?
    @NSManaged public var geo: Address?

}

extension Location : Identifiable {

}
