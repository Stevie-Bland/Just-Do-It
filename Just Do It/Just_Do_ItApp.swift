//
//  Just_Do_ItApp.swift
//  Just Do It
//
//  Created by Steven on 3/16/23.
//

import SwiftUI

@main
struct Just_Do_ItApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            
        }
    }
}

