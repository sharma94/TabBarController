//
//  Address+CoreDataProperties.swift
//  TabBarController
//
//  Created by R M Sharma on 09/05/21.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var street: String?
    @NSManaged public var suite: String?
    @NSManaged public var city: String?
    @NSManaged public var zipcode: String?
    @NSManaged public var geo: Location?
    @NSManaged public var users: User?

}

extension Address : Identifiable {

}

@objc(Location)
public class Location: NSManagedObject {

}

extension Location: Identifiable {
    @NSManaged public var lat: String?
    @NSManaged public var lng: String?
}
