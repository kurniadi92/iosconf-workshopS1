//
//  DetailView.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 17/01/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    var project: Project!
    private var readButtonClicked: (() -> ())?
    
    init(withProject project:Project, readButtonAction: @escaping () -> Void) {
        readButtonClicked = readButtonAction
        super.init(frame: CGRect.zero)
        
        self.project = project
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("it will crash, we not use this")
        super.init(coder: aDecoder)
    }
    
    func render() -> UIView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
            ])
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        if project.number % 3 == 1 {
            let renderer = AppProjectRenderer(for: project)
            imageView.image = renderer.drawTitleImage()
        } else if project.number % 3 == 2 {
            let renderer = GameProjectRenderer(for: project)
            imageView.image = renderer.drawTitleImage()
        } else {
            let renderer = TechniqueProjectRenderer(for: project)
            imageView.image = renderer.drawTitleImage()
        }
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.numberOfLines = 0
        titleLabel.text = project.title
        
        let detailLabel = UILabel()
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont.preferredFont(forTextStyle: .body)
        detailLabel.text = project.subtitle
        
        let learnTitleLabel = UILabel()
        learnTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        learnTitleLabel.numberOfLines = 0
        learnTitleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        learnTitleLabel.text = "You'll learn…"
        
        let learnDetailLabel = UILabel()
        learnDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        learnDetailLabel.numberOfLines = 0
        learnDetailLabel.font = UIFont.preferredFont(forTextStyle: .body)
        learnDetailLabel.text = project.topics
        
        let showButton = UIButton(type: .system)
        showButton.translatesAutoresizingMaskIntoConstraints = false
        showButton.setTitle("Start Reading", for: .normal)
        showButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        showButton.addTarget(self, action: #selector(readProjectTapped), for: .touchUpInside)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
        stackView.addArrangedSubview(learnTitleLabel)
        stackView.addArrangedSubview(learnDetailLabel)
        stackView.addArrangedSubview(showButton)
        
        stackView.spacing = 10
        stackView.setCustomSpacing(40, after: detailLabel)
        stackView.setCustomSpacing(40, after: learnDetailLabel)
        
        return self
    }

    @objc func readProjectTapped() {
       readButtonClicked?()
    }
    
}
