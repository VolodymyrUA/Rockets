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
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var rocketNameLbl: UILabel!
    @IBOutlet weak var descritionLbl: UILabel!
    @IBOutlet weak var isActiveLbl: UILabel!

    
    func configureWith(data: Launch) {
        
        let url = URL(string: data.rocket?.imageURL ?? "")
        rocketImage.kf.setImage(with: url)
        companyNameLbl.text = data.name
        rocketNameLbl.text = data.rocket?.name
        descritionLbl.text = "data wich I dont have in reques data wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestdata wich I dont have in requestt"
        isActiveLbl.text = "Active"
    }
}
