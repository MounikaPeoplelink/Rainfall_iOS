//
//  TFRemainderTableViewCell.swift
//  Rainfall
//
//  Created by Mounika on 12/20/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

import UIKit

class TFRemainderTableViewCell: UITableViewCell {
    @IBOutlet weak var imageVw: UIImageView!
    @IBOutlet weak var textField: UITextField!

    let imageNames = ["title", "date", "time", "call_gray", "email_gray", "addnote"]
    let placeholders = ["Remainder Title", "Date", "Time", "Phone Number", "E-mail", "Add note"]
    var date = ""
    var time = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContentForIndexpath(indexpath: IndexPath){
        self.textField.placeholder = placeholders[indexpath.row]
        self.imageVw.image = UIImage.init(named: imageNames[indexpath.row])
        
        if indexpath.row == 1 || indexpath.row == 2 {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = indexpath.row == 1 ? .date : .time
            datePicker.minimumDate = Date()
            datePicker.addTarget(self, action: #selector(self.onDatePickerValueChanged(picker:)), for: .valueChanged)
            datePicker.tag = indexpath.row
            self.textField.inputView = datePicker
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat =  datePicker.tag == 1 ? "EEE dd MMM, yyyy" : "HH:mm"
            textField.text = dateFormatter.string(from: Date())
        }
    }
    @objc func onDatePickerValueChanged(picker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  picker.tag == 1 ? "EEE dd MMM, yyyy" : "HH:mm"
        textField.text = dateFormatter.string(from: picker.date)

    }
}
