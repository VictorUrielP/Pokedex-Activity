//
//  MainViewController.swift
//  PokedexApp
//
//  Created by 1017143 on 08/11/22.
//

import UIKit

final class MainViewController: UITabBarController {
    
    var customViewControllers: [UIViewController] =  []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = customViewControllers
    }
}
