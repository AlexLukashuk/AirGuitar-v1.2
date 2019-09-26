//
//  InfoViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/18/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit
import MapKit

class InfoViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var infoTabBarItem: UITabBarItem!
    
    let initialLocation = CLLocation(latitude: 49.228816, longitude: 28.426631)
    let regionRadius: CLLocationDistance = 2000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoTabBarItem.badgeValue = nil
        
        centerMapOnLocation(location: initialLocation)
        annotationMarker()
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func annotationMarker() {
        let company = Company(title: "Onseo",
                              locationName: "600-Richchya St, 17, Vinnytsia, Vinnyts'ka oblast, 21000",
                              discipline: "Company",
                              coordinate: CLLocationCoordinate2D(latitude: 49.228816, longitude: 28.426631))
        
        mapView.addAnnotation(company)
    }
}
