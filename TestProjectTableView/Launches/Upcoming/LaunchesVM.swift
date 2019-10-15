//
//  LaunchesVM.swift
//  TestProjectTableView
//
//  Created by Volodymyr Smulskyi on 10/7/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import Foundation
import UIKit

class LaunchesVM {
    
    var dataResponse: Launches!
    var url = "https://launchlibrary.net/1.4/launch/next/20"
}

extension LaunchesVM {
    
    func makeRequest(closure: @escaping ([Launch]) -> Void) {
        
        guard let url = URL(string: url) else { return}

        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data,_,_) in
            guard let data = data else {return}
            do {
                let dataResponse = try JSONDecoder().decode(Launches.self, from: data)
                self.dataResponse = dataResponse
                closure(dataResponse.launches ?? [])
                
            } catch let error {
            print(error)
            }
        }
        task.resume()

    }
}
