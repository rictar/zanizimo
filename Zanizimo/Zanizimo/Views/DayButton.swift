//
//  DayButton.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/26/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

import UIKit
class DayButton: UIButton {
    
    let contentView = ContentView()
    
    let selectionIndicatorView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    
    var contentMargin: CGFloat = 2 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        selectionIndicatorView.isUserInteractionEnabled = false
//        selectionIndicatorView.backgroundColor = .clear
        //selectionIndicatorView.backgroundColor = UIColor.orange
//        contentView.layer.cornerRadius = 15
//        self.layer.cornerRadius = 15
        //selectionIndicatorView.layer.cornerRadius = 30
        selectionIndicatorView.layer.cornerRadius = 20
        self.clipsToBounds = true
        selectionIndicatorView.layer.masksToBounds = false
//        selectionIndicatorView.layer.shadowColor = UIColor.white.cgColor
//        selectionIndicatorView.layer.shadowOpacity = 1.0
//        selectionIndicatorView.layer.shadowRadius = 1.0
//        selectionIndicatorView.layer.shadowOffset = CGSize(width: 0, height: 0)
        addSubview(selectionIndicatorView)
        selectionIndicatorView.isHidden = false
        
        contentView.isUserInteractionEnabled = false
        addSubview(contentView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = min(bounds.width, bounds.height) - contentMargin * 2
        contentView.frame = CGRect(x: (bounds.width - size)/2, y: (bounds.height - size)/2, width: size, height: size)
        selectionIndicatorView.frame = contentView.frame
        selectionIndicatorView.layer.shadowPath = CGPath(__byStroking: UIBezierPath(ovalIn: selectionIndicatorView.bounds.insetBy(dx: -1, dy: -1)).cgPath, transform: nil, lineWidth: 1.0, lineCap: .round, lineJoin: .round, miterLimit: 0)
    }
    
    override var isHighlighted: Bool {
        didSet {
            //selectionIndicatorView.backgroundColor = UIColor.orange
            //contentView.alpha = isHighlighted ? 0.3 : 1.0
        }
    }
    
    override var isSelected: Bool {
        didSet {
            selectionIndicatorView.backgroundColor = isSelected ? UIColor.orange : UIColor.clear
//            selectionIndicatorView.layer.shadowColor = isSelected ?UIColor.orange.cgColor:UIColor.white.cgColor
        }
    }
    
}
