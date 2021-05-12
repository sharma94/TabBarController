//
//  CompanyView.swift
//  TabBarController
//
//  Created by R M Sharma on 09/05/21.
//

import SwiftUI
import CoreData

struct CompanyView: View {

    @FetchRequest(entity: User.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \User.name, ascending: true)]) var userData: FetchedResults<User>

    @ObservedObject var companyVM = CompanyViewModel()
    
    var body: some View {
        List(userData) { usr in

            CompanyRow(user: usr)
        }
    }
}

struct CompanyRow: View {

    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 5){
                Text(user.company?.name ?? "")
                    .font(.headline)
                Text(user.company?.catchPhrase ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }.padding()
                
            Divider().padding(.top, -10)
                .foregroundColor(.primary)
            
            HStack {
                Text(user.email ?? "")
                Spacer()
                Text(user.address?.city ?? "")
            }.frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(Color.blue)
            .padding()
            .font(.body)
        }
       
        .cornerRadius(15)
        .overlay(
                RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 1)
            )
        
        
    }
    
}
