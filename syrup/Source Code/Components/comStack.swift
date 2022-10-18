//
//  Stack.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import UIKit

final class comStack: UIView {
    
    var stackBackgroundColor: UIColor?
    
    private lazy var stackBackground: UIView = {
        
        let stack = UIView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.backgroundColor = stackBackgroundColor
        
        stack.layer.cornerCurve = .circular
        stack.layer.cornerRadius = 10
        
        return stack
        
    }()
    
    init(stackBackgroundColor: UIColor) {
        super.init(frame: .zero)
        self.stackBackgroundColor = stackBackgroundColor
        
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension comStack: ViewCoding {
    func setupView() {
    }
    
    func setupHierarchy() {
        self.addSubview(stackBackground)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stackBackground.topAnchor.constraint(equalTo: self.topAnchor),
            stackBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ])
    }
}
