//
//  MainViewControllerComposer.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 08/11/22.
//

import UIKit

final class MainViewControllerComposer {
    private let favoritePokemonCache = FavoritePokemonCache()
    private let mainViewController = MainViewControllerFactory().make()
    private let favoritesViewController = FavoritesPokemonViewControllerFactory().make()
    private lazy var pokedexViewController = PokedexViewControllerFactory().make(favoritesPokemonCache: favoritePokemonCache)
    
    func mainViewControllerComposed() -> UIViewController {
        pokedexViewController.tabBarItem.title = "Pokedex"
        pokedexViewController.tabBarItem.image = UIImage(systemName: "house")
        
        favoritesViewController.tabBarItem.title = "Favorites"
        favoritesViewController.tabBarItem.image = UIImage(systemName: "star.fill")
        mainViewController.customViewControllers = [pokedexViewController, favoritesViewController]
        return mainViewController
    }
}
