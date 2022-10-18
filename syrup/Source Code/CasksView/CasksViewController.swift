//
//  CasksViewController.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import UIKit

class CasksViewController: UIViewController {

    private let casksHeader: comHeader = {
        let title = comHeader(titleLabel: "Casks", infoLabel: "Currently active cask: x")
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    private let casksStackBackground: comStack = {
        let stack = comStack(stackBackgroundColor: .systemGray5)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildLayout()
    }

}



extension CasksViewController: ViewCoding {
    
    func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    func setupHierarchy() {
        view.addSubview(casksHeader)
        view.addSubview(casksStackBackground)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            casksHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            casksHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            casksHeader.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1 ),
            
            casksStackBackground.topAnchor.constraint(equalTo: casksHeader.bottomAnchor, constant: 16),
            casksStackBackground.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            casksStackBackground.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            casksStackBackground.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18)
            
        ])
    }
    
}
