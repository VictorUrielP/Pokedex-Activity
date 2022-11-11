//
//  FavoritePokemonCache.swift
//  PokedexApp
//
//  Created by 1028092 on 10/11/22.
//

import Foundation
final class FavoritePokemonCache {
    var favoritepokemons: [FavoritePokemon] = []
    
    
    func add(favoritePokemon: FavoritePokemon) {
        favoritepokemons.append(favoritePokemon)
    }
    
    func deleteFavorito(favoritePokemon: FavoritePokemon) {
        guard let index = favoritepokemons.firstIndex(where: {$0.id == favoritePokemon.id}) else { return }
        favoritepokemons.remove(at: index)
    }
    
    func searchPokemon(with id: Int) -> Bool {
        !favoritepokemons.filter( { $0.id == id }).isEmpty
        
    }
}

struct FavoritePokemon {
    let id: Int
}
