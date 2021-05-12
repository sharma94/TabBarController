//
//  Company+CoreDataProperties.swift
//  TabBarController
//
//  Created by R M Sharma on 11/05/21.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var bs: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var name: String?
    @NSManaged public var people: User?

}

extension Company : Identifiable {
    

}
