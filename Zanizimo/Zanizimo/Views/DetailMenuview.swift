//
//  DetailMenuview.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/26/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

class DetailMenuview: UIView {
    
    private var didSetupConstraints = false
    var myLabel = UILabel(frame: CGRect.zero)
    var imageView = UIImageView(image: UIImage(named: "imagen1"))
    private let button = UIButton(type: UIButton.ButtonType.custom)
    
    weak var delegate: DetailMenuviewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(named: "Purple")
        self.clipsToBounds = true
        setupImages()
        self.setNeedsUpdateConstraints()
    }
    
    
    func setupImages() {
        myLabel.text = "Name"
        myLabel.textColor = UIColor.white
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Take food photo", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(DetailMenuview.takePhoto), for: .touchUpInside)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(imageView)
        self.addSubview(myLabel)
        self.addSubview(button)
    }
    
    override func updateConstraints() {
        
        if didSetupConstraints == false {
            addConstraints()
        }
        
        super.updateConstraints()
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 22),
            imageView.centerXAnchor.constraint(equalToSystemSpacingAfter: self.safeAreaLayoutGuide.centerXAnchor, multiplier: 1.0),
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 164),
            imageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            myLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 7.0),
            myLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: imageView.centerXAnchor, multiplier: 1.0),
            button.centerXAnchor.constraint(equalToSystemSpacingAfter: myLabel.centerXAnchor, multiplier: 1.0),
            self.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: button.bottomAnchor , multiplier: 1.0),
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.setRounded()
    }
    
    @objc func takePhoto() {
        self.delegate?.takePhoto()
    }
    
}
