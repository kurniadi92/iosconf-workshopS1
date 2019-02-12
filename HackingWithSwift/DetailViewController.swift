//
//  DetailViewController.swift
//  HackingWithSwift
//
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, LogHandlingProtocol {
    var project: Project!
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let project = project else {
            assertionFailure("You must set a project before showing this view controller.")
            return
        }
        
        navigationItem.largeTitleDisplayMode = .never
        title = "Project \(project.number)"
        log("Showed project \(project.number).")
        
        let detailView = DetailView(withProject: project) { [weak self] in
             self?.readProject()
        }
        
        view = detailView.render()

    }

    @objc func readProject() {
      coordinator?.read(project: project)
    }
}
