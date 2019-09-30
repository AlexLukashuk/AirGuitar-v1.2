//
//  FeedbackViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/30/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import Foundation
import UIKit

class FeedbackViewController: UIViewController {
    
    var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
        
        view.backgroundColor = #colorLiteral(red: 0.7071254849, green: 0.2154596448, blue: 0.2453398108, alpha: 1)
    }
    
    func setLabel() {
        label = UILabel()
        label?.text = "Feedback"
        label?.textAlignment = .center
        label?.textColor = #colorLiteral(red: 0.3285776377, green: 0.03574729338, blue: 0.01621466875, alpha: 1)
        label?.font = .systemFont(ofSize: 45, weight: UIFont.Weight(rawValue: 100))
        
        label?.translatesAutoresizingMaskIntoConstraints = false
            
        view.addSubview(label!)
            
        constraintsForLabel()
    }
    
    func constraintsForLabel() {
        self.view.addConstraints([NSLayoutConstraint(item: label!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 10),
                             NSLayoutConstraint(item: label!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10),
                             NSLayoutConstraint(item: label!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 10),
                             NSLayoutConstraint(item: label!, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 50)])
    }
}
