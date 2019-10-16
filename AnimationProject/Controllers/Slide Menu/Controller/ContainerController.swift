//
//  ContainerViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 10/3/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import Foundation
import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    
    var swipeLeft: UIPanGestureRecognizer!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHomeController()
        
        swipeLeft = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizer(_:)))
        
        view.addGestureRecognizer(swipeLeft)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    // MARK: - Handlers
    
    @objc func panGestureRecognizer(_ recognizer: UIPanGestureRecognizer) {
        
        if !isExpanded {
            configureMenuController()
        }
        
//        isExpanded = !isExpanded
        
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: view).x > 0)
        
        if swipeLeft.state == .changed {
            if gestureIsDraggingFromLeftToRight {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                    if self.centerController.view.frame.origin.x != (self.centerController.view.frame.width - 80) {
                        self.centerController.view.frame.origin.x = self.centerController.view.frame.origin.x + 5
                    }
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                    if self.centerController.view.frame.origin.x != 0 {
                        self.centerController.view.frame.origin.x = self.centerController.view.frame.origin.x - 5
                    }
                }, completion: nil)
            }
        } else if swipeLeft.state == .ended {
            if gestureIsDraggingFromLeftToRight {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                    self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                    self.isExpanded = !self.isExpanded
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                    self.centerController.view.frame.origin.x = 0
                    self.isExpanded = !self.isExpanded
                }, completion: nil)
            }
        }
        
        animateStatusBar()
    }
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            
            menuController.delegate = self
            
            view.insertSubview(menuController.view, at: 0)
            
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
            
        } else {
            // hide menu
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Profile:
            print("Show profile")
        case .Inbox:
            print("Show Inbox")
        case .Notifications:
            print("Show Notifications")
        case .Settings:
            print("Show Settings")
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
