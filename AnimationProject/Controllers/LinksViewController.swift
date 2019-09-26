//
//  LinksViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/18/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit

class LinksViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var firstLinkTextView: UITextView!
    @IBOutlet weak var secondLinkTextView: UITextView!
    @IBOutlet weak var thirdLinkTextView: UITextView!
    @IBOutlet weak var fouthLinkTextView: UITextView!
    @IBOutlet weak var fifthLinkTextView: UITextView!
    @IBOutlet weak var sixthLinkTextView: UITextView!
    @IBOutlet weak var seventhLinkTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstLinkTextView.attributedText = attributedLink(nameOfSite: "Justin Guitar", link: "https://www.justinguitar.com")
        secondLinkTextView.attributedText = attributedLink(nameOfSite: "Jam Studio", link: "http://www.jamstudio.com/Studio/index.htm")
        thirdLinkTextView.attributedText = attributedLink(nameOfSite: "Guitar Masterclass", link: "https://www.guitarmasterclass.net/")
        fouthLinkTextView.attributedText = attributedLink(nameOfSite: "Chord Book", link: "http://www.chordbook.com/")
        fifthLinkTextView.attributedText = attributedLink(nameOfSite: "Music Tuts+", link: "https://music.tutsplus.com")
        sixthLinkTextView.attributedText = attributedLink(nameOfSite: "How to Tune a Guitar", link: "http://www.howtotuneaguitar.org/")
        seventhLinkTextView.attributedText = attributedLink(nameOfSite: "Free Guitar Videos", link: "http://www.freeguitarvideos.com/")
        
        firstLinkTextView.textAlignment = .center
        secondLinkTextView.textAlignment = .center
        thirdLinkTextView.textAlignment = .center
        fouthLinkTextView.textAlignment = .center
        fifthLinkTextView.textAlignment = .center
        sixthLinkTextView.textAlignment = .center
        seventhLinkTextView.textAlignment = .center
    }
    
    func attributedLink(nameOfSite: String, link: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: nameOfSite)
        attributedString.addAttribute(.link, value: link, range: NSRange(location: 0, length: nameOfSite.count))
        
        return attributedString
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        
        return false
    }

}
