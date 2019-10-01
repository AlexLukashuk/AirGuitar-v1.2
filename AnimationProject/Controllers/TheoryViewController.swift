//
//  TheoryViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/16/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit

class TheoryViewController: UIViewController {

    @IBOutlet weak var theoryTabBarItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theoryTabBarItem.badgeValue = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        view.backgroundColor = colorForBackground
        tabBarController?.tabBar.barTintColor = colorForBackground
    }
}
