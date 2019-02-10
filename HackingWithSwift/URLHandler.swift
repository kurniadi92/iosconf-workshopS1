//
//  URLHandler.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 10/02/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation
import UIKit

class URLHandler {
    func openUrl(url: URL?) {
        if let validUrl = url {
            UIApplication.shared.open(validUrl, options: [:])
        }
    }
}
