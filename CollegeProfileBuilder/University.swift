//
//  University.swift
//  CollegeProfileBuilder
//
//  Created by Aaron on 2016-07-25.
//  Copyright © 2016 Aaron. All rights reserved.
//

import UIKit

class University: NSObject {
    var uniName = ""
    var location = ""
    var enrollment = 0
    var image = UIImage(named: "Default")


convenience init(uniName: String, location: String, enrollment: Int, image: UIImage){
    self.init()
    self.uniName = uniName
    self.location = location
    self.enrollment = enrollment
    self.image = image
    
}

convenience init(uniName: String) {
    self.init()
    self.uniName = uniName
}
}

