//
//  ContentView.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/26/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

import UIKit
class ContentView: UIView {
    
    var dayLabel = UILabel(frame: CGRect.zero)
    var dayNameLabel = UILabel(frame: CGRect.zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        dayLabel.text = "1"
        dayLabel.textColor = UIColor.white
        dayLabel.font = UIFont(name:"Arial", size: 13.0)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayNameLabel.text = "L"
        dayNameLabel.textColor = UIColor.white
        dayNameLabel.font = UIFont(name:"Arial", size: 13.0)
        
        dayNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dayLabel)
        addSubview(dayNameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            dayNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dayNameLabel.bottomAnchor.constraint(equalTo: dayLabel.topAnchor, constant: 3.0),
            dayLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 7.0),
            dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
    }
    
}
