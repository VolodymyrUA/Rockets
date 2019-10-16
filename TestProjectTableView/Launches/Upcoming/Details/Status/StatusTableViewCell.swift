//
//  StatusTableViewCell.swift
//  TestProjectTableView
//
//  Created by Volodymyr Smulskyi on 10/7/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import Foundation
import UIKit

protocol  StatusTableViewCellDelegete: class {
    func  didTapOnButton()
}

class StatusTableViewCell: UITableViewCell {
    
    weak var delegate: StatusTableViewCellDelegete?
    
    var youtubeURL = String()
    
    @IBOutlet weak var statusDateLabel: UILabel!
    @IBOutlet weak var statusDescriptionLabel: UILabel!
    @IBAction func statusWatchBtn(_ sender: Any) {
        delegate?.didTapOnButton()
        }
    
    func configureWith(data: Launch) {
        guard  let date = data.net else {return}
        statusDateLabel.text = date
        statusDescriptionLabel.text = data.missions?.first?.name
    }
}

//        if let vcWebViki = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebVikiVC") as? WebVikiVC {

//            if let navigator = NavigationController {
//                navigator.pushViewController(vcWebViki, animated: true)
//            }
