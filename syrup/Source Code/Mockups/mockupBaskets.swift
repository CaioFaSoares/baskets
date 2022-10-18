//
//  File.swift
//  syrup
//
//  Created by Caio Soares on 17/10/22.
//

import Foundation

class mockRequest {
    
    var filename: String = "mockupResponse"
    
    static func loadMockJSON(filename: String) -> NSDictionary {
        let path = Bundle.main.path(forResource: filename, ofType: "json")
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let jsonResult: NSDictionary = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! NSDictionary
        
        return jsonResult
    }
    
}
