//
//  User+CoreDataClass.swift
//  TabBarController
//
//  Created by R M Sharma on 11/05/21.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case id, email, name, phone, username, website, company, address
      }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(phone, forKey: .phone)
        try container.encode(username, forKey: .username)
        try container.encode(website, forKey: .website)
        try container.encode(address, forKey: .address)
        try container.encode(company, forKey: .company)
        
      }
    
    required convenience public init(from decoder: Decoder) throws {

        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else { //fatalError()
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else { fatalError() }

        self.init(entity: entity, insertInto: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int16.self, forKey: .id)!
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.website = try container.decodeIfPresent(String.self, forKey: .website)
        self.company = try container.decodeIfPresent(Company.self, forKey: .company)
        self.address = try container.decodeIfPresent(Address.self, forKey: .address)
    }
}
