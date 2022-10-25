//
//  TaskModel.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import Foundation

struct Projects: Codable, Hashable {
    
    let pantryTableID: String
    var basketsInThisTable: [Basket]
    
}
