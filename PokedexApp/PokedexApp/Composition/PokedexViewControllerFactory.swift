//
//  PokedexViewControllerFactory.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 08/11/22.
//

import UIKit

final class PokedexViewControllerFactory {
    func make(favoritesPokemonCache: FavoritePokemonCache) -> UIViewController {
        let pokedexViewController = PokedexViewController()
        let pokedexViewData = PokedexViewData(favoritePokemonCache: favoritesPokemonCache)
        pokedexViewController.pokedexViewData = pokedexViewData
        let pokedexNavController = UINavigationController(rootViewController: pokedexViewController)
        return pokedexNavController
    }
}
