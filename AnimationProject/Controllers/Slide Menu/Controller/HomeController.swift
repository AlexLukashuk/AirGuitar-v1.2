//
//  MenuViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 10/3/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        
        view.backgroundColor = .white
        
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMenuToggle)))
//        view.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(handleMenuToggle)))
    }
    
    // MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Slide Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}
