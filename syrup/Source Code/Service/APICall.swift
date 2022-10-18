//
//  APICall.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import Foundation

class APICall {
    
    static func fetchContentFromPantry() async -> Projects? {
        
        let pantryUrl = URL(string: "https://getpantry.cloud/apiv1/pantry/a0dee6d0-7947-44c1-8680-22574f763f16/basket/testBasket")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: pantryUrl)
            let decodedResponse = try JSONDecoder().decode(Projects.self, from: data)
            print("Managed to fetch data from Pantry")
            return decodedResponse
        } catch {
            print("Error during the fetching of the data")
        }
        
        return nil
        
    }
    
    static func deployContentToPantry() async -> Void {
        
        
        
    }
    
}
