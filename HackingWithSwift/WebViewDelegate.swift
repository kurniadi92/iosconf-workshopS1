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
    
    fileprivate var urlHandler: URLHandler
    
    init(urlHandler: URLHandler) {
        self.urlHandler = urlHandler
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        self.urlHandler.openUrl(navigationAction: navigationAction, decisionHandler: decisionHandler)
    }
}
