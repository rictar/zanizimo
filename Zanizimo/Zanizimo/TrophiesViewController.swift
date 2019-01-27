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

        // Do any additional setup after loading the view.
        self.title = "Trophy"
    }
    
    var strings: [String] = ["Gola","Miund"]
    
    override func loadView() {
        // super.loadView()   // DO NOT CALL SUPER
        
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
        
        for string in strings {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = string
            stackView.addArrangedSubview(label)
        }
        
        stackView.addArrangedSubview(imageView)
        imageView.colorName = "gold"
        imageView.number = "3"
        imageView.showMedal(show: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
