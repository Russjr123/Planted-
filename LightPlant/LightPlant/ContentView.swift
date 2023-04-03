//
//  ContentView.swift
//  LightPlant
//
//  Created by Russell Floyd Jr. on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.white
    }
  
    
    
    var body: some View {
        

        
        TabView {
        
        
                    MainScreenView()
                        .tabItem {
                            Label("Plants", systemImage: "camera.macro")
        
                        }
        
        
        
        
                    LightScannerView()
                        .tabItem {
                            Label("Scanner", systemImage: "barcode.viewfinder")
        
                        }
        
        
                    MyPlantsView()
                        .tabItem {
                            Label("My Plants", systemImage: "person")
        
                        }
        
                }
                .accentColor(Color("GreenPlant"))
                
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
