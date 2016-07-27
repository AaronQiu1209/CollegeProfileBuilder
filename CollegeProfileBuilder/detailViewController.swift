
//
//  detailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Aaron on 2016-07-25.
//  Copyright © 2016 Aaron. All rights reserved.
//

import UIKit
import SafariServices
class detailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var webAdressTextField: UITextField!
    
    @IBOutlet weak var universityTextField: UITextField!
    
    @IBOutlet weak var enrollmentTextField: UITextField!

    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    var university: University!
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        universityTextField.text = university.uniName
        locationTextField.text = university.location
        enrollmentTextField.text = String(university.enrollment)
        webAdressTextField.text = university.urlString
        imageView.image = university.image
        imagePicker.delegate = self
    }
    @IBAction func saveButtonTapped(sender: UIButton) {
        university.uniName = universityTextField.text!
        university.location = locationTextField.text!
        university.enrollment = Int(enrollmentTextField.text!)!
        university.urlString = webAdressTextField.text!
        university.image = imageView.image!
    }
    @IBAction func openInSafariWithDoneButton(sender: UIButton) {
        if webAdressTextField.text!.containsString("https://") == true{
            let url = NSURL(string: university.urlString)!
            let svc = SFSafariViewController(URL: url)
            presentViewController(svc, animated: true, completion: nil)
        } else {
            webAdressTextField.text! = "https://" + webAdressTextField.text!
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true){
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }
    @IBAction func libraryOnTappedButton(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraOnTappedButton(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
}
