//
//  ViewController.swift
//  TestProjectTableView
//
//  Created by Volodymyr Smulskyi on 10/4/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//
import Foundation
import UIKit


enum Item: CaseIterable {
    case status
    case rocket
    case missionDetails
    case location
    case stats
}

class DetailsVC: UIViewController {
    
    var launch: Launch?
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = launch?.name
        
        detailsTableView.dataSource = self
        detailsTableView.tableFooterView = UIView()
        detailsTableView.rowHeight = UITableView.automaticDimension
        detailsTableView.estimatedRowHeight = 60
        registerCell()
        detailsTableView.reloadData()
    }
    
    func registerCell() {
        detailsTableView.register(UINib(nibName: "StatusTableViewCell", bundle:Bundle.main ), forCellReuseIdentifier:"Status")
        detailsTableView.register(UINib(nibName: "RocketTableViewCell", bundle:Bundle.main ), forCellReuseIdentifier:"Rocket")
        detailsTableView.register(UINib(nibName: "MissionDetailsTableViewCell", bundle:Bundle.main ), forCellReuseIdentifier:"MissionDetails")
        detailsTableView.register(UINib(nibName: "LocationTableViewCell", bundle:Bundle.main ), forCellReuseIdentifier:"Location")
        detailsTableView.register(UINib(nibName: "StatsTableViewCell", bundle:Bundle.main ), forCellReuseIdentifier:"Stats")
    }
    
    private func constructCellForModel(cellModel: Launch, tableView:UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        let item = Item.allCases[indexPath.section]
        switch item {
        case .status:
            if let statusCell = tableView.dequeueReusableCell(withIdentifier: "Status") as? StatusTableViewCell {
                statusCell.delegate = self
                statusCell.configureWith(data: cellModel)
                cell = statusCell
                return cell
            }
            
        case .rocket:
            if let statusCell = tableView.dequeueReusableCell(withIdentifier: "Rocket") as? RocketTableViewCell {
                statusCell.configureWith(data: cellModel)
                cell = statusCell
                return cell
            }
            
        case .missionDetails:
            if let statusCell = tableView.dequeueReusableCell(withIdentifier: "MissionDetails") as? MissionDetailsTableViewCell {
                statusCell.configureWith(data: cellModel)
                cell = statusCell
                return cell
            }
            
        case .location:
            if let statusCell = tableView.dequeueReusableCell(withIdentifier: "Location") as? LocationTableViewCell {
                statusCell.configureWith(data: cellModel)
                cell = statusCell
                return cell
            }
            
        case .stats:
            if let statusCell = tableView.dequeueReusableCell(withIdentifier: "Stats") as? StatsTableViewCell {
                statusCell.configureWith(data: cellModel)
                cell = statusCell
                return cell
            }
        }
        
        return cell
    }
    
}

extension DetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Item.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vcWebViki = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebVikiVC") as? WebVikiVC
        {
            
            let item = Item.allCases[indexPath.section]
            switch item {
            case .rocket:
                if let url = launch?.rocket?.wikiURL {
                    vcWebViki.url = url
                }
                
                if let navigator = navigationController {
                    navigator.pushViewController(vcWebViki, animated: true)
                }
                
            case .location:
                if let url = launch?.lsp?.wikiURL {
                    vcWebViki.url = url
                }
                if let navigator = navigationController {
                    navigator.pushViewController(vcWebViki, animated: true)
                }
                
            default: break
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let launchData = launch else { return UITableViewCell() }
        
        let cellModel = launchData
        let cell = constructCellForModel(cellModel: cellModel, tableView:tableView, indexPath: indexPath)
        cell.layer.cornerRadius = 12
        cell.layer.masksToBounds = true
        cell.contentView.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 20))
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: tableView.frame.size.width, height: 20))
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = UIColor.black
        view.addSubview(label)
        
        let item = Item.allCases[section]
        
        switch item {
        case .status:
            label.text = "Status"
            
        case .rocket:
            label.text = "Rocket"
            
        case .missionDetails:
            label.text = "MissionDetails"
            
        case .location:
            label.text = "Location"
            
        case .stats:
            label.text = "Stats"
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
}

extension DetailsVC: StatusTableViewCellDelegete {
    
    func didTapOnButton() {
        if let vcWebViki = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebVikiVC") as? WebVikiVC
        {
            let arrayOfURL = launch?.location?.pads?.first?.agencies?.first?.infoURLs
            let youtubeURL = arrayOfURL?.filter {$0.contains("youtube")}
            if let url = youtubeURL?.first  {
                vcWebViki.url = url
            }
            
            if let navigator = navigationController {
                navigator.pushViewController(vcWebViki, animated: true)
            }
        }
    }
}
