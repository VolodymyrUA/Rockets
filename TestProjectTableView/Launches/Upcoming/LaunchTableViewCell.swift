//
//  LaunchtableViewCell.swift
//  TestProjectTableView
//
//  Created by Volodymyr Smulskyi on 10/9/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class LaunchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var roundedView: UIView!{
        didSet{
            roundedView.layer.cornerRadius = 12
            roundedView.clipsToBounds = true
        }
    }
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var missionLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var rocketCarrierLbl: UILabel!
    @IBOutlet weak var launchComplexLbl: UILabel!
    @IBOutlet weak var rocketLaunchDateLbl: UILabel!
    
    func setData(data: Launch)  {
        
        let url = URL(string: data.rocket?.imageURL ?? "")
        rocketImage.kf.setImage(with: url)
        
        missionLbl.text = data.name
        companyLbl.text = data.missions?.first?.name
        rocketCarrierLbl.text = data.rocket?.name
        launchComplexLbl.text = data.location?.name
        rocketLaunchDateLbl.text = data.net
    }
    
}
