//
//  MainCoordinator.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 12/02/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator {
    
    private (set) var navigationController: UINavigationController
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = storyboard.instantiateViewController(withIdentifier:
            "ViewController") as! ViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetail(with project: Project) {
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        
        detailVC.coordinator = self
        detailVC.project = project
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    func read(project: Project) {
        guard let readVC = storyboard.instantiateViewController(withIdentifier: "ReadViewController") as? ReadViewController else {
        return
        }
        
        readVC.project = project
        navigationController.pushViewController(readVC, animated: true)
    }
    
    func showSetting(for user:User, whenDataUpdatedChange presenter: ViewController) {
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {
            fatalError("Unable to find SettingsViewController")
        }
        
        vc.delegate = presenter
        vc.user = user
        navigationController.pushViewController(vc, animated: true)
    }
}
