//
//  CompanyView.swift
//  TabBarController
//
//  Created by R M Sharma on 09/05/21.
//

import SwiftUI

struct CompanyView: View {
    
    @ObservedObject var companyVM = CompanyViewModel()
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        
        List(companyVM.users) { usr in
            CompanyRow(user: usr)
        }.onAppear(perform: fetch)
    }
    
    func fetch() {
        companyVM.loadData()
    }
}

struct CompanyView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyView()
    }
}

struct CompanyRow: View {
   // var company: CompanyInfo
    var user: Users
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 5){
                Text(user.company.name)
                    .font(.headline)
                Text(user.company.catchPhrase)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }.padding()
                
            Divider().padding(.top, -10)
                .foregroundColor(.primary)
            
            HStack {
                Text(user.email)
                Spacer()
                Text(user.address.city)
            }.frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(Color.blue)
            .padding()
    
        }
       
        .cornerRadius(15)
        .overlay(
                RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 1)
            )
        
        
    }
    
}
