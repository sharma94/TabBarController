//
//  UserModel.swift
//  TabBarController
//
//  Created by R M Sharma on 09/05/21.
//

import Foundation
import SwiftUI

struct UserInfo: Codable {
    
    var per_page: Int
    var total: Int
    var total_pages: Int
    var page: Int
    var data: [UserData]
    var support: Support
}

struct Support: Codable {
    var url: String
    var text: String
}

struct UserData: Codable, Identifiable {
    
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}

//"id":1,
//"email":"george.bluth@reqres.in",
//"first_name":"George",
//"last_name":"Bluth",
//"avatar":"https://reqres.in/img/faces/1-image.jpg"
