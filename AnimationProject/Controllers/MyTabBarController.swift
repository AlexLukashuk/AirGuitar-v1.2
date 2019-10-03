//
//  MyTabBarController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 10/1/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import Foundation
import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    @IBOutlet weak var myTabBar: UITabBar!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.myTabBar.barTintColor = Config.shared.colorForBackground
    }
}
