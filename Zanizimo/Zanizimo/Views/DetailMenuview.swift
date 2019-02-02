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
    
    var imageView:UIImageView!
    
//    var nameLabel : UILabel!
//    var scheduleLabel : UILabel!
//    var typeMealLabel : UILabel!
    
//    var stackView : UIStackView!
    var tableView: UITableView!
//    var ingredients : UITextView!
    var button : UIButton!
    
    
    
    weak var delegate: DetailMenuviewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(named: "Purple")
        self.clipsToBounds = true
        setupView()
        self.setNeedsUpdateConstraints()
    }
    
    
    func setupView() {
        
//        var myLabel = UILabel(frame: CGRect.zero)
//        var imageView = UIImageView(image: UIImage(named: "imagen1"))
//        var button = UIButton(type: UIButton.ButtonType.custom)
        
//        nameLabel = UILabel(frame: CGRect.zero)
//        nameLabel.text = "nameLabel"
//        nameLabel.textColor = UIColor.white
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        scheduleLabel = UILabel(frame: CGRect.zero)
//        scheduleLabel.text = "scheduleLabel"
//        scheduleLabel.textColor = UIColor.white
//        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        typeMealLabel = UILabel(frame: CGRect.zero)
//        typeMealLabel.text = "nameLabel"
//        typeMealLabel.textColor = UIColor.white
//        typeMealLabel.translatesAutoresizingMaskIntoConstraints = false
        
        button = UIButton(type: UIButton.ButtonType.custom)
        button.setTitle("Take food photo", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(DetailMenuview.takePhoto), for: .touchUpInside)
        
        imageView = UIImageView(image: UIImage(named: "imagen1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
//        stackView = UIStackView(arrangedSubviews: [nameLabel,scheduleLabel,typeMealLabel])
//        stackView.alignment = .fill
//        stackView.distribution = .fill
//        stackView.axis = .vertical
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "Purple")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //ingredients = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
//        ingredients.automaticallyAdjustsScrollViewInsets = false
        
//        ingredients.center = self.view.center
//        ingredients = UITextView()
        
//        ingredients.textAlignment = NSTextAlignment.justified
        
//        ingredients.backgroundColor = UIColor.lightGray
        
//        ingredients.textColor = UIColor.white
//        ingredients.translatesAutoresizingMaskIntoConstraints = false
//        ingredients.text = "Muhcos ingredients"
        
        tableView.tableFooterView = UIView(frame: .zero)
        self.addSubview(imageView)
//        self.addSubview(stackView)
//        self.addSubview(ingredients)
        self.addSubview(tableView)
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
            
            imageView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -87),
            self.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: button.bottomAnchor , constant: 30.0),
            imageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 110),
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 200),
            tableView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 70),
            button.topAnchor.constraint(equalToSystemSpacingBelow: tableView.bottomAnchor, multiplier: 1.0),
            button.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor)

            
            
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.setRounded()
    }
    
    @objc func takePhoto() {
        self.delegate?.takePhoto()
    }
    
    
    weak var delegateTableView: UITableViewDelegate? {
        get {
            return tableView.delegate
        }
        set {
            tableView.delegate = newValue
        }
    }


    weak var dataSource: UITableViewDataSource? {
        get {
            return tableView.dataSource
        }
        set {
            tableView.dataSource = newValue
        }
    }

    func registerClass(cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        tableView.register(cellClass, forCellReuseIdentifier: identifier)
    }

    func dequeueReusableCellWithIdentifier(identifier: String) -> UITableViewCell? {
        return tableView.dequeueReusableCell(withIdentifier: identifier)
    }
    
}
