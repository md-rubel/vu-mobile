//
//  ResultVC.swift
//  VU Mobile Test
//
//  Created by MD RUBEL on 2/5/20.
//  Copyright © 2020 MD RUBEL. All rights reserved.
//

import UIKit
import WebKit

class ResultVC: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.backgroundColor = .white
        webView.navigationDelegate = self
        
        let url = URL(string: "https://google.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}
