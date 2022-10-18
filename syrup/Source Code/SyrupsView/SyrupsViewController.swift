//
//  CasksViewController.swift
//  syrup
//
//  Created by Caio Soares on 14/10/22.
//

import UIKit

class SyrupsViewController: UIViewController {

    private let syrupsHeader: comHeader = {
        let title = comHeader(titleLabel: "Syrups", infoLabel: "Number of active syrups: x")
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    private let syrupsStackBackground: comStack = {
        let stack = comStack(stackBackgroundColor: .systemGray5)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildLayout()
    }

}



extension SyrupsViewController: ViewCoding {
    
    func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    func setupHierarchy() {
        view.addSubview(syrupsHeader)
        view.addSubview(syrupsStackBackground)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            syrupsHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            syrupsHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            syrupsHeader.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1 ),
            
            syrupsStackBackground.topAnchor.constraint(equalTo: syrupsHeader.bottomAnchor, constant: 16),
            syrupsStackBackground.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            syrupsStackBackground.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            syrupsStackBackground.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18)
        ])
    }
    
}
