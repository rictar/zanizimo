//
//  ZanizimoTabBarController.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/17/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

class ZanizimoTabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = TabOneViewController()
        
        let tabOneBarItem = UITabBarItem(title: "Home", image: UIImage(named: "calendar"), selectedImage: UIImage(named: "calendar"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = TabTwoViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab two
        let tabThree = TabThreeViewController()
        let tabThreeBarItem3 = UITabBarItem(title: "Trophy", image: UIImage(named: "trophy"), selectedImage: UIImage(named: "trophy"))
        
        tabThree.tabBarItem = tabThreeBarItem3
        
        // Create Tab two
        let tabFour = TabFourViewController()
        let tabFourBarItem4 = UITabBarItem(title: "Share", image: UIImage(named: "people"), selectedImage: UIImage(named: "people"))
        
        tabFour.tabBarItem = tabFourBarItem4
        
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
        UITabBar.appearance().tintColor = UIColor(named: "Orange")
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance().barTintColor = UIColor.black
        
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }

}
