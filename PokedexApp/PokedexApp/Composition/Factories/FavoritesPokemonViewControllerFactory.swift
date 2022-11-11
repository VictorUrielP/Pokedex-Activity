//
//  FavoritesPokemonViewControllerFactory.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 10/11/22.
//

import UIKit

final class FavoritesPokemonViewControllerFactory {
    func make() -> UIViewController {
        let pokedexViewController = FavoritesPokemonViewController()
        let pokedexNavController = UINavigationController(rootViewController: pokedexViewController)
        return pokedexNavController
    }
}
