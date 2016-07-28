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
    override func viewDidLoad() {
        super.viewDidLoad()
        mapAddressTextField.text = collegeLocation
        
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
                    
                    let actionController = UIAlertController(title: "Select an address", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                    
                    if placemarks!.count > 1 {
                        
                        for i in 0..<placemarks!.count {
                            
                            if i <= 9 {
                                break
                            }else
                            {
                                let addressCellAction = UIAlertAction(title: "\(placemarks![i])", style: .Default) { (action) in
                                }
                                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                                
                                actionController.addAction(addressCellAction)
                                actionController.addAction(cancelAction)
                                
                                self.presentViewController(actionController, animated: true, completion: nil)
                            }
                            
                        }
                    }
                }
            })
            self.mapAddressTextField.resignFirstResponder()
            return true
            
        }
    }
}