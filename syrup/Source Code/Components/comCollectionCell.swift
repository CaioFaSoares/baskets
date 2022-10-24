//
//  comCollectionCell.swift
//  syrup
//
//  Created by Caio Soares on 18/10/22.
//

import UIKit

class comCollectionCell: UICollectionViewCell {
    
    static let identifier = "comCollectionCell"
    
    var projectLabelTitle: String? {
        didSet{
            cellTitle.text = projectLabelTitle
        }
    }
    var projectLabelDescription: String? {
        didSet{
            cellDescription.text = projectLabelDescription
        }
    }
    var projectLabelColor: UIColor? {
        didSet{
            projectColor.backgroundColor = projectLabelColor
        }
    }
    
    private let cellStack: UIView = {
        
        let stack = UIView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .systemGray5
        stack.layer.cornerCurve = .circular
        stack.layer.cornerRadius = 10
        
        return stack
        
    }()
    
    private lazy var cellTitle: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        return label
        
    }()
    
    private lazy var cellDescription: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        
        return label
        
    }()
    
    private lazy var projectIcon: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        
        label.text = "Oi"
        
        return label
        
    }()
    
    private lazy var projectColor: UIView = {
        
        let block = UIView(frame: .zero)
        block.translatesAutoresizingMaskIntoConstraints = false
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
        
        projectColor.addSubview(projectIcon)
        
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
            
            projectIcon.centerYAnchor.constraint(equalTo: projectColor.centerYAnchor),
            projectIcon.centerXAnchor.constraint(equalTo: projectColor.centerXAnchor),
            
            cellTitle.leadingAnchor.constraint(equalTo: projectColor.trailingAnchor, constant: 10),
            cellTitle.topAnchor.constraint(equalTo: projectColor.topAnchor),
            cellTitle.trailingAnchor.constraint(equalTo: cellStack.trailingAnchor, constant: -10),
            
            cellDescription.leadingAnchor.constraint(equalTo: cellTitle.leadingAnchor),
            cellDescription.topAnchor.constraint(equalTo: cellTitle.bottomAnchor),
            cellDescription.trailingAnchor.constraint(equalTo: cellStack.trailingAnchor, constant: -10),
            
        ])
    }
    
    
}
