//
//  Reminder.swift
//  Rainfall
//
//  Created by Mounika on 12/20/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

import UIKit

class Reminder {
    var title = ""
    var date = ""
    var time = ""
    var mobile = ""
    var email = ""
    var addnote = ""

    init() {
        
    }
    init(object:[String:Any]) {
        self.title = object["title"] as? String ?? ""
        self.date = object["date"] as? String ?? ""
        self.time = object["time"] as? String ?? ""
        self.mobile = object["mobile"] as? String ?? ""
        self.email = object["email"] as? String ?? ""
        self.addnote = object["addnote"] as? String ?? ""

    }
}
