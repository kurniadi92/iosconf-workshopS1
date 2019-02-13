//
//  SettingsViewController.swift
//  HackingWithSwift
//
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var name: BoundTextField!
    @IBOutlet var projects: BoundSegmentedControl!

    weak var delegate: ViewController?
    var user: User!
    let strName = Observable<String>("")
    let selectedIndex = Observable<Int>(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard user != nil else {
            assertionFailure("You must set a user before showing this view controller.")
            return
        }

        title = "Settings"
        
        
        name.bind(to: strName)
        projects.bind(to: selectedIndex)
        
        name.text = user.name
        projects.selectedSegmentIndex = user.showProjects
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let selectedIndex = selectedIndex.value else { return }
        user.showProjects = selectedIndex
        delegate?.updateUser(user)
        
        guard let name = strName.value, !name.isEmpty else { return }
        user.name = name
        delegate?.updateUser(user)
    }
}
