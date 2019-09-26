//
//  MenuViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/12/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var slideMenuBarButton: UIBarButtonItem!
    @IBOutlet weak var airGuitarTabBar: UITabBar!
    @IBOutlet weak var moreTabBarItem: UITabBarItem!
    @IBOutlet weak var contactsTabBarItem: UITabBarItem!
    @IBOutlet weak var mostViewedTabBarItem: UITabBarItem!
    @IBOutlet weak var downloadsTabBarItem: UITabBarItem!
    @IBOutlet weak var favoritesTabBarItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreTabBarItem.badgeValue = "3"
        contactsTabBarItem.badgeValue = "6"
        mostViewedTabBarItem.badgeValue = "2"
        downloadsTabBarItem.badgeValue = "8"
        favoritesTabBarItem.badgeValue = "3"
        

    }
    
    @IBAction func slideMenuBarButtonAction(_ sender: UIBarButtonItem) {
        
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 {
            item.badgeValue = nil
            performSegue(withIdentifier: "Info", sender: self)
        } else if item.tag == 2 {
            item.badgeValue = nil
            performSegue(withIdentifier: "Info", sender: self)
        } else if item.tag == 3 {
            item.badgeValue = nil
            performSegue(withIdentifier: "Tuner", sender: self)
        } else if item.tag == 4 {
            item.badgeValue = nil
            performSegue(withIdentifier: "Links", sender: self)
        } else {
            item.badgeValue = nil
            performSegue(withIdentifier: "Player", sender: self)
        }
    }
}

extension UINavigationController {
    
    override open var shouldAutorotate: Bool {
        get {
            return false
        }
    }
}
