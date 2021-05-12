//
//  Address+CoreDataProperties.swift
//  TabBarController
//
//  Created by R M Sharma on 12/05/21.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var city: String?
    @NSManaged public var street: String?
    @NSManaged public var suite: String?
    @NSManaged public var zipcode: String?
    @NSManaged public var user: User?
    @NSManaged public var geo: Location?

}

extension Address : Identifiable {

}
