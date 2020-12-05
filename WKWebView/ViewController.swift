//
//  ViewController.swift
//  WKWebView
//
//  Created by 阿迦井翔 on 2020/08/30.
//  Copyright © 2020 kakeru.geek. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView = WKWebView()

    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        // 大きさ
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height*2)
        view.addSubview(webView)
        
        let url = URL(string: "https://www.yahoo.co.jp/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("読み込み開始")
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("ロード完了")
        indicator.stopAnimating()
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func back(_ sender: Any) {
        
    }
    
}

