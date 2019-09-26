//
//  TabsViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/13/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit

class TabsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var nameOfTabs: [String] = []
    var descriptionOfTabs: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        readFromJsonFile()
    }
    
    func readFromJsonFile() {
        if let path = Bundle.main.path(forResource: "Tabs", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    let nameOfTabsFromJson = jsonResult["nameOfTabs"] as? [String],
                    let descriptionOfTabsFromJson = jsonResult["descriptionOfTabs"] as? [String] {
                    
                    nameOfTabs = nameOfTabsFromJson
                    descriptionOfTabs = descriptionOfTabsFromJson
                }
            } catch {
                print("Parse error: \(error.localizedDescription)")
            }
        }
    }
}

extension TabsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameOfTabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
        cell?.imageView.image = UIImage(named: nameOfTabs[indexPath.row])
        cell?.label.text = nameOfTabs[indexPath.row]
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ZoomViewController") as? ZoomViewController
        vc?.name = nameOfTabs[indexPath.row]
        vc?.text = descriptionOfTabs[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension TabsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        
        return CGSize(width: bounds.width / 2 - 50, height: bounds.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
