//
//  MainScreenView.swift
//  LightPlant
//
//  Created by Russell Floyd Jr. on 3/29/23.
//

import SwiftUI


//@MainActor
//class PlantsModel: ObservableObject {
//    @Published var plants : [Plant] = []
//
//
//    func reload()async {
//
//        let url = URL(string: "https://house-plants2.p.rapidapi.com/all")!
//
//        let urlSession = URLSession.shared
//
//        do {
//
//            let (data, _) = try await urlSession.data(from: url)
//
//            self.plants = try JSONDecoder().decode([Plant].self, from: data)
//
//        }
//
//        catch {
//
//            debugPrint("Error loading \(url): \(String(describing: error))")
//
//        }
//
//    }
//}

class PlantsModel : ObservableObject {
    @Published var plants : [Plant] = []
    @Published var plant: Plant = Plant()
////     let url = URL(string: "https://house-plants2.p.rapidapi.com/all")!
//    let url = URL(string: "https://rapidapi.com")!
    
    func reload() async throws {
        let headers = [
            "X-RapidAPI-Key": "133b9a3733msh8ae7e74f8a817e6p1cf215jsn816edac15404",
            "X-RapidAPI-Host": "house-plants2.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://house-plants2.p.rapidapi.com/all")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
//        let(_, _) = try! await session.data(from: url)
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error ?? "")
            } else {
                _ = response as? HTTPURLResponse

                //                print(httpResponse)
                
                DispatchQueue.main.async {
                    self.plants = try! JSONDecoder().decode([Plant].self, from: data!)
                    print(self.plant.id)
                }
            }
        })

        dataTask.resume()
    }
}





struct MainScreenView: View {
    
    @StateObject var plantsModel = PlantsModel()
    
//    private var data: [Int] = Array(1...10)
    
//    private var data: [Int] = Array(1...10)
//
//      private let adaptiveColumns = [
//          GridItem(.adaptive(minimum: 170))
//      ]
    
    @State private var showingAlert = false
    
    
    
    var body: some View {
        
        NavigationView {
                ZStack {
                    (Color("HomepageColor"))
                        .ignoresSafeArea()
                    
                    List(plantsModel.plants) { plant in
                        
                         
                        if plant.firstCommonName != "" {
                            NavigationLink(plant.firstCommonName) {
                               
                                ScrollView {
                                VStack {
                                    Text(plant.firstCommonName)
                                        .bold()
//
                                    Image("plant")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .clipShape(RoundedRectangle(cornerRadius: 100))
                                        .padding()
                                        .padding()
                                    
                                    Text("Water 2-3 times a day")
                                        .background(Rectangle().fill(Color("GreenPlant")).shadow(radius: 3))
                                    Spacer()
                                    Spacer()
                                    Text("Reccomended 800 Lux")
                                        .background(Rectangle().fill(Color("GreenPlant")).shadow(radius: 3))
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    HStack {
                                        Image(systemName: "plus")
                                        Text("Add Plant")
                                            .background(Rectangle().fill(Color.white).shadow(radius: 3))
                                        }
                                        }
                                    
                                    
                                    

                                  }
                                }
                            }
                        }
                    .navigationTitle("Planted")

                    }
                    
                    
                    .alert("Important Message", isPresented: $showingAlert){
                        Button("OK", role: .cancel){
                        }}
                    
                    
                    
                    .task {
                        do{
                            try await self.plantsModel.reload()
                        } catch {
                            showingAlert = true
                        }
                    }
                    .refreshable {
                        do{
                            try await self.plantsModel.reload()
                        }catch {
                            showingAlert = true
                            
                        }
                    }
        
        
        
//                        ScrollView {
//
////                            List (PlantsModel.plants) {
//                                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
//                                    ForEach(data, id: \.self) { number in
//                                        ZStack {
//
//                                            RoundedRectangle(cornerRadius: 15)
//                                                .frame(width: 150, height: 150)
//                                        }
//                                    }
//                                }
//
//
////                            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
////                                ForEach(Plant, id: \.self) { number in
////                                    ZStack {
////                                        RoundedRectangle(cornerRadius: 15)
////                                            .frame(width: 150, height: 150)
////                                    }
////                                }
////                            }
//
//                        }
//                        .navigationTitle("Planted")
//                        .foregroundColor(.white)
        
                    }
//                .navigationTitle("Planted")
        
                }
        
        
        
        
        
    }













struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
