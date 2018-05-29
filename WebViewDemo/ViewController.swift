//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Jon Boling on 5/28/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView?
    
    override func loadView() {
        
        webView = WKWebView()
        webView?.navigationDelegate = self
        view = webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = URL(string:"https://en.wikipedia.org/wiki/Main_Page")
        let request = URLRequest(url: url!)
        webView!.load(request)
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView?.reload))
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Smback") , style: .plain, target: webView, action: #selector(webView?.goBack))
        let forwardButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Smforward"), style: .plain, target: webView, action: #selector(webView?.goForward))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolbarItems = [refresh, spacer, backButton, spacer, forwardButton]
        navigationController?.isToolbarHidden = false
        
        webView?.allowsBackForwardNavigationGestures = true
    
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}

