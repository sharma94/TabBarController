//
//  Location+CoreDataClass.swift
//  TabBarController
//
//  Created by R M Sharma on 12/05/21.
//
//

import Foundation
import CoreData

@objc(Location)
public class Location: NSManagedObject, Codable {

    enum CodingKeys: CodingKey {
        case lat, lng
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lat, forKey: .lat)
        try container.encode(lng, forKey: .lng)
      }
    
    required convenience public init(from decoder: Decoder) throws {

        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else {  throw DecoderConfigurationError.missingManagedObjectContext
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "Location", in: context) else { fatalError() }

        self.init(entity: entity, insertInto: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lat = try container.decodeIfPresent(String.self, forKey: .lat)
        self.lng = try container.decodeIfPresent(String.self, forKey: .lng)
    }
}
