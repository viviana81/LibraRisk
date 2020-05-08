//
//  ViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit
import WebKit
import Kingfisher

class EarthQuakeDetailViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var earthQuakewebView: WKWebView!
    @IBOutlet var myView: UIView!

    var webView: WKWebView!
    private let earthQuake: EarthQuake
    
    init(earthQuake: EarthQuake) {
        self.earthQuake = earthQuake
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: progressView
        let image = earthQuake.url
        if let url = URL(string: image) {
            webView.load(URLRequest(url: url))
        }
        
        webView.allowsBackForwardNavigationGestures = true
    }
}
