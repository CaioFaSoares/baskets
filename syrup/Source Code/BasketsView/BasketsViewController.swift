//
//  BasketViewController.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import UIKit

class BasketsViewController: UIViewController {
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Projects>?
    
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
    
    private let collectionView: comCollection = {
        
        let collection = comCollection()
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
        
    }()
    
    func basketSetupCollectionView() {
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, Projects> {
            cell, indexPath, project in
            
            var content = cell.defaultContentConfiguration()
            content.text = String(project.pantryTableID)
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Projects>(collectionView: comCollection().collectionView) {
            collectionView, indexPath, item in
            
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
            
            
        }
    }
    
    
    func populateProjects(with projects: [Projects]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Projects>()
        snapshot.appendSections([.main])
        snapshot.appendItems(projects)
        dataSource?.apply(snapshot)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        basketSetupCollectionView()
        buildLayout()
    }
    
}

extension BasketsViewController {
    enum Section {
        case main
    }
}


extension BasketsViewController: ViewCoding {
    
    func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    func setupHierarchy() {
        view.addSubview(basketHeader)
        view.addSubview(basketStackBackground)
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            basketHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            basketHeader.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1 ),
            basketHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            basketStackBackground.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            basketStackBackground.topAnchor.constraint(equalTo: basketHeader.bottomAnchor, constant: 16),
            basketStackBackground.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            basketStackBackground.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            collectionView.leadingAnchor.constraint(equalTo: basketStackBackground.leadingAnchor, constant: 8),
            collectionView.topAnchor.constraint(equalTo: basketStackBackground.topAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: basketStackBackground.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: basketStackBackground.bottomAnchor, constant: -8),
        ])
    }
    
}
