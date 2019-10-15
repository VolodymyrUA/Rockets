//
//  StatusTableViewCell.swift
//  TestProjectTableView
//
//  Created by Volodymyr Smulskyi on 10/7/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import Foundation
import UIKit

class StatusTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statusDateLabel: UILabel!
    @IBOutlet weak var statusDescriptionLabel: UILabel!
    @IBOutlet weak var statusWatchLabel: UILabel!
    
    
    func configureWith(data: Launch) {
        guard  let date = data.net else {return}
        
        statusDateLabel.text = date
        statusDescriptionLabel.text = data.missions?.first?.name
        statusWatchLabel.text = "watch"
    }
}
