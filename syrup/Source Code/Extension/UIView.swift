//
//  UIView.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import UIKit

extension UIView {
    func addGradientWithColor(color: UIColor) {
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.colors = [UIColor.clear.cgColor, color.cgColor]
         
            self.layer.insertSublayer(gradient, at: 0)
        }
}
