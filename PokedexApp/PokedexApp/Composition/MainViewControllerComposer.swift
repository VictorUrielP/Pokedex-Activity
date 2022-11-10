//
//  MainViewControllerComposer.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 08/11/22.
//

import UIKit

final class FavoritesPokemonViewControllerFactory {
    func make() -> UIViewController {
        let pokedexViewController = FavoritesPokemonViewController()
        let pokedexNavController = UINavigationController(rootViewController: pokedexViewController)
        return pokedexNavController
    }
}

final class MainViewControllerComposer {
    private let mainViewController = MainViewControllerFactory().make()
    private let pokedexViewController = PokedexViewControllerFactory().make()
    private let FavoritesViewController = FavoritesPokemonViewControllerFactory().make()
    
    func mainViewControllerComposed() -> UIViewController {
        pokedexViewController.tabBarItem.title = "Pokedex"
        pokedexViewController.tabBarItem.image = UIImage(systemName: "house")
        
        FavoritesViewController.tabBarItem.title = "Favorites"
        FavoritesViewController.tabBarItem.image = UIImage(systemName: "star.fill")
        mainViewController.customViewControllers = [pokedexViewController, FavoritesViewController]
        return mainViewController
    }
}
