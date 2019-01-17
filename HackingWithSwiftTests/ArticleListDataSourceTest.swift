//
//  ArticleListDataSourceTest.swift
//  HackingWithSwiftTests
//
//  Created by Kurniadi on 17/01/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import XCTest

@testable import HackingWithSwift

class ArticleListDataSourceTest: XCTestCase {

    func testInit() {
        let articleListDataSource = ArticleListDataSource()
        XCTAssertEqual(articleListDataSource.showingProject.count, 30)
    }

    func testShowArticleWithNumber1() {
        let articleListDataSource = ArticleListDataSource()
        articleListDataSource.showArticleWithNumber(number: 1)
        XCTAssertEqual(articleListDataSource.showingProject.count, 10)
        let firstItem = articleListDataSource.showingProject.first!
        XCTAssertEqual(firstItem.title, "Social Media")
    }
    
    func testShowArticleWithNumber2() {
        let articleListDataSource = ArticleListDataSource()
        articleListDataSource.showArticleWithNumber(number: 2)
        XCTAssertEqual(articleListDataSource.showingProject.count, 10)
        let firstItem = articleListDataSource.showingProject.first!
        XCTAssertEqual(firstItem.title, "Storm Viewer")
    }
    
    func testShowArticleWithNumber3() {
        let articleListDataSource = ArticleListDataSource()
        articleListDataSource.showArticleWithNumber(number: 3)
        XCTAssertEqual(articleListDataSource.showingProject.count, 10)
        let firstItem = articleListDataSource.showingProject.first!
        XCTAssertEqual(firstItem.title, "Guess the Flag")
    }
    
}
