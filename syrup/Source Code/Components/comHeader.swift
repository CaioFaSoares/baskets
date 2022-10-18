//
//  Header.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import UIKit

final class comHeader: UIView {
    
    var titleLabel: String?
    var infoLabel: String?
    
    private lazy var HeaderTitleLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.text = titleLabel
        
        return label
        
    }()
    
    private lazy var HeaderInfoLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.text = infoLabel
        
        return label
        
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

extension comHeader: ViewCoding {
    func setupView() {
    }
    
    func setupHierarchy() {
        self.addSubview(HeaderTitleLabel)
        self.addSubview(HeaderInfoLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            HeaderTitleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            HeaderTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            HeaderTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            HeaderInfoLabel.topAnchor.constraint(equalTo: HeaderTitleLabel.bottomAnchor, constant: 8),
            HeaderInfoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            HeaderInfoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            HeaderInfoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ])
    }
}
