//
//  LaunchesVC.swift
//  TestProjectTableView
//
//  Created by Володимир Смульський on 10/8/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import Foundation
import UIKit

protocol  LaunchesVCDelegete: class {
    func  didSelectedCell(data: Launch?)
}

class LaunchesVC: UIViewController {
    
    weak var delegate:  LaunchesVCDelegete?
    
    @IBOutlet weak var launchTableView: UITableView! {
        didSet {
            launchTableView.rowHeight = UITableView.automaticDimension
            launchTableView.estimatedRowHeight = 50.0
        }
    }
    
    let viewModel = LaunchesVM()
    var launch: [Launch]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchTableView.tableFooterView = UIView()
        self.viewModel.makeRequest { (launches) in
            DispatchQueue.main.async {
                self.launch = launches
                self.launchTableView.reloadData()
            }
        }
        
    }
}

extension LaunchesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launch?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vcDetail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
        {
            vcDetail.launch = launch?[indexPath.row]
            if let navigator = navigationController {
                navigator.pushViewController(vcDetail, animated: true)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let launchData = launch?[indexPath.row] else {return UITableViewCell()}
        
        //  delegate.didSelectedCell(data: launch?[indexPath.row])
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LaunchTableViewCell
        cell.setData(data: launchData)
        return cell
    }
    
}


