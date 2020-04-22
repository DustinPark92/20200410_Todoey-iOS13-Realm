//
//  WeeklyTableViewCell.swift
//  Todoey
//
//  Created by Dustin on 2020/04/22.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

class WeeklyTableViewCell: UITableViewCell {

    @IBOutlet weak var weeklyView: UIView!
    @IBOutlet weak var weeklyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
