//
//  ViewController.swift
//  syrup
//
//  Created by Caio Soares on 10/10/22.
//

import UIKit

class ManagerViewController: UIViewController {
    
    private lazy var basketsView    = BasketsViewController()
    private lazy var casksView      = CasksViewController()
    private lazy var syrupsView     = SyrupsViewController()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        view.isPagingEnabled = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

extension ManagerViewController: ViewCoding {
    func setupView() {
        scrollView.contentInsetAdjustmentBehavior = .never
        self.scrollView.contentSize = CGSize(
            width: 3 * view.frame.width, height: view.frame.height
        )
//        self.scrollView.goToSyrups()
        
        view.backgroundColor = .systemBackground
    }
    
    func setupHierarchy() {
        view.addSubview(scrollView)
        
        addChild(basketsView)
        basketsView.willMove(toParent: self)
        scrollView.addSubview(basketsView.view)
        basketsView.didMove(toParent: self)
        
        addChild(casksView)
        casksView.willMove(toParent: self)
        scrollView.addSubview(casksView.view)
        casksView.didMove(toParent: self)
        
        addChild(syrupsView)
        syrupsView.willMove(toParent: self)
        scrollView.addSubview(syrupsView.view)
        syrupsView.didMove(toParent: self)
        
    }
    
    func setupConstraints() {
        basketsView.view.translatesAutoresizingMaskIntoConstraints = false
        casksView.view.translatesAutoresizingMaskIntoConstraints = false
        syrupsView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            basketsView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            basketsView.view.widthAnchor.constraint(equalToConstant: view.frame.width),
            basketsView.view.heightAnchor.constraint(equalToConstant: view.frame.height),
            
            casksView.view.leadingAnchor.constraint(equalTo: basketsView.view.trailingAnchor),
            casksView.view.widthAnchor.constraint(equalToConstant: view.frame.width),
            casksView.view.heightAnchor.constraint(equalToConstant: view.frame.height),
            
            syrupsView.view.leadingAnchor.constraint(equalTo: casksView.view.trailingAnchor),
            syrupsView.view.widthAnchor.constraint(equalToConstant: view.frame.width),
            syrupsView.view.heightAnchor.constraint(equalToConstant: view.frame.height)
            
        ])
    }
    
}
