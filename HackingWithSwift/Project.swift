//
//  Project.swift
//  HackingWithSwift
//
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

struct Project: Codable {
    var number: Int
    var title: String
    var subtitle: String
    var topics: String
    
    func makeAttributedString() -> NSAttributedString {
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedString.Key.foregroundColor: UIColor.purple]
        let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]
        
        let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)
        
        titleString.append(subtitleString)
        
        return titleString
    }
}

extension Project: Equatable {
    static func ==(lhs: Project, rhs: Project) -> Bool {
        return lhs.number == rhs.number &&
            lhs.title == rhs.title &&
            lhs.subtitle == rhs.subtitle &&
            lhs.topics == rhs.topics &&
            lhs.makeAttributedString() == rhs.makeAttributedString()
    }
}
