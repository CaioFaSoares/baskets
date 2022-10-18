//
//  Basket.swift
//  syrup
//
//  Created by Caio Soares on 17/10/22.
//

import UIKit

class BasketView: UIView {
    
    var titleLabel: String?
    var infoLabel: String?
    
    private let basketHeader: comHeader = {
        let title = comHeader(titleLabel: "Basket", infoLabel: "Currently active baskets: x")
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    private let basketStackBackground: comStack = {
        
        let stack = comStack(stackBackgroundColor: .systemGray5)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()

    init(titleLabel: String, infoLabel: String) {
        super.init(frame: .zero)
        self.titleLabel = titleLabel
        self.infoLabel = infoLabel
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BasketView: ViewCoding {
    func setupView() {
        backgroundColor = .blue
    }
    
    func setupHierarchy() {
        self.addSubview(basketHeader)
        self.addSubview(basketStackBackground)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
                basketHeader.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                basketHeader.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
                basketHeader.topAnchor.constraint(equalToSystemSpacingBelow: self.safeAreaLayoutGuide.topAnchor, multiplier: 1 ),
                
                basketStackBackground.topAnchor.constraint(equalTo: basketHeader.bottomAnchor, constant: 16),
                basketStackBackground.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
                basketStackBackground.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                basketStackBackground.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    
}
