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
    //since whole UI is made in code, no need for webview to be optional
    
    var refresh = UIBarButtonItem()
    var backButton = UIBarButtonItem()
    var forwardButton = UIBarButtonItem()
    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    
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
        
        refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView?.reload))
        backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Smback") , style: .plain, target: webView, action: #selector(webView?.goBack))
        forwardButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Smforward"), style: .plain, target: webView, action: #selector(webView?.goForward))
    
        backButton.isEnabled = false
        forwardButton.isEnabled = false
        
        toolbarItems = [refresh, spacer, backButton, spacer, forwardButton]
        navigationController?.isToolbarHidden = false
        
        webView?.allowsBackForwardNavigationGestures = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
}

