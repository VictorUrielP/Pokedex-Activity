//
//  PokedexAPI.swift
//  PokedexApp
//
//  Created by Fredy Dominguez on 10/11/22.
//

import UIKit
import PokedexAPI

extension PokedexAPI {
    
    func getCellViewData() -> [PokemonCellViewData] {
        getPokemons().map { pokemon in
            let image = UIImage(named: pokemon.image, in: Bundle(identifier: "com.victorurielp.PokedexAPI"), with: nil)
            return PokemonCellViewData(image: image, name: pokemon.name)
        }
    }
}

