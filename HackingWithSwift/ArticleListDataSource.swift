//
//  ArticleListDataSource.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 17/01/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation
import UIKit

class ArticleListDataSource:NSObject, UITableViewDataSource{
    
    private (set) var showingProject: [Project] = [Project]()
    private var allProjects = [Project]()
    
    override init() {
        allProjects = Bundle().loadProject()
        showingProject = allProjects
    }
    
    func showArticleWithNumber(number: Int) {
        if number == 0 {
             showingProject = allProjects
            
        } else {
            let filteredProject = allProjects.filter {
                $0.number % 3 == number - 1
            }
            showingProject = filteredProject
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showingProject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let project = showingProject[indexPath.row]
        cell.textLabel?.attributedText = project.makeAttributedString()
        return cell
    }
    
}
