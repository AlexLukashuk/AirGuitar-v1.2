//
//  Config.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 10/2/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import Foundation
import UIKit

class Config {
    
    private static let sharedInstance: Config = {
        let config = Config()
        
        return config
    }()
    
    class var shared : Config {
        return sharedInstance
    }
    
    private init() {}
    
    private var isFirstTimeMenuButtonTouchedConfig = true
    private var isOnSwitchConfig = true
    private var myTintColorConfig = #colorLiteral(red: 0.3285776377, green: 0.03574729338, blue: 0.01621466875, alpha: 1)
    private var colorForBackgroundConfig = #colorLiteral(red: 0.7071254849, green: 0.2154596448, blue: 0.2453398108, alpha: 1)
    
    var isFirstTimeMenuButtonTouched : Bool? {
        get {
            return isFirstTimeMenuButtonTouchedConfig
        }
        set {
            isFirstTimeMenuButtonTouchedConfig = newValue!
        }
    }
    
    var isOnSwitch : Bool? {
        get {
            return isOnSwitchConfig
        }
        set {
            isOnSwitchConfig = newValue!
        }
    }
    
    var myTintColor : UIColor? {
        get {
            return myTintColorConfig
        }
        set {
            myTintColorConfig = newValue!
        }
    }
    
    var colorForBackground : UIColor? {
        get {
            return colorForBackgroundConfig
        }
        set {
            colorForBackgroundConfig = newValue!
        }
    }
}
