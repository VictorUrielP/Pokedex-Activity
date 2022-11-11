//
//  PokedexViewData.swift
//  PokedexApp
//
//  Created by Fredy Dominguez on 10/11/22.
//

import PokedexAPI

final class PokedexViewModel {
    private let pokedex = PokedexAPI()
    private let favoritePokemonCache: FavoritePokemonCache
    private(set) lazy var pokemons: [PokemonCellViewData] = Array(pokedex.adaptToPokemonCellViewData(favoritePokemonCache: favoritePokemonCache)[...9]) {
        didSet {
            didRecieveNewPokemons?()
        }
    }
    
    private var countPokemon: Int = 0
    private(set) lazy var allPokemons: [PokemonCellViewData] = Array(pokedex.adaptToPokemonCellViewData(favoritePokemonCache: favoritePokemonCache))
    
    var didRecieveNewPokemons: (() -> Void)?
    var shouldStartLoading: (() -> Void)?
    
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
    
    func didScrollTo(row: Int) {
        if row == pokemons.count - 1 && countPokemon < allPokemons.count {
            countPokemon = countPokemon + 10
            if countPokemon < allPokemons.count {
                shouldStartLoading?()
                let newPokemons = Array(pokedex.adaptToPokemonCellViewData(favoritePokemonCache: favoritePokemonCache)[countPokemon...countPokemon + 9])
                pokemons.append(contentsOf: newPokemons)
            } else {
                didRecieveNewPokemons?()
            }
        } else {
            return
        }
    }
}
