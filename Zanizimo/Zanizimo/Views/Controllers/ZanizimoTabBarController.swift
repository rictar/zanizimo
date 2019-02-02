//
//  ZanizimoTabBarController.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/17/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

class ZanizimoTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        UITabBar.appearance().tintColor = UIColor(named: "Orange")
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().barTintColor = UIColor(named: "Purple")
        UITabBar.appearance().isTranslucent = false
        
        let tabOne = CalendarViewController()
        let tabOneBarItem = UITabBarItem(title: "Home", image: UIImage(named: "calendar"), selectedImage: UIImage(named: "calendar"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        let storyboard = UIStoryboard(name: "Form", bundle: nil)
        let tabTwo = storyboard.instantiateViewController(withIdentifier: "formViewController")
        let tabTwoBarItem2 = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings"))
        tabTwo.tabBarItem = tabTwoBarItem2
        
        let tabThree = TrophiesViewController()
        let tabThreeBarItem3 = UITabBarItem(title: "Trophy", image: UIImage(named: "trophy"), selectedImage: UIImage(named: "trophy"))
        
        tabThree.tabBarItem = tabThreeBarItem3
        
        let tabFour = ShareViewController()
        let tabFourBarItem4 = UITabBarItem(title: "Share", image: UIImage(named: "people"), selectedImage: UIImage(named: "people"))
        
        tabFour.tabBarItem = tabFourBarItem4
        
        let controllers = [UINavigationController(rootViewController: tabOne),tabThree, tabFour,tabTwo]
        
        self.viewControllers = controllers
    }
}


