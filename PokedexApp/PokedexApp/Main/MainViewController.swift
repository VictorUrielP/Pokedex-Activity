//
//  MainViewController.swift
//  PokedexApp
//
//  Created by mvazquezl on 08/11/22.
//

import UIKit

class MainViewController: UITabBarController {

    var customViewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = customViewControllers
       
    }
  
}
