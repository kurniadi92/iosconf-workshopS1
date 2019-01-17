//
//  ProjectTest.swift
//  HackingWithSwiftTests
//
//  Created by Kurniadi on 17/01/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import XCTest

@testable import HackingWithSwift

class ProjectTest: XCTestCase {

    let projectTitleMock = "Project Title"
    let projectSubTitleMock = "Project Subtitle"
    let projectTopics = "Mock Topic"
    
    func testMakeAttributedString() {
        let project = Project(number: 1, title: projectTitleMock, subtitle: projectSubTitleMock, topics: projectTopics)
        XCTAssertEqual(project.makeAttributedString(), attributedStringMock())
    }
    
    func attributedStringMock() -> NSAttributedString {
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedString.Key.foregroundColor: UIColor.purple]
        let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]
        
        let titleString = NSMutableAttributedString(string: "\(projectTitleMock)\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: projectSubTitleMock, attributes: subtitleAttributes)
        
        titleString.append(subtitleString)
        
        return titleString
    }
}
