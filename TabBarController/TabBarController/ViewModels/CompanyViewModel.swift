//
//  CompanyViewModel.swift
//  TabBarController
//
//  Created by R M Sharma on 10/05/21.
//

import Foundation
import Combine

class CompanyViewModel: ObservableObject {
    
    @Published var users = [Users]()
    
    init() {
        loadData()
    }
    
    func loadData() {
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
                
                if let data = data,
                        let dataSummary = try? JSONDecoder().decode([Users].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = dataSummary
                      }
                }
           
            }.resume()
        }
}
