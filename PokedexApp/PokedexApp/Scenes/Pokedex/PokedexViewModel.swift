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
    private lazy var pokemons: [Pokemon] = Array(pokedex.getPokemons()[...9]) {
        didSet {
            didRecieveNewPokemons?()
        }
    }
    
    private var countPokemon: Int = 0
    private(set) lazy var allPokemons: [Pokemon] = pokedex.getPokemons()
    
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
                let newPokemons = Array(pokedex.getPokemons()[countPokemon...countPokemon + 9])
                pokemons.append(contentsOf: newPokemons)
            } else {
                didRecieveNewPokemons?()
            }
        } else {
            return
        }
    }
    
    func pokemonCellViewData(at index: Int) -> PokemonCellViewData {
        pokemons[index].adaptToPokemonCellViewData(favoritePokemonCache: favoritePokemonCache)
    }
    
    func pokemonsCount() -> Int {
        pokemons.count
    }
}

extension PokedexViewModel: FavoriteSelectDelegate {
    func didPressFavoriteButton(for pokemon: PokemonCellViewData) {
        self.add(for: pokemon)
        self.didRecieveNewPokemons?()
    }
}
