//
//  ContentView.swift
//  TabBarController
//
//  Created by R M Sharma on 09/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var companyVM = CompanyViewModel()
    
    var body: some View {
        TabView {
            UsersView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Users")
                    }
            CompanyView()
                    .tabItem {
                        Image(systemName: "ellipsis.circle")
                        Text("More")
                    }
        }.onAppear{
            companyVM.loadData(context: viewContext)
        }
        .onDisappear{
            companyVM.deleteData(context: viewContext)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
