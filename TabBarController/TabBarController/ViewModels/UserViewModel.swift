//
//  UserViewModel.swift
//  TabBarController
//
//  Created by R M Sharma on 09/05/21.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var userDetails = [UserData]()
    
    init() {
        loadData()
    }
    

    func loadData() {
            guard let url = URL(string: "https://reqres.in/api/users?page=1") else {
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
                        let dataSummary = try? JSONDecoder().decode(UserInfo.self, from: data) {
                    DispatchQueue.main.async {
                        self.userDetails = dataSummary.data
                      }
                }
           
            }.resume()
        }

   
}
