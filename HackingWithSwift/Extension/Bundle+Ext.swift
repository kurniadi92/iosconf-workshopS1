//
//  Bundle+Ext.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 10/02/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation

extension Bundle {
    func loadProject() -> [Project] {
        guard let url = Bundle.main.url(forResource: "projects", withExtension: "json") else {
            fatalError("Failed to locate projects.json in app bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load projects.json in app bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedProjects = try? decoder.decode([Project].self, from: data) else {
            fatalError("Failed to decode projects.json from app bundle.")
        }
        
        return loadedProjects
    }
}
