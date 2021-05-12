//
//  CompanyViewModel.swift
//  TabBarController
//
//  Created by R M Sharma on 10/05/21.
//

import Foundation
import Combine
import CoreData

class CompanyViewModel: ObservableObject {
    
    @Published var users = [User]()
   
    func loadData(context: NSManagedObjectContext) {
            guard let url = URL(string: "Https://jsonplaceholder.typicode.com/users") else {
                print("Your API end point is Invalid")
                return
            }
            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                        print("Error with fetching films: \(error)")
                        return
                      }
                
                let decoder = JSONDecoder()
                decoder.userInfo[CodingUserInfoKey.context!] = context
                
                if let data = data,
                    let dataSummary = try? decoder.decode([User].self, from: data) {

                    DispatchQueue.main.async {
                        self.users = dataSummary
                        try? context.save()
                      }
                }
                
            }.resume()
    }

}
