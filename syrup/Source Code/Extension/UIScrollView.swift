//
//  UIScrollView.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import UIKit

extension UIScrollView {
    
    func goToSyrups() {
        let trailingOffset = CGPoint(x: contentSize.width - bounds.size.width + contentInset.left, y: 0)
        setContentOffset(trailingOffset, animated: true)
    }
    
}
