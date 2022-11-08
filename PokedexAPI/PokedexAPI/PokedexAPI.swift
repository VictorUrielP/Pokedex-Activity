//
//  PokedexAPI.swift
//  PokedexAPI
//
//  Created by mvazquezl on 08/11/22.
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
    
    public final PokedexAPI {
        func getPokemon() -> [Pokemon] {
            return[]
        }
    }
    
}
