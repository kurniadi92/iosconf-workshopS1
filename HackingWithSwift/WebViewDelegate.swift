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
    
    fileprivate var allowedSites = [String]()
    fileprivate var urlHandler: URLHandler
    
    init(allowNavigationTo allowedSites:[String], urlHandler: URLHandler) {
        self.allowedSites = allowedSites
        self.urlHandler = urlHandler
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if allowedSites.contains(where: host.contains) {
                decisionHandler(.allow)
                return
            }
        }
        
        self.urlHandler.openUrl(url: navigationAction.request.url)
        decisionHandler(.cancel)
    }
}
