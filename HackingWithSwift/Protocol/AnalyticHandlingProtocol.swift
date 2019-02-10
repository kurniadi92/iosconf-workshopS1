//
//  AnalyticHandlingProtocol.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 10/02/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation

protocol LogHandlingProtocol {
    func log(_ message: String)
}

extension LogHandlingProtocol {
    func log(_ message: String) {
        Logger.log(message)
    }
}
