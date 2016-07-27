//
//  MapViewController.swift
//  CollegeProfileBuilder
//
//  Created by Aaron on 2016-07-26.
//  Copyright © 2016 Aaron. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapAddressTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            if location.horizontalAccuracy < 1000 && location.verticalAccuracy < 1000 {
                let center = location.coordinate
                let span = MKCoordinateSpanMake(0.01, 0.01)
                let region = MKCoordinateRegionMake(center, span)
                self.mapView.setRegion(region, animated: true)
                locationManager.stopUpdatingLocation()
            }
        }
    }
}
