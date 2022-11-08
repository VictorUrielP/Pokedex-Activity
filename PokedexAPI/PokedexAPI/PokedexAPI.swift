//
//  PokedexAPI.swift
//  PokedexAPI
//
//  Created by Mayra Brenda Carreño Mondragon on 08/11/22.
//

import Foundation

public struct Pokemon: Decodable {
    
    public let id: Int
    public let name: String
    public let image: String
    public let weight: Int
    public let base_experience: Int
    public let types: [String]
    public let abilities: [String]
    
    public init(id: Int,
                name: String,
                image: String,
                weight: Int,
                base_experience: Int,
                types: [String],
                abilities: [String]) {
        self.id = id
        self.name = name
        self.image = image
        self.weight = weight
        self.base_experience = base_experience
        self.types = types
        self.abilities = abilities
    }
    
}

public final class PokedexAPI {
    func getPokemon() -> [Pokemon] {
        guard let url = Bundle(identifier: "com.Mayra.PokedexAPI")?.url(forResource: "pokemons", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let pokemons = try? JSONDecoder().decode([Pokemon].self, from: data)
        else {
            return []
        }
        return pokemons
    }
}
