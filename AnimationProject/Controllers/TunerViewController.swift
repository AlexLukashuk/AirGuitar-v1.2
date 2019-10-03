//
//  ViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/12/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit
import AVFoundation

class TunerViewController: UIViewController {

    @IBOutlet weak var firstString: UIView!
    @IBOutlet weak var secondString: UIView!
    @IBOutlet weak var thirdString: UIView!
    @IBOutlet weak var fouthString: UIView!
    @IBOutlet weak var fifthString: UIView!
    @IBOutlet weak var sixthString: UIView!
    @IBOutlet weak var tunerTabBarItem: UITabBarItem!
    
    var stringSound: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tunerTabBarItem.badgeValue = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        firstString.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimationsFirst)))
        secondString.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimationsSecond)))
        thirdString.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimationsThird)))
        fouthString.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimationsFouth)))
        fifthString.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimationsFifth)))
        sixthString.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimationsSixth)))
        
        view.backgroundColor = Config.shared.colorForBackground
        tabBarController?.tabBar.barTintColor = Config.shared.colorForBackground
    }
    
    @objc fileprivate func handleTapAnimationsFirst(numberOfString: Int) {
        
        let path = Bundle.main.path(forResource: "first.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            stringSound = try AVAudioPlayer(contentsOf: url)
            stringSound?.play()
        } catch {
            // couldn't load file
        }
        
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            
            self.firstString.transform = CGAffineTransform(translationX: 0.5, y: 0)
            
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
                
                self.firstString.transform = CGAffineTransform(translationX: 0, y: 0)
                
            })
        }
    }

    @objc func handleTapAnimationsSecond() {

        let path = Bundle.main.path(forResource: "second.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            stringSound = try AVAudioPlayer(contentsOf: url)
            stringSound?.play()
        } catch {
            // couldn't load file :(
        }

        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {

            self.secondString.transform = CGAffineTransform(translationX: 0.5, y: 0)

        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {

                self.secondString.transform = CGAffineTransform(translationX: 0, y: 0)

            })
        }
    }

    @objc func handleTapAnimationsThird() {

        let path = Bundle.main.path(forResource: "third.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            stringSound = try AVAudioPlayer(contentsOf: url)
            stringSound?.play()
        } catch {
            // couldn't load file :(
        }

        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {

            self.thirdString.transform = CGAffineTransform(translationX: 0.5, y: 0)

        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {

                self.thirdString.transform = CGAffineTransform(translationX: 0, y: 0)

            })
        }
    }

    @objc func handleTapAnimationsFouth() {

        let path = Bundle.main.path(forResource: "fouth.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            stringSound = try AVAudioPlayer(contentsOf: url)
            stringSound?.play()
        } catch {
            // couldn't load file :(
        }

        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {

            self.fouthString.transform = CGAffineTransform(translationX: 0.5, y: 0)

        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {

                self.fouthString.transform = CGAffineTransform(translationX: 0, y: 0)

            })
        }
    }

    @objc func handleTapAnimationsFifth() {

        let path = Bundle.main.path(forResource: "fifth.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            stringSound = try AVAudioPlayer(contentsOf: url)
            stringSound?.play()
        } catch {
            // couldn't load file :(
        }

        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {

            self.fifthString.transform = CGAffineTransform(translationX: 0.5, y: 0)

        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {

                self.fifthString.transform = CGAffineTransform(translationX: 0, y: 0)

            })
        }
    }

    @objc func handleTapAnimationsSixth() {

        let path = Bundle.main.path(forResource: "sixth.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            stringSound = try AVAudioPlayer(contentsOf: url)
            stringSound?.play()
        } catch {
            // couldn't load file :(
        }

        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {

            self.sixthString.transform = CGAffineTransform(translationX: 0.5, y: 0)

        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {

                self.sixthString.transform = CGAffineTransform(translationX: 0, y: 0)

            })
        }
    }
}

