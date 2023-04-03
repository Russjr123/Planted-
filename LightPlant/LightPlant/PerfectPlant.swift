//
//  PerfectPlant.swift
//  LightPlant
//
//  Created by Russell Floyd Jr. on 3/29/23.
//

import Foundation


struct Plant: Identifiable, Decodable, Hashable {
    
            enum CodingKeys: String, CodingKey {
                case id
                case commonNames = "Common name"
                case latinName = "Latin name"
//                case img = ""
//
            }
    
    
    let id: String
    
//    var img: String
//
    var latinName: String
    
    var commonNames: [String]? = nil
    
    var firstCommonName: String {

        guard let names = commonNames, !names.isEmpty else {
            return ""
        }
        return names[0].capitalized
    }
    
//    var image: String
//    var tempMax : String
//    var tempMin : String
//    var lightIdeal : Int
//    var watering : String
//    var use: String
//    var img: URL
    

    
    
    
//    var firstCommonName: String
//
//        guard let names = commonNames else {
//            return ""
//        }
//        return names[0].capitalized
//    }
     
//
//     var image: String
//     var tempMax : String
//     var tempMin : String
//     var lightIdeal : Int
//     var watering : String
//     var use: String
    
    
    init() {
        
        
        self.id = "0"
        commonNames = []
latinName = ""

            }


    }
    
    class PerfectPlant : ObservableObject {
        @Published var plants : [Plant] = []
        @Published var plant: Plant = Plant()
        // let url = URL(string: "https://house-plants2.p.rapidapi.com/all")!
        let url = URL(string: "https://rapidapi.com")!

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
            let(_, _) = try! await session.data(from: url)
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

//
//
//
//
//
//
