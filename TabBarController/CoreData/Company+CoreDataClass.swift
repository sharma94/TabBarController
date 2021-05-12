//
//  Company+CoreDataClass.swift
//  TabBarController
//
//  Created by R M Sharma on 11/05/21.
//
//

import Foundation
import CoreData

@objc(Company)
public class Company: NSManagedObject, Codable {

    enum CodingKeys: CodingKey {
        case name, catchPhrase, bs
      }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(catchPhrase, forKey: .catchPhrase)
        try container.encode(bs, forKey: .bs)
      }
    
    required convenience public init(from decoder: Decoder) throws {

        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else { fatalError() //throw DecoderConfigurationError.missingManagedObjectContext
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "Company", in: context) else { fatalError() }

        self.init(entity: entity, insertInto: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)!
        self.catchPhrase = try container.decodeIfPresent(String.self, forKey: .catchPhrase)
        self.bs = try container.decodeIfPresent(String.self, forKey: .bs)
        
    }
}
