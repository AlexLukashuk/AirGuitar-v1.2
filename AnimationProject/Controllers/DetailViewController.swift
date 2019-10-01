//
//  DetailViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/16/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIGestureRecognizerDelegate, UIScrollViewDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var drawView: UIView!
    
    var name = ""
    var imageName = ""
    var currentTransform: CGAffineTransform? = nil
    var pinchStartImageCenter: CGPoint = CGPoint(x: 0, y: 0)
    var pichCenter: CGPoint = CGPoint(x: 0, y: 0)
    
    let maxScale: CGFloat = 4.0
    let minScale: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.isUserInteractionEnabled = true
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        pinchGesture.delegate = self
        image.addGestureRecognizer(pinchGesture)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        doubleTapGesture.numberOfTapsRequired = 2
        
        image.addGestureRecognizer(doubleTapGesture)
        
        label.text = name
        image.image = UIImage(named: imageName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        view.backgroundColor = colorForBackground
        tabBarController?.tabBar.barTintColor = colorForBackground
    }
    
    @objc func tapGesture(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            
            currentTransform = self.image.transform
            var doubleTapStartCenter = self.image.center
            
            var transform: CGAffineTransform! = nil
            var scale: CGFloat = 2.0 // x2 double tapped
            
            let currentScale = sqrt(abs(self.image.transform.a * self.image.transform.d - self.image.transform.b * self.image.transform.c))
            
            let tappedLocation = sender.location(in: self.image)
            
            var newCenter: CGPoint
            
            if self.maxScale < currentScale * scale {
                scale = self.minScale
                transform = CGAffineTransform.identity
                
                newCenter = CGPoint(x: self.baseView.frame.size.width / 2, y: self.baseView.frame.size.height / 2)
                doubleTapStartCenter = newCenter
            } else {
                transform = self.currentTransform!.concatenating(CGAffineTransform(scaleX: scale, y: scale))
                
                newCenter = CGPoint(
                    x: doubleTapStartCenter.x - ((tappedLocation.x - doubleTapStartCenter.x) * scale - (tappedLocation.x - doubleTapStartCenter.x)),
                    y: doubleTapStartCenter.y - ((tappedLocation.y - doubleTapStartCenter.y) * scale - (tappedLocation.y - doubleTapStartCenter.y)))
            }
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {() -> Void in
                self.image.center = newCenter
                self.image.transform = transform
                
            }, completion: {(finished: Bool) -> Void in
            })
        }
    }
    
    @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
        if sender.state == .began {
            
            self.currentTransform = image.transform
            
            self.pinchStartImageCenter = image.center
            
            let touchPoint1 = sender.location(ofTouch: 0, in: image)
            let touchPoint2 = sender.location(ofTouch: 1, in: image)
            
            self.pichCenter = CGPoint(x: (touchPoint1.x + touchPoint2.x) / 2, y: (touchPoint1.y + touchPoint2.y) / 2)
            
        } else if sender.state == .changed {
            
            let scale = sender.scale
            
            let newCenter = CGPoint(
                x: self.pinchStartImageCenter.x - ((self.pichCenter.x - self.pinchStartImageCenter.x) * scale - (self.pichCenter.x - self.pinchStartImageCenter.x)),
                y: self.pinchStartImageCenter.y - ((self.pichCenter.y - self.pinchStartImageCenter.y) * scale - (self.pichCenter.y - self.pinchStartImageCenter.y)))
            
            self.image.center = newCenter
            self.image.transform = currentTransform!.concatenating(CGAffineTransform(scaleX: scale, y: scale))
            
        } else if sender.state == .ended {
            
            let currentScale = sqrt(abs(self.image.transform.a * self.image.transform.d - self.image.transform.b * self.image.transform.c))
            
            if currentScale <= self.minScale {

                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {() -> Void in
                    self.image.center = CGPoint(x: self.baseView.frame.size.width / 2, y: self.baseView.frame.size.height / 2)
                    self.image.transform = CGAffineTransform(scaleX: self.minScale, y: self.minScale)
                }, completion: {(finished: Bool) -> Void in
                })
            } else if self.maxScale <= currentScale {
                
                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {() -> Void in
                    self.image.center = CGPoint(x: self.baseView.frame.size.width / 2, y: self.baseView.frame.size.height / 2)
                    self.image.transform = CGAffineTransform(scaleX: self.maxScale, y: self.maxScale)
                }, completion: {(finished: Bool) -> Void in
                })
            }
        }
    }

}
