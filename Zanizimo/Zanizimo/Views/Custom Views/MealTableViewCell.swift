//
//  MealTableViewCell.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/30/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
        
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
        }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
    
    
}
