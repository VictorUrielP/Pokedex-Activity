//
//  PokedexViewControllerFactory.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 08/11/22.
//

import UIKit

final class PokedexViewControllerFactory {
    func make() -> UIViewController {
        let pokedexViewController = PokedexViewController()
        let pokedexNavController = UINavigationController(rootViewController: pokedexViewController)
        return pokedexNavController
    }
}
