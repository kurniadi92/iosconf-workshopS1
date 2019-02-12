//
//  MainCoordinatorTest.swift
//  HackingWithSwiftTests
//
//  Created by Kurniadi on 12/02/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import XCTest

@testable import HackingWithSwift

class MainCoordinatorTest: XCTestCase {
 
    var rootNavController: UINavigationController!
    var mainCoordinator: MainCoordinator!
    
    override func setUp() {
        rootNavController = UINavigationController()
        mainCoordinator = MainCoordinator(navigationController: rootNavController)
    }
    
    func testStart_topVCisViewController() {
        mainCoordinator.start()
        
        XCTAssertTrue(rootNavController.topViewController! is ViewController)
    }
    
    func testShowDetail_topVCisDetailViewController() {
        
        let project = Project(number: 1, title: "Title-Mock", subtitle: "Subject-Mock", topics: "Topic-Mock")
        mainCoordinator.showDetail(with: project)
        
        let topVC = rootNavController.topViewController!
        XCTAssertTrue(topVC is DetailViewController)
        XCTAssertEqual((topVC as! DetailViewController).project, project)
    }
    
    func testRead_topVCisReadViewController() {
        let project = Project(number: 1, title: "Title-Mock", subtitle: "Subject-Mock", topics: "Topic-Mock")
        
        mainCoordinator.read(project: project)
        
        let topVC = rootNavController.topViewController!
        XCTAssertTrue(topVC is ReadViewController)
        XCTAssertEqual((topVC as! ReadViewController).project, project)
    }
    
    func testShowSetting_topVCisSettingsViewController() {
        let user = User(name: "Name-mock", showProjects: 1)
        let updateTargeVC = ViewController()
        mainCoordinator.showSetting(for: user, whenDataUpdatedChange: updateTargeVC)
        
        let topVC = rootNavController.topViewController!
        XCTAssertTrue(topVC is SettingsViewController)
        XCTAssertEqual((topVC as! SettingsViewController).user, user)
        XCTAssertEqual((topVC as! SettingsViewController).delegate, updateTargeVC)
    }

}
