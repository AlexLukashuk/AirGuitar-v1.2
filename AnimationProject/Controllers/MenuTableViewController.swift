//
//  MenuViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/12/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case camera
    case feedback
    case setting
}

class MenuTableViewController: UITableViewController {
    
    var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeMenuLeft))
        
        swipeLeft.direction = .left
        
        view.addGestureRecognizer(swipeLeft)
        
        
        let slide = SlideInTransition()
        slide.myFunc()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            
            isFirstTimeMenuButtonTouched = true
            
            self?.didTapMenuType?(menuType)
        }
    }
    
    func dismissMenu() {
        dismiss(animated: true) {
            print("Tap4")
            isFirstTimeMenuButtonTouched = true
        }
    }
    
    @objc func swipeMenuLeft() {
        
        dismiss(animated: true) {
            isFirstTimeMenuButtonTouched = true
        }
    }
}
