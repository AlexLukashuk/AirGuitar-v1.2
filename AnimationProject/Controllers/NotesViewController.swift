//
//  NotesViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/16/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit
import SafariServices

class NotesViewController: UIViewController {
    
    @IBOutlet weak var notesTabBarItem: UITabBarItem!
    @IBOutlet weak var backView: UIView!
    
    let transition = SlideInTransition()
    
    var name = ""
    var imageName = ""
    var menuBarButtonItem : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(menuBarButtonTouched)))

        notesTabBarItem.badgeValue = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tabBarController?.tabBar.barTintColor = Config.shared.colorForBackground
        navigationController?.navigationBar.backgroundColor = Config.shared.colorForBackground
        backView.backgroundColor = Config.shared.colorForBackground
        view.backgroundColor = Config.shared.colorForBackground
        
        menuBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal).withTintColor(Config.shared.myTintColor!), style: .plain, target: self, action: #selector(menuBarButtonTouched))

        self.navigationController?.navigationBar.topItem?.setLeftBarButton(menuBarButtonItem, animated: true)
    }
    
    @objc func menuBarButtonTouched() {
        
        if Config.shared.isFirstTimeMenuButtonTouched! {
            Config.shared.isFirstTimeMenuButtonTouched = false
            
            guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuTableViewController") as? MenuTableViewController else { return }
        
            menuViewController.didTapMenuType = { menuType in
                self.transitionToNew(menuType)
            
                print(menuType)
            }
        
            menuViewController.modalPresentationStyle = .overCurrentContext
            menuViewController.transitioningDelegate = self
        
            present(menuViewController, animated: true)
        } else {
            dismissMenu()
        }
    }
    
    func dismissMenu() {
        dismiss(animated: true) {
            print("Tap3")
            Config.shared.isFirstTimeMenuButtonTouched = true
        }
    }
    
    func transitionToNew(_ menuType: MenuType) {
        
        switch menuType {
        case .feedback:
            feedbackWebPage()
        case .camera:
            guard let cameraViewController = storyboard?.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController else { return }
            
            self.navigationController?.pushViewController(cameraViewController, animated: true)
        case .setting:
            guard let settingViewController = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else { return }
            
            self.navigationController?.pushViewController(settingViewController, animated: true)
        }
    }
    
    func feedbackWebPage() {
        if let url = URL(string: "https://feedback.ink/yourweb/") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
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

extension NotesViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        
        return transition
    }
}

extension UINavigationController {
    
    override open var shouldAutorotate: Bool {
        get {
            return false
        }
    }
}
