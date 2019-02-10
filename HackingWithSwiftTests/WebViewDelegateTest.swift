//
//  WebViewDelegateTest.swift
//  HackingWithSwiftTests
//
//  Created by Kurniadi on 10/02/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import XCTest
import WebKit

@testable import HackingWithSwift

class URLHandlerMock: URLHandler {
    private (set) var isOpenUrlCalled = false
    
    override func openUrl(url: URL?) {
        isOpenUrlCalled = true
    }
}

class WebViewDelegateTest: XCTestCase {

    func disabkedTestOpenWebview() {
        let urlHandler = URLHandlerMock()
        let wkNavigation = WKNavigationAction()
        
        let webViewDelegate = WebViewDelegate(allowNavigationTo: ["http://www.google.com"], urlHandler: urlHandler)
        webViewDelegate.webView(WKWebView(), decidePolicyFor: wkNavigation) { _ in
            //nothing
        }
        
        XCTAssertTrue(urlHandler.isOpenUrlCalled)
    }
}
