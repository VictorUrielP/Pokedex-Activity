//
//  PokemonCellViewDataAdapter.swift
//  PokedexApp
//
//  Created by Victor Pacheco on 10/11/22.
//

import PokedexAPI
import UIKit

extension Pokemon {
    
    func adaptToPokemonCellViewData(favoritePokemonCache: FavoritePokemonCache) -> PokemonCellViewData {
        map(pokemon: self, favoritePokemonCache: favoritePokemonCache)
    }
    
    private func map(pokemon: Pokemon, favoritePokemonCache: FavoritePokemonCache) -> PokemonCellViewData {
        let image = UIImage(named: pokemon.image, in: Bundle(identifier: "com.victorurielp.PokedexAPI"), with: nil)
        let isFavorite = favoritePokemonCache.searchPokemon(with: pokemon.id)
        let favoriteImage = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        return PokemonCellViewData(id: pokemon.id, image: image ?? UIImage(), name: pokemon.name, favoriteImage: favoriteImage ?? UIImage())
    }
}

