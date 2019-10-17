//
//  RocketTableViewCell.swift
//  TestProjectTableView
//
//  Created by Володимир Смульський on 10/7/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

class RocketTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var companyNameLbl: UILabel!{
        didSet {
            companyNameLbl.layer.cornerRadius = 6
            companyNameLbl.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var rocketNameLbl: UILabel!
    @IBOutlet weak var descritionLbl: UILabel!
    @IBOutlet weak var isActiveLbl: UILabel!

    
    func configureWith(data: Launch) {
        
        let url = URL(string: data.rocket?.imageURL ?? "")
        rocketImage.kf.setImage(with: url)
        companyNameLbl.text = data.name
        rocketNameLbl.text = data.rocket?.name
        descritionLbl.text = "1data wich I dont have in reques 2data wich I dont have in requestdata wich I dont have in request3data wich I dont have in reques4tdata wich I dont have in request5data wich I dont have in reques6tdata wich I dont have in request7data wich I dont have in"
      
        isActiveLbl.text = "Active"
    }
}
