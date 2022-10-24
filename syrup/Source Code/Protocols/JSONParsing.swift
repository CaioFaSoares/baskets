//
//  JSONParsing.swift
//  syrup
//
//  Created by Caio Soares on 20/10/22.
//

import Foundation

protocol JSONProcessing {
    
    func getProjectsFromJson() -> [Basket]
    
}

protocol DataPopulator {
    
    func populateCellsWithData()
    
}
