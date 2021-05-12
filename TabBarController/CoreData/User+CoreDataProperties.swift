//
//  User+CoreDataProperties.swift
//  TabBarController
//
//  Created by R M Sharma on 11/05/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var username: String?
    @NSManaged public var website: String?
    @NSManaged public var company: Company?
    @NSManaged public var address: Address?

}

extension User : Identifiable {
    
}

extension CodingUserInfoKey {
   static let context = CodingUserInfoKey(rawValue: "context")
}

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}
