//
//  MissionDetailsTableViewCell.swift
//  TestProjectTableView
//
//  Created by Volodymyr Smulskyi on 10/7/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import Foundation
import UIKit

class MissionDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var missionTitleLabel1: UILabel!
    @IBOutlet weak var missionDescriptionLabel1: UILabel!
    @IBOutlet weak var missionOrbitLabel1: UILabel!
    
//    @IBOutlet weak var missionTitleLabel2: UILabel!
//    @IBOutlet weak var missionDescriptionLabel2: UILabel!
//    @IBOutlet weak var missionOrbitLabel2: UILabel!

    func configureWith(data: Launch)  {
       // view.layer.cornerRadius = 25
        
        missionTitleLabel1.text = data.missions?.first?.name
        missionDescriptionLabel1.text = data.missions?.first?.description
        missionOrbitLabel1.text = "Total Mass: 1300 kg"
        
//        missionTitleLabel2.text = data.missions?.first?.name
//        missionDescriptionLabel2.text = data.missions?.first?.description
//        missionOrbitLabel2.text = "Total Mass: 1300 kg"
        
    }
    
}
