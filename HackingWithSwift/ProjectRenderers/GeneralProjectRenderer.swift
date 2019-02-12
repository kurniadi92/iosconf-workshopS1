//
//  GeneralProjectRenderer.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 12/02/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation
import UIKit

class GeneralProjectRenderer: RendererProtocol {
    
    private (set) var project: Project
    var colors:[UIColor] {
        return [UIColor(red: 27/255.0, green: 215/255.0, blue: 253/255.0, alpha: 1), UIColor(red: 30/255.0, green: 98/255.0, blue: 241/255.0, alpha: 1)]
    }
    var projectName: String {
        return "App Project"
    }
    
    init(for project: Project) {
        self.project = project
    }
}
