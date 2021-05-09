//
//  UsersView.swift
//  TabBarController
//
//  Created by R M Sharma on 09/05/21.
//

import SwiftUI
import Foundation
import Combine

struct UsersView: View {

    @ObservedObject var userVM = UserViewModel()
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        
        List(userVM.userDetails) { usr in
            UserRow(usr: usr)
        }
    }
}

struct UserRow: View {
    var usr: UserData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {

                HStack (alignment: .center, spacing: 5) {
                    NetworkImage(url: URL(string: usr.avatar))
                        .frame(width:50, height:50)
                        .cornerRadius(5)
                        .padding()
                    VStack(alignment: .leading){
                        Text(usr.first_name)
                        Text(usr.last_name)
                    }.font(.headline)
                }
                
            Divider().padding(.top, -10)
                .foregroundColor(.primary)
            Text(usr.email).padding(.bottom, 15)
               .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color.blue)
                
        }
        .cornerRadius(15)
        .overlay(
          RoundedRectangle(cornerRadius: 15)
           .stroke(lineWidth: 1)
        )
    }
    
}
