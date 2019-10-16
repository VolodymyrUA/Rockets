//
//  WebControllerViki.swift
//  TestProjectTableView
//
//  Created by Volodymyr Smulskyi on 10/11/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import Foundation
import WebKit


class WebVikiVC: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var url: String?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard  let wikiURL = url else { return }
        
        let myURL = URL(string: wikiURL)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(popToRoot))
        
       
    }
    
    @objc func popToRoot() {
        let previousVC = navigationController!.viewControllers.filter { $0 is DetailsVC }.first!
        navigationController?.popToViewController(previousVC, animated: true)
    }
    
}
