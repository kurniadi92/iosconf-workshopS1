//
//  DetailViewController.swift
//  HackingWithSwift
//
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var project: Project!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let project = project else {
            assertionFailure("You must set a project before showing this view controller.")
            return
        }
        
        navigationItem.largeTitleDisplayMode = .never
        title = "Project \(project.number)"
        Logger.log("Showed project \(project.number).")
        
        let detailView = DetailView(withProject: project, frame: view.frame) { [weak self] in
             self?.readProject()
        }
        
        view = detailView.render()

    }

    @objc func readProject() {
        guard let readVC = storyboard?.instantiateViewController(withIdentifier: "ReadViewController") as? ReadViewController else {
            return
        }

        readVC.project = project
        navigationController?.pushViewController(readVC, animated: true)
    }
}
