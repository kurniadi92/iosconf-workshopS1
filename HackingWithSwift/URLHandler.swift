//
//  URLHandler.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 10/02/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class URLHandler {
    
    private var allowedSites = [String]()
    
    init(allowNavigateTo allowedSites:[String]) {
        self.allowedSites = allowedSites
    }
    
    func openUrl(navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if allowedSites.contains(where: host.contains) {
                decisionHandler(.allow)
                return
            }
        }
        
        guard let url = navigationAction.request.url else {
            return
        }
        UIApplication.shared.open(url, options: [:])
        decisionHandler(.cancel)
    }
}
