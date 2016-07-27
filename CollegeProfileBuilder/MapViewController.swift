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
    var collegeLocation = ""

    @IBOutlet weak var mapAddressTextField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapAddressTextField.text = collegeLocation

    }
    
       func textFieldShouldReturn(textField: UITextField) -> Bool {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(mapAddressTextField.text!, completionHandler: { (placemarks, error) in
            
            if error != nil {
                print(error)
            }
            else {
                let placemark = placemarks!.first as CLPlacemark!
                let center = placemark.location!.coordinate
                let span = MKCoordinateSpanMake(0.1, 0.1)
                self.displayMap(center, span: span, pinTitle: textField.text!)
            }
        })
        mapAddressTextField.resignFirstResponder()
        return true
        
    }
    func displayMap(center: CLLocationCoordinate2D,
                    span: MKCoordinateSpan,
                    pinTitle: String){
                let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.title = pinTitle
        pin.coordinate = center
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
}