//
//  MainViewControllerComposer.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 08/11/22.
//

import UIKit

final class MainViewControllerComposer {
    private let mainViewController = MainViewControllerFactory().make()
    private let pokedexViewController = PokedexViewControllerFactory().make()
    
    func mainViewControllerComposed() -> UIViewController {
        pokedexViewController.tabBarItem.title = "Pokedex"
        pokedexViewController.tabBarItem.image = UIImage(systemName: "house")
        mainViewController.customViewControllers = [pokedexViewController]
        return mainViewController
    }
}
