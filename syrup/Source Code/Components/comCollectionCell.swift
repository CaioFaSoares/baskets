//
//  comCollectionCell.swift
//  syrup
//
//  Created by Caio Soares on 18/10/22.
//

import UIKit

class comCollectionCell: UICollectionViewCell {
    
    static let identifier = "comCollectionCell"
    
    private let cellStack: UIView = {
        
        let stack = UIView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .systemGray5
        stack.layer.cornerCurve = .circular
        stack.layer.cornerRadius = 10
        
        return stack
        
    }()
    
    private let cellTitle: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.text = "projectName"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        return label
        
    }()
    
    private let cellDescription: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.text = "projectDescription description description projectDescription description description projectDescription description description "
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        
        return label
        
    }()
    
    private let projectColor: UIView = {
        
        let block = UIView(frame: .zero)
        block.translatesAutoresizingMaskIntoConstraints = false
        block.backgroundColor = .red
        block.layer.opacity = 0.8
        block.layer.cornerCurve = .circular
        block.layer.cornerRadius = 5
        
        return block
        
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        buildLayout()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
    
        super.layoutSubviews()
        
    }
    
}

extension comCollectionCell: ViewCoding {
    
    func setupView() {
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setupHierarchy() {
        
        self.addSubview(cellStack)
        cellStack.addSubview(projectColor)
        cellStack.addSubview(cellTitle)
        cellStack.addSubview(cellDescription)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            cellStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cellStack.topAnchor.constraint(equalTo: self.topAnchor),
            cellStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            projectColor.leadingAnchor.constraint(equalTo: cellStack.leadingAnchor, constant: 10),
            projectColor.topAnchor.constraint(equalTo: cellStack.topAnchor ,constant: 10),
            projectColor.heightAnchor.constraint(equalToConstant: 48),
            projectColor.widthAnchor.constraint(equalToConstant: 48),
            
            cellTitle.leadingAnchor.constraint(equalTo: projectColor.trailingAnchor, constant: 10),
            cellTitle.topAnchor.constraint(equalTo: projectColor.topAnchor),
            cellTitle.trailingAnchor.constraint(equalTo: cellStack.trailingAnchor, constant: -10),
            
            cellDescription.leadingAnchor.constraint(equalTo: cellTitle.leadingAnchor),
            cellDescription.topAnchor.constraint(equalTo: projectColor.bottomAnchor),
            cellDescription.trailingAnchor.constraint(equalTo: cellStack.trailingAnchor, constant: -10),
            
        ])
    }
    
    
}
