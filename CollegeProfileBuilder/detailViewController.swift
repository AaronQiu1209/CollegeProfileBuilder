
//
//  detailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Aaron on 2016-07-25.
//  Copyright © 2016 Aaron. All rights reserved.
//

import UIKit
import SafariServices
class detailViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var webAdressTextField: UITextField!
    
    @IBOutlet weak var universityTextField: UITextField!
    
    @IBOutlet weak var enrollmentTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    var university: University!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        universityTextField.text = university.uniName
        locationTextField.text = university.location
        enrollmentTextField.text = String(university.enrollment)
        webAdressTextField.text = university.urlString
        imageView.image = university.image
    }
    @IBAction func saveButtonTapped(sender: UIButton) {
        university.uniName = universityTextField.text!
        university.location = locationTextField.text!
        university.enrollment = Int(enrollmentTextField.text!)!
        university.urlString = webAdressTextField.text!
    }
    @IBAction func openInSafariWithDoneButton(sender: UIButton) {
        let url = NSURL(string: university.urlString)!
        let svc = SFSafariViewController(URL: url)
        presentViewController(svc, animated: true, completion: nil)
    }
    
    @IBAction func libraryOnTappedButton(sender: UIButton) {
    }
}
