//
//  CalendarTableViewCell.swift
//  Rainfall
//
//  Created by Mounika on 12/15/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    @IBOutlet weak var verticalLineBig: UILabel!
    @IBOutlet weak var verticalLineSmall: UILabel!
    @IBOutlet weak var titeLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
