//
//  StatsTableViewCell.swift
//  TestProjectTableView
//
//  Created by Volodymyr Smulskyi on 10/7/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import UIKit

class StatsTableViewCell: UITableViewCell {

    @IBOutlet weak var statsYearLabel: UILabel!
    @IBOutlet weak var statsOrbitalAttemptLabel: UILabel!
    @IBOutlet weak var roundedView: UIView!{
        didSet{
            roundedView.layer.cornerRadius = 12
            roundedView.clipsToBounds = true
        }
    }
    
    func configureWith(data: Launch)  {
        
        statsYearLabel.text =  "2019"
        statsOrbitalAttemptLabel.text = "orbital lauch attempt"

    }
    
    func configureWithSecond(data: Launch)  {
        
        statsYearLabel.text =  "2014"
        statsOrbitalAttemptLabel.text = "orbital lauch "
        
    }

    
}
