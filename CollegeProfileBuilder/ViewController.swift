//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Aaron on 2016-07-25.
//  Copyright © 2016 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var universities : [University] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag == 0
        universities.append(University(uniName: "Berkley", location: "Berkley, California", enrollment: 37581, image: UIImage(named: "berkeley.png")!))
        universities.append(University(uniName: "Stanford", location: "Stanford, California", enrollment: 16136, image: UIImage(named: "stanford.png")!))
        universities.append(University(uniName: "NorthWestern", location: "Evanston, Illinois", enrollment: 20336, image: UIImage(named: "NorthWestern.png")!))
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). " + universities[indexPath.row].uniName
        return cell
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            universities.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    @IBAction func onTappedButtonAdd(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add University", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Add University Here"
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) in
            let universityTextField = alert.textFields![0] as UITextField
            self.universities.append(University(uniName: universityTextField.text!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let university = universities[sourceIndexPath.row]
        universities.removeAtIndex(sourceIndexPath.row)
        universities.insert(university, atIndex: destinationIndexPath.row)
    }
    @IBAction func editButtonTapped(sender: UIBarButtonItem) {
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
        }
        else {
            tableView.editing = false
            sender.tag = 0
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! detailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.university = universities[index!]

    }
}



