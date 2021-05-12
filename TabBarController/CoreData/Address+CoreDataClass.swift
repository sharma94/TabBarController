//
//  Address+CoreDataClass.swift
//  TabBarController
//
//  Created by R M Sharma on 11/05/21.
//
//

import Foundation
import CoreData
import Combine

@objc(Address)
public class Address: NSManagedObject, Codable {
    
    enum CodingKeys: CodingKey {
        case street, suite, city, zipcode, geo
      }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(street, forKey: .street)
        try container.encode(suite, forKey: .suite)
        try container.encode(city, forKey: .city)
        try container.encode(geo, forKey: .geo)
      }
    
    required convenience public init(from decoder: Decoder) throws {

        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else { fatalError() //throw DecoderConfigurationError.missingManagedObjectContext
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "Address", in: context) else { fatalError() }

        self.init(entity: entity, insertInto: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decodeIfPresent(String.self, forKey: .street)!
        self.suite = try container.decodeIfPresent(String.self, forKey: .suite)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
        self.geo = try container.decodeIfPresent(Location.self, forKey: .geo)
    }
}
