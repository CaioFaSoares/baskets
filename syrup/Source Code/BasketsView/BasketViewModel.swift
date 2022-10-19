//
//  BasketViewModel.swift
//  syrup
//
//  Created by Caio Soares on 18/10/22.
//

import Foundation

final class BasketViewModel {
    
//    weak var projectsDelegate: ProjectsCollectionViewDelegate?
    
    private let apiService: APICall
    
    init(apiService: APICall) {
        
        self.apiService = apiService
        
    }
    
}
