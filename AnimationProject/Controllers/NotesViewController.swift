//
//  NotesViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/16/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    var name = ""
    var imageName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NotesIdentifier", let vc = segue.destination as? DetailViewController {
            vc.name = name
            vc.imageName = imageName
        }
    }
    
    @IBAction func metallicaButtonTouched(_ sender: UIButton) {
        name = "Metallica - Nothing else matters"
        imageName = "Metallica"
        
        performSegue(withIdentifier: "NotesIdentifier", sender: self)
    }
    
    @IBAction func nirvanaButtonTouched(_ sender: UIButton) {
        name = "Nirvana - Smells like teen spirit"
        imageName = "Nirvana"
        
        performSegue(withIdentifier: "NotesIdentifier", sender: self)
    }
    
    @IBAction func acdcButtonTouched(_ sender: UIButton) {
        name = "AC/DC - Back in black"
        imageName = "ACDC"
        
        performSegue(withIdentifier: "NotesIdentifier", sender: self)
    }
    
    @IBAction func rollingStonesButtonTouched(_ sender: UIButton) {
        name = "Rolling Stones - Paint it black"
        imageName = "TheRollingStones"
        
        performSegue(withIdentifier: "NotesIdentifier", sender: self)
    }
    
    @IBAction func theBeatlesButtonTouched(_ sender: UIButton) {
        name = "The Beatles - Let it be"
        imageName = "TheBeatles"
        
        performSegue(withIdentifier: "NotesIdentifier", sender: self)
    }
}
