//
//  MenuViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/12/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case feedback
    case profile
    case camera
}

class MenuTableViewController: UITableViewController {
    
    var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(swipeMenuLeft))
        
        swipeleft.direction = .left
        
        view.addGestureRecognizer(swipeleft)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            
            isFirstTimeMenuButtonTouched = true
            
            self?.didTapMenuType?(menuType)
        }
    }
    
    @objc func swipeMenuLeft() {
        
        dismiss(animated: true) {
            isFirstTimeMenuButtonTouched = true
        }
        
    }
}
