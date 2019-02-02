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
        selectionIndicatorView.layer.cornerRadius = 20
        self.clipsToBounds = true
        selectionIndicatorView.layer.masksToBounds = false
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
    
    
    override var isSelected: Bool {
        didSet {
            selectionIndicatorView.backgroundColor = isSelected ? UIColor.orange : UIColor.clear
        }
    }
    
}
