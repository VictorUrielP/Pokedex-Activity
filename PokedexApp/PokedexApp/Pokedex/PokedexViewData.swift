//
//  PokedexViewData.swift
//  PokedexApp
//
//  Created by Fredy Dominguez on 10/11/22.
//

import PokedexAPI

struct PokedexViewData {
    private let pokedex = PokedexAPI()
    var pokemons: [PokemonCellViewData] {
        Array(pokedex.adaptToPokemonCellViewData(favoritePokemonCache: favoritePokemonCache)[...3])
    }
    
    private let favoritePokemonCache: FavoritePokemonCache
    
    init(favoritePokemonCache: FavoritePokemonCache) {
        self.favoritePokemonCache = favoritePokemonCache
    }
    
    func add(for pokemon: PokemonCellViewData) {
        if favoritePokemonCache.searchPokemon(with: pokemon.id) {
            favoritePokemonCache.deleteFavorito(favoritePokemon: FavoritePokemon(id: pokemon.id))
        } else {
            favoritePokemonCache.add(favoritePokemon: FavoritePokemon(id: pokemon.id))
        }
    }
}
