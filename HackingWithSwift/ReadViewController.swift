//
//  ReadViewController.swift
//  HackingWithSwift
//
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit
import WebKit

class ReadViewController: UIViewController, LogHandlingProtocol {
    var webView = WKWebView()
    var project: Project!
    var webviewDelegate: WebViewDelegate?

    let allowedSites = ["apple.com", "hackingwithswift.com"]

    override func loadView() {
        webviewDelegate = WebViewDelegate(allowNavigationTo: allowedSites, urlHandler: URLHandler())
        webView.navigationDelegate = webviewDelegate

        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(project != nil, "You must set a project before showing this view controller.")
        title = project.title
        log("Read project \(project.number).")

        guard let url = URL(string: "https://www.hackingwithswift.com/read/\(project.number)/overview") else {
            return
        }

        let request = URLRequest(url: url)
        webView.load(request)
    }
}
