//
//  Basket.swift
//  syrup
//
//  Created by Caio Soares on 25/10/22.
//

import Foundation

struct Basket: Codable, Hashable {
    
    var basketID: Int
    var basketName: String
    var basketDescription: String
    var basketColor: String
    
    var casksInThisBasket: [Cask]
    
}
