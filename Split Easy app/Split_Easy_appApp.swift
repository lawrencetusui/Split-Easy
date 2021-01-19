//
//  Split_Easy_appApp.swift
//  Split Easy app
//
//  Created by Lawrence Tsui on 19/1/21.
//

import SwiftUI

@main
struct Split_Easy_appApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                
                NavigationView{
                    SplashView()
                }
                .tabItem{
                    
                    Image(systemName:"face.dashed")
                    
                    Text("Welcome")
                }
                NavigationView{
                    EnterFriends()
                }
                .tabItem{
                    
                    Image(systemName:"person.fill.viewfinder")
                    
                    Text("Enter friends and amount")
                }
                NavigationView{
                    Display()
                }
                .tabItem{
                    Image(systemName: "dollarsign.square")
                    Text("Calculate")
                }
                
            }
        }
    }}
