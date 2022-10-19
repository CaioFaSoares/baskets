//
//  BasketViewController.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import UIKit

class BasketsViewController: UIViewController {
    
    private let basketHeader: comHeader = {
        
        let title = comHeader(titleLabel: "Baskets", infoLabel: "Currently active baskets: x")
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
        
    }()
    
    private let basketStackBackground: comStack = {
        
        let stack = comStack(stackBackgroundColor: .clear)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    var viewFlow = UICollectionViewFlowLayout()
    
    private lazy var collectionView = UICollectionView (
        frame: .zero,
        collectionViewLayout: viewFlow
    )
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
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
        
        viewFlow.scrollDirection = .vertical
        viewFlow.minimumInteritemSpacing = 0
        viewFlow.minimumLineSpacing = 0
        
        collectionView.register(comCollectionCell.self, forCellWithReuseIdentifier: comCollectionCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.frame = .zero
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    func setupHierarchy() {
        
        view.addSubview(basketHeader)
        view.addSubview(basketStackBackground)
        view.addSubview(collectionView)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            basketHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
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

extension BasketsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: comCollectionCell.identifier, for: indexPath)
        return cell
        
    }
    
}

extension BasketsViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        
        let widthPerItem = collectionView.bounds.width
        let heighPerItem = collectionView.bounds.height/4
        
        return CGSize(width: widthPerItem, height: heighPerItem)
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)

    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
    func centerItemsInCollectionView(cellWidth: Double, numberOfItems: Double, spaceBetweenCell: Double, collectionView: UICollectionView) -> UIEdgeInsets {
        
        let totalWidth = cellWidth * numberOfItems
        
        let totalSpacingWidth = spaceBetweenCell * (numberOfItems - 1)
        
        let leftInset = (collectionView.frame.width - CGFloat(totalWidth + totalSpacingWidth)) / 2
        
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        
    }
    
}
