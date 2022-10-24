//
//  TaskModel.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import Foundation
import UIKit

struct Projects: Codable, Hashable {
    
    let pantryTableID: String
    var basketsInThisTable: [Basket]
    
}

struct Basket: Codable, Hashable {
    
    var basketID: Int
    var basketName: String
    var basketDescription: String
    var basketColor: String
    
    var casksInThisBasket: [Casks]
    
}

struct Casks: Codable, Hashable {
    
    var casksID: Int
    var casksName: String
    var casksDescription: String
    
    var syrupsInThisCask: [Syrups]
    
}

struct Syrups: Codable, Hashable {
    
    var syrupID: Int
    var syrupName: String
    var syrupDescription: String
    var syrupState: Bool
    
}
