//
//  Casms.swift
//  syrup
//
//  Created by Caio Soares on 25/10/22.
//

import Foundation

struct Cask: Codable, Hashable {
    
    var casksID: Int
    var casksName: String
    var casksDescription: String
    
    var syrupsInThisCask: [Syrup]
    
}
