//
//  TabOneViewController.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/17/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

class TabOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Home"
        
        UINavigationBar.appearance().tintColor = UIColor.red
        UINavigationBar.appearance().backgroundColor = UIColor.red
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
