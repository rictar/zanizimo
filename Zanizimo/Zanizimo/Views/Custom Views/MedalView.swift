//
//  MedalView.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/21/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

class MedalView: UIImageView {
    
    lazy var medalImage: UIImage = self.createMedalImage()
    
    var colorName = "color"
    var number = "1"
    
    
    func createMedalImage() -> UIImage {
        
        debugPrint("creating Medal Image")
        let size = CGSize(width: 120, height: 200)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        let darkColor = UIColor(named: "dark\(colorName.capitalizingFirstLetter())")
        let color = UIColor(named: "\(colorName)")
        let lightColor = UIColor(named: "light\(colorName.capitalizingFirstLetter())")
        
        let shadow:UIColor = UIColor.black.withAlphaComponent(0.80)
        let shadowOffset = CGSize(width: 2.0, height: 2.0)
        let shadowBlurRadius: CGFloat = 5
        
        context.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadow.cgColor)
        
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        let lowerRibbonPath = UIBezierPath()
        lowerRibbonPath.move(to: CGPoint(x: 0, y: 0))
        lowerRibbonPath.addLine(to: CGPoint(x: 40, y: 0))
        lowerRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
        lowerRibbonPath.addLine(to: CGPoint(x: 38, y: 70))
        lowerRibbonPath.close()
        UIColor.red.setFill()
        lowerRibbonPath.fill()
        
        let claspPath = UIBezierPath(roundedRect: CGRect(x: 36, y: 62, width: 43, height: 20), cornerRadius: 5)
        claspPath.lineWidth = 5
        darkColor?.setStroke()
        claspPath.stroke()
        
        let medallionPath = UIBezierPath(ovalIn: CGRect(x: 8, y: 72, width: 100, height: 100))
        context.saveGState()
        medallionPath.addClip()
        
        let colors = [darkColor?.cgColor, color?.cgColor, lightColor?.cgColor] as CFArray
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors, locations: [0, 0.51, 1])!
        context.drawLinearGradient(gradient, start: CGPoint(x: 40, y: 40), end: CGPoint(x: 100, y: 160), options: [])
        context.restoreGState()
        
        
        var transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        transform = transform.translatedBy(x: 15, y: 30)
        medallionPath.lineWidth = 2.0
        
        
        medallionPath.apply(transform)
        medallionPath.stroke()
        
        
        let upperRibbonPath = UIBezierPath()
        upperRibbonPath.move(to: CGPoint(x: 68, y: 0))
        upperRibbonPath.addLine(to: CGPoint(x: 108, y: 0))
        upperRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
        upperRibbonPath.addLine(to: CGPoint(x: 38, y: 70))
        upperRibbonPath.close()
        
        UIColor.blue.setFill()
        upperRibbonPath.fill()
        
        
        let numberOne = number as NSString
        let numberOneRect = CGRect(x: 47.5, y: 100, width: 50, height: 50)
        let font = UIFont(name: "Arial", size: 60)!
        let numberOneAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: darkColor
        ]
        numberOne.draw(in: numberOneRect, withAttributes: numberOneAttributes as [NSAttributedString.Key : Any])
        
        context.endTransparencyLayer()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func showMedal(show:Bool) {
        image = show == true ? medalImage : nil
    }
    
}
