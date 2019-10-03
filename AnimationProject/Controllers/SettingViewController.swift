//
//  ProfileViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/27/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var switchTheme: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Config.shared.colorForBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if Config.shared.isOnSwitch! {
            switchTheme.setOn(true, animated: true)
        } else {
            switchTheme.setOn(false, animated: true)
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if switchTheme.isOn {
            Config.shared.isOnSwitch = true
            Config.shared.colorForBackground = #colorLiteral(red: 0.7071254849, green: 0.2154596448, blue: 0.2453398108, alpha: 1)
        } else {
            Config.shared.isOnSwitch = false
            Config.shared.colorForBackground = #colorLiteral(red: 1, green: 0.7052828004, blue: 0.6321345922, alpha: 1)
        }
        
        tabBarController?.tabBar.barTintColor = Config.shared.colorForBackground
        navigationController?.navigationBar.barTintColor = Config.shared.colorForBackground
        view.backgroundColor = Config.shared.colorForBackground
    }
}
