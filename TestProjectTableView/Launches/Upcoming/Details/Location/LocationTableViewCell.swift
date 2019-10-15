//
//  LocationTableViewCell.swift
//  TestProjectTableView
//
//  Created by Volodymyr Smulskyi on 10/7/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var LocationLabel: UILabel!
    
    func configureWith(data: Launch) {
        LocationLabel.text = data.location?.name
    }
        
}
