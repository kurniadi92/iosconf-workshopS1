//
//  WebViewDelegate.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 17/01/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation
import WebKit

class WebViewDelegate: NSObject, WKNavigationDelegate {
    
    var allowedSites = [String]()
    
    init(allowNavigationTo allowedSites:[String]) {
        self.allowedSites = allowedSites
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if allowedSites.contains(where: host.contains) {
                decisionHandler(.allow)
                return
            }
        }
        
        if let url = navigationAction.request.url {
            UIApplication.shared.open(url, options: [:])
        }
        
        decisionHandler(.cancel)
    }
}
