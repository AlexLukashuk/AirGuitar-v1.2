//
//  ProfileViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/27/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import Foundation
import UIKit

var colorForBackground = #colorLiteral(red: 0.7071254849, green: 0.2154596448, blue: 0.2453398108, alpha: 1)
var isOn = true

class SettingViewController: UIViewController {
    
    @IBOutlet weak var switchTheme: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colorForBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if isOn {
            switchTheme.setOn(true, animated: true)
        } else {
            switchTheme.setOn(false, animated: true)
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if switchTheme.isOn {
            isOn = true
            colorForBackground = #colorLiteral(red: 0.7071254849, green: 0.2154596448, blue: 0.2453398108, alpha: 1)
        } else {
            isOn = false
            colorForBackground = #colorLiteral(red: 1, green: 0.7052828004, blue: 0.6321345922, alpha: 1)
        }
        tabBarController?.tabBar.barTintColor = colorForBackground
        navigationController?.navigationBar.barTintColor = colorForBackground
        view.backgroundColor = colorForBackground
    }
}
