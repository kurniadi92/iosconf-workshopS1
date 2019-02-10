//
//  BundleExtensionTest.swift
//  HackingWithSwiftTests
//
//  Created by Kurniadi on 10/02/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import XCTest

@testable import HackingWithSwift

class BundleExtensionTest: XCTestCase {

    func testLoadBundle() {
        
        let comparedProject = loadProjectComparison()
        let randomNumber = Int.random(in: 0...29)
        let projects = Bundle().loadProject()
        
        XCTAssertTrue(projects.count == 30)
        XCTAssertEqual(projects[randomNumber], comparedProject[randomNumber])
    }
    
    private func loadProjectComparison() -> [Project] {
        guard let url = Bundle.main.url(forResource: "projects", withExtension: "json") else {
            assertionFailure()
            return []
        }
        
        guard let data = try? Data(contentsOf: url) else {
            assertionFailure()
            return []
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedProjects = try? decoder.decode([Project].self, from: data) else {
            assertionFailure()
            return []
        }
        
        return loadedProjects
    }
}
