//
//  PokemonCellViewDataAdapter.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 10/11/22.
//

import PokedexAPI
import UIKit

extension PokedexAPI {
    
    func adaptToPokemonCellViewData() -> [PokemonCellViewData] {
        getPokemons().map(map(pokemon:))
    }
    
    private func map(pokemon: Pokemon) -> PokemonCellViewData {
        let image = UIImage(named: pokemon.image, in: Bundle(identifier: "com.victorurielp.PokedexAPI"), with: nil)
        return PokemonCellViewData(image: image, name: pokemon.name)
    }
}
