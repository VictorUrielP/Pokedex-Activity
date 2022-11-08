//
//  MainViewController.swift
//  PokedexApp
//
//  Created by Mayra Brenda Carreño Mondragon on 08/11/22.
//

import Foundation
import UIKit

final class MainViewController: UITabBarController {
    
    var customViewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = customViewControllers
    }
}
