//
//  MyPlantsView.swift
//  LightPlant
//
//  Created by Russell Floyd Jr. on 3/29/23.
//

import SwiftUI

struct MyPlantsView: View {
    
    

//    private var data: [Int] = Array(1...2)
//
//      private let adaptiveColumns = [
//          GridItem(.adaptive(minimum: 170))
//      ]
    
    
    
    var body: some View {
        
        
        NavigationView {
        
                ZStack {
        
        
        
                    (Color("HomepageColor"))
                        .ignoresSafeArea()
        
        
        
                        ScrollView {
//                            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
//                                ForEach(data, id: \.self) { number in
//                                    ZStack {
//                                        RoundedRectangle(cornerRadius: 15)
//                                            .frame(width: 150, height: 150)
//                                    }
//                                }
//                            }
        
                        }
                        .navigationTitle("Planted")
                        .foregroundColor(.white)
        
                    }
        
                }
        
        
        
    }
}

struct MyPlantsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantsView()
    }
}
