//
//  PokemonCellController.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 10/11/22.
//

import UIKit

final class PokemonCellController: UITableViewCell {
    static let identifier = String(describing: PokemonCellController.self)
    
    @available(iOS 14.0, *)
    func configured(with pokemon: PokemonCellViewData) -> UITableViewCell {
        var config = defaultContentConfiguration()
        config.text = pokemon.name
        config.image = pokemon.image
        config.imageProperties.maximumSize = .init(width: 80, height: 80)
        contentConfiguration = config
        return self
    }
}
