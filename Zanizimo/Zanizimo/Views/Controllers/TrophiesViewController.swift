//
//  TabThreeViewController.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/17/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

class TrophiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trophy"
    }
    
    override func loadView() {
         super.loadView()
        
        view = UIView()
        let imageView = MedalView()
        imageView.contentMode = .scaleAspectFit
        
        
        view.backgroundColor = UIColor(named: "Purple")
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        stackView.addArrangedSubview(imageView)
        imageView.colorName = "gold"
        imageView.number = "3"
        imageView.showMedal(show: true)
    }

}
