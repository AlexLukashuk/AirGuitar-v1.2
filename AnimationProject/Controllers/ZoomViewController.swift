//
//  ZoomViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/13/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var name = ""
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = name
        image.image = UIImage(named: name)
        textView.text = text
    }
    
}

